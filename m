Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13ADC36010
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 06:17:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6728D10E1D6;
	Mon,  7 Apr 2025 06:17:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cw1/4I5k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09BD210E1D6
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 06:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744006672; x=1775542672;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dMa7eEFWOJqmL2O4xc5o2uneNn/QET6D4tw0HpmgzoA=;
 b=Cw1/4I5kM80LC7pyiM49QW0E6+Q4Kh0diq5FUNUZ7lmkks2jcX2RHZTu
 YjWrCQuedixljjYmoWp85+n6j5GB7O2xooUsg4kGa4x6wUaZgaISeYjsN
 PPY2yL/otyVfO+gK4Q4F1MM8YVOHno+Wk+ONMJn0zrsbalz7FUEw5Zt1D
 WT99+l0+GpR0RAO82qbCwiNwAFZ58q4Vy9JBWnXXy03ODeT6NElzbAKtB
 EdEV9ECHViHJ7RuuejJyY37+XgleBsF0C3J9Ib8+oNt0IENbHI8EGR1uM
 YiFHkXprkutbVni1ppXHoSn39MQgaoZoeAeMj5Oy8zdv31QJTGmxvtOyv Q==;
X-CSE-ConnectionGUID: JhWumwBUQ4OgnqwuaDEh8g==
X-CSE-MsgGUID: MI7rETJCQpGjyNl5BC216g==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56008374"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="56008374"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 23:17:52 -0700
X-CSE-ConnectionGUID: eRNB8aspSPm4H53uSGX2pA==
X-CSE-MsgGUID: OwiqTttqRO6AZk56V51Asw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="127837240"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 23:17:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 6 Apr 2025 23:17:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 6 Apr 2025 23:17:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 6 Apr 2025 23:17:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iRwmwDuHRpYZB5MEFLifX9mu2QBpB4IYB6m0tHTS4McxTvfKikhmYmf37alkVjoQNw2aoMYx0SDAnDTjhcWOrx98MmP/O//8+Agea4vZL5QDNi9SoI+ewPYoTBJzwMJ786x68tzDbQe3vxWPRwQ0m08ALW0KX1+Kotps2zeGx/zNE4FYZwFUL+aB2omIl2qfqVVyNDg82zv9FodkUDuhzqify0qLW6BTO42DGcUEHIpIxW+HCX11oIIgljbJnEZ+O4SOcpm24q9zK+ErdpW+62JrolTaTRlbNXe4bQRTjJxV0MHx2B+qsgJDJEIaEF1XKEx2mwmytnDPCx4Ico2R0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N70SGaZOaIOH1r7FhtpV8XfvAtDo7WnJF1lengQdaC4=;
 b=FC+//m2qtejkYRdBcLEL6hugylB7iojbTH85pXHPiPaBfgaWPeSGU78F0mjGzLzwZohfwDeLLcYA5tz2K31M0uV2f4IrN39a4l1uiWAGFSTxe2QfDhFcyNluW66Ui3JEdGKgYZ0l2KZP906tPlotvm4N4RtvJ7uZO0K3vL0LHxQWN74EsIz9NBL6CXdqZ5HuKVC2QDdToElPEKoYF31+Vezmev+UEDAAL1nwXb+MtfF85q5ZXrtbS5Ghr6tE23z9rDjyVBeCo4kISoXY0e9Ma+JDF81zSbn2izCQbknrd/POm3BX6Yzi+LBdOxZs2EGU54twqCEpzUpMp29G1clzdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB7203.namprd11.prod.outlook.com (2603:10b6:610:148::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 06:17:02 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8583.045; Mon, 7 Apr 2025
 06:17:01 +0000
Message-ID: <ff3bdcaf-ffa9-4676-bcf3-a52c16d364f3@intel.com>
Date: Mon, 7 Apr 2025 11:46:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 08/29] drm/xe: Rename lookup_vma function to
 xe_find_vma_by_addr
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <oak.zeng@intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
 <20250314080226.2059819-9-himal.prasad.ghimiray@intel.com>
 <Z+73SkAyGHotMRry@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <Z+73SkAyGHotMRry@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::14) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB7203:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bfc77da-ce7b-4ce8-7670-08dd759bcf57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MkZKay9ocXRYVUgrcVBoQTJBeS9wTytndFdsdVVYaVJHYUpRTXZoV0NCOFZR?=
 =?utf-8?B?QkNncnRldUNkampLMHVUM3U0cFlJbldza3A1OXBYSHRXMUVrRWNZa1pRdW1w?=
 =?utf-8?B?clBsVjBRWUlSMnIwZ2FKdHExQnkzNEZkM0tRVlBFVCt4ZUZVY1FzeXRYOW1M?=
 =?utf-8?B?OE5NSEQrTnZZSUNyWk1VZDlUMk1XL1gxS0dQRC92MllUbGlqaTFYUHdQUjNt?=
 =?utf-8?B?cVhKb1hLZnpDRVVjU0dWYld4NjVQd1A5ZEhkNUpOVDA0NFNidUdja2JTMmVT?=
 =?utf-8?B?Z2puNmNCTW0xL00vRFNxbkEyaU12SmcyeCtpekxxM2djYXErRkF6NHg1cDdW?=
 =?utf-8?B?TkhPUXZZdU5TbnpIR3Nzd3NOSDU4WGZxSlFidEUvcnFVVnlTV3EwV2ZXTEkr?=
 =?utf-8?B?cGN2ZXdvVnlkd1FmRWFmTFRtUDZ5emg2d2l6UCtRRnBOcmY2TC95M2lod1RD?=
 =?utf-8?B?aTBDeVB1RU5rR0FCRmJ5YkJCeTlzQ0RQa01ZelZTTFlNK1Y1LzE3UVRGSUp0?=
 =?utf-8?B?aWJLRVphUjVQNkx1ZVRWbHVlc2Y3SWFKMTltSE5ES0NXblJlaDlMRGxFZkhh?=
 =?utf-8?B?QXBkS3hLM1htQTM3R2Ixekx5VUIzRGhYUVBkOHFOMURMNTV5T25OT05hMzJD?=
 =?utf-8?B?dmxiNlU2U1M3b1JYNmhZWlQxMEs5aHJZSVYrZ3F0N2txdHFsWTJrRS8vc2gw?=
 =?utf-8?B?L0pBUG94aXhBczFZdzlxeTlnc3RpT2NYY3pkdkxNVWd6Ynpzb2RBSWMyM1lx?=
 =?utf-8?B?NjRkdTUycE0rNmt1OVAveGkxbk9CaUF5aFg2SXZGZXIweEJqRmVGOWdTUFhN?=
 =?utf-8?B?T09vTk5kYUE2b3hacGJzblZUdzk3aTJncVoxYlZtTVR4U0M0M2FMcVBtVHRO?=
 =?utf-8?B?S3k2NndqMC96bitPby8wZ05BTXlLZTZxanZ4Mlc2SWJhM0xHTWFyTWFJSlVC?=
 =?utf-8?B?N2pMbCtFSlloYUkwOFRLR0NROGVTeUQ1TER1WTlYWmpGdWtHRnNLM1JLR0Yr?=
 =?utf-8?B?RG9WMFJMMEZNak5BaWIwMlJhZmFCM3VWQWN4cFUrQWdmQmVQaDFEVnpBYmVH?=
 =?utf-8?B?N0Zwdm9INXZWWFNIb0I5b1UvanZUWDhmdWNQLzYyQjJqdHlBZFhIZE1idnFa?=
 =?utf-8?B?ZXY5V1hPcEtYRHhPelNqbjlmVzZlbUNjUExZUkFPeDdJQVVKRGZRbzFwNDk4?=
 =?utf-8?B?M1JPWHNxeENhcVVGVGhOcG90WHVUNG45WlAwNnpOTVRGeG8rN1gwYVlyNFNL?=
 =?utf-8?B?Szl5VHZ1Rm0rSjB3SEkxM3NoZFNPM3lKS1RHK1ErNjJ1MkFBK0U4RmdTaDlY?=
 =?utf-8?B?NXpXTWk2VldZMW5kbWJvM2p2UjJINXNmaldZcytrOW85WDh2a1N3ek5sU1NG?=
 =?utf-8?B?RjhJanJXMkE0TGZPZG03NTZZNTliK0pOMlBsc0FyNlY1VjljZERYUXdNd2Iw?=
 =?utf-8?B?VWQvRTl2SHMyQmdwcFRnaG1icDk5MGFnb2tGWmdoL2FSeFZRZk9QT09Ddnlw?=
 =?utf-8?B?ZDIvd0J4S0V4N05odmtXMlZtd3QzeTZtcldXU2lyYTNLTUcySWpLUWdYRllS?=
 =?utf-8?B?VkZVZ3VCN0U3TWREVUlkalFGSVh2cHZLYlNaYTZ6cWJuMGRHa2I3dDEwWndi?=
 =?utf-8?B?Ujh6L0JESU9KK1VFTnVzUXhqNysvWlhkRGZVcnFIOU1ZeDZSaUY0VnJlbWRp?=
 =?utf-8?B?cnRXSnpPRlFJR0hBczhIdUhpbU0va0V0dHB5S0V6OTF3bVcxSjF2R2hXYkM1?=
 =?utf-8?B?WjF6ejNxN2ltU3NkaGdFc0lkUWV2cVkxd082TGRtSEdDaVZ3Y0ttbHpDOHVB?=
 =?utf-8?B?SC9CUlFQODU1RlVIRDdLZHBUSlBuUUUzKzJZVjk0WTJsTCt1dGdNa25URG82?=
 =?utf-8?Q?MyLSMlGOfjxzp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K083QjZ5bldxa2RVc0Jpd05DNGNYUndOS0JuNGg2SG10V1A1REUzWUYrK1Na?=
 =?utf-8?B?NjgwaE9ITnRnT2RoSDkzTFZLWmVXNVVPbjhneHczV2g4RkVJeG9ONEx6OG14?=
 =?utf-8?B?bVNLTVo0S2owN05vVkV3dU4xOERTdVZJWHJHU2JST0VrZlVab2x5SUZSalBU?=
 =?utf-8?B?VCt4VnVPRHhEZEVtalF1VUs1OWhZcFV3SDJMenhOOEY3blNKb2J6SCtrLzBC?=
 =?utf-8?B?d05MRFUrUldqcTlzUm8wSjVMVDQ3YTVaUS9QUDE5YWtFckhSdFpqTTBEMEhp?=
 =?utf-8?B?ZlJlWGlWY1hFVW9JS043ZTM2RDJ5TlVZam9XVVZ2alJlbUh3WmhHNkxiWS9N?=
 =?utf-8?B?Z1pFRDZaY3V0NFd0OWo4TnZwdFpwT0NnT0NNY3pvNDRpZUNHWXJaUi80eEhM?=
 =?utf-8?B?bDJpWnROdGFoNkMrN3BET1pPNHV6UDlaU0hyOElQQkhTRnFNQU1oUTRBMVdY?=
 =?utf-8?B?TjdLdmxzSm9zQzZ6dDZacDBNM3dXdUJGYmNEeUNraDYweTZYSjBHTmtzNjly?=
 =?utf-8?B?Uzd3VjZUaXB6cWwyVjA5L25hZVAzVTJya09lcTBSa0R2OEp2dkhCQ0QvRHBM?=
 =?utf-8?B?Q0pPME5UUjVvSFJjRXRlRis1aENGS1FNSy85YUpzazY1eGR3bkR5TUVaeTMr?=
 =?utf-8?B?Rkd6YmpHeHhsNlBKU3R6OUkyV2ZENUg0b0lkSFU5VUh1QWJ1N0hSbVlFTys1?=
 =?utf-8?B?NWZGTHJlNTVlS3I0V3I1dHNRUGtCa2ZoUFFKWWNYeDRIS0JodlliSHc5Y095?=
 =?utf-8?B?Sm0wWDJHelptb0x6SHpuVDNtd0l6NGo3WmF5bWdJMmc3SzAyOW5oUEVQclQ4?=
 =?utf-8?B?dGo1WnFtR0MvWEdvY2V5c0FpZlFWcVJTWEFZQ2V0UXV3dVZ4dVlsaENndFNu?=
 =?utf-8?B?Yys5eDFldTdOalZSK0oySklnelVuWHpGWG9oeC9oSEVTeTZvRTRxS0lhZGMw?=
 =?utf-8?B?RHFEMnJ4NEdZL252a3AvRkRuTW5RdEpoSWpUNnd2NXFMRzNaZUU2aXJQT0JR?=
 =?utf-8?B?UktUUmtVMkYyQmI1Z1cwUkpnbForWEYyUVNXNHFMVE14SFFTMnlrYlVUajZI?=
 =?utf-8?B?eGdiU0pIZk5BZVQ3YTMvRjF3VmNmamczY3VBLzU4eXhpTXAvRzJ6SmlMZFFL?=
 =?utf-8?B?SXNnQm91TjFCR2RSUno0cFZlU244MnF0THNhT3lJMDdOUWZzZUEwVm1wRHZa?=
 =?utf-8?B?emJYL0RZU0t2RXMxSVlsMTlNam5QYkxsTnNwMXk4T3Y1Qm05b1NIVDhsTkZO?=
 =?utf-8?B?OFdvdi9MeXQwTmMyczVIMGJod05adlVyN1NtbnMyMmJxZXhRNk5HR2hsTDF6?=
 =?utf-8?B?MkMzOW55dXdmR3l2OWZvSHlFM1dHVXNRV1pkc2wzSXRuYVJCM0ltL0cwZ2Y2?=
 =?utf-8?B?djRkdkZ1ZStROFgwcVFJZTkwcVA2NGNqbEV3alpvZTF2NTI3VitjK21majVI?=
 =?utf-8?B?RTE2YkRLalMveVdYR3I4eDlBcWNrUlZGWTBCM0JpUE9DZ3d5OEZtSkdHMUoz?=
 =?utf-8?B?aXZ1dXNydk0yRWpCVU1NWnpoMlhQajJMSnhaZlRSVldMaWFkd0J6TVViUWhR?=
 =?utf-8?B?NE5vMFdOK0dlQTlDeG52QytXdS9wTEdNUURITE9XeHE5S1hFNlpoUXA3QmVG?=
 =?utf-8?B?YXBGY0NuWVNRRXdmUGV0VjYxZ2tGYzJhUjlKNEc5bm0xSWZpL0Z5c2VLSk5y?=
 =?utf-8?B?YW5sN0NsTE9JUnJuc2NYa3ROR0l1bWdaR3o4a2IrZzNJU2pubmpGWVQ2Umx4?=
 =?utf-8?B?aFB6VnRSR0pRRjZnanJCbmhIV2Y2Y1RCTW8xWTArRnhYcDFpSHVFdGpLdXlR?=
 =?utf-8?B?ZHpLWDVYN0dWMWxXRmFwY20rVERDb0VHdlBoR2tTcVFiOURZZ1U3eEJpbmt3?=
 =?utf-8?B?Y3RnaERGNHhQTll3TGVwRitDMUVCS2NpOFh2UEN6SllsRktTRXhhU1NINkdL?=
 =?utf-8?B?SEFrandseGY1SXZlSFBuTURoOE8rS09oRkdyUXRxTWkrdm9MOTR0ayt3c0ho?=
 =?utf-8?B?aWNwUWVtcE9YbEN5d1RBZ1VsRWMvcGw3c1orUGN4Zm5Oc0crQWMvTXAyOVdh?=
 =?utf-8?B?TEtCb1ZJK01Zd01XU2x2enI1c3Q5L2VXa245aUpOaDR3SzJnUGtZdXJZc1dr?=
 =?utf-8?B?T0V0alMwK2dyWmxUdEdQVjZQN0tNOGZDaGtTdnpWamlvQm13QlVzWVpWWXVQ?=
 =?utf-8?Q?PBRPGqvo0AqijHKE1Cn00v4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bfc77da-ce7b-4ce8-7670-08dd759bcf57
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 06:17:01.8569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mS1BBECBrvuopSYIPPdFvZhDXwfc7jemq6U8LfN2DSTR7Ddci9u3/Z51oPyMsHtUgN78fIuBcmih2sA56ECpBUToO3tnaOxonnXQMvShPFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7203
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 04-04-2025 02:32, Matthew Brost wrote:
> On Fri, Mar 14, 2025 at 01:32:05PM +0530, Himal Prasad Ghimiray wrote:
>> This update renames the lookup_vma function to xe_vm_find_vma_by_addr and
>> makes it accessible externally. The function, which looks up a VMA by
>> its address within a specified VM, will be utilized in upcoming patches.
>>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
> Side note just noticed there are multiple version of the list of this
> patch but no versioning which then I accidentally replied to older
> patches. Next rev, please include versioning.

Will make sure of it. Thanks

> 
> Matt
> 
>> ---
>>   drivers/gpu/drm/xe/xe_gt_pagefault.c | 24 +----------------------
>>   drivers/gpu/drm/xe/xe_vm.c           | 29 ++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_vm.h           |  2 ++
>>   3 files changed, 32 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> index c5ad9a0a89c2..3aaf4090fcfe 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> @@ -72,28 +72,6 @@ static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
>>   		!(BIT(tile->id) & vma->tile_invalidated);
>>   }
>>   
>> -static bool vma_matches(struct xe_vma *vma, u64 page_addr)
>> -{
>> -	if (page_addr > xe_vma_end(vma) - 1 ||
>> -	    page_addr + SZ_4K - 1 < xe_vma_start(vma))
>> -		return false;
>> -
>> -	return true;
>> -}
>> -
>> -static struct xe_vma *lookup_vma(struct xe_vm *vm, u64 page_addr)
>> -{
>> -	struct xe_vma *vma = NULL;
>> -
>> -	if (vm->usm.last_fault_vma) {   /* Fast lookup */
>> -		if (vma_matches(vm->usm.last_fault_vma, page_addr))
>> -			vma = vm->usm.last_fault_vma;
>> -	}
>> -	if (!vma)
>> -		vma = xe_vm_find_overlapping_vma(vm, page_addr, SZ_4K);
>> -
>> -	return vma;
>> -}
>>   
>>   static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
>>   		       bool atomic, unsigned int id)
>> @@ -231,7 +209,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>>   		goto unlock_vm;
>>   	}
>>   
>> -	vma = lookup_vma(vm, pf->page_addr);
>> +	vma = xe_vm_find_vma_by_addr(vm, pf->page_addr);
>>   	if (!vma) {
>>   		err = -EINVAL;
>>   		goto unlock_vm;
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index b83154d338c7..07cad2804b14 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -2135,6 +2135,35 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>>   	return err;
>>   }
>>   
>> +static bool vma_matches(struct xe_vma *vma, u64 page_addr)
>> +{
>> +	if (page_addr > xe_vma_end(vma) - 1 ||
>> +	    page_addr + SZ_4K - 1 < xe_vma_start(vma))
>> +		return false;
>> +
>> +	return true;
>> +}
>> +
>> +/**
>> + * xe_vm_find_vma_by_addr() - Find a VMA by its address
>> + *
>> + * @vm: the xe_vm the vma belongs to
>> + * @page_address: address to look up
>> + */
>> +struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr)
>> +{
>> +	struct xe_vma *vma = NULL;
>> +
>> +	if (vm->usm.last_fault_vma) {   /* Fast lookup */
>> +		if (vma_matches(vm->usm.last_fault_vma, page_addr))
>> +			vma = vm->usm.last_fault_vma;
>> +	}
>> +	if (!vma)
>> +		vma = xe_vm_find_overlapping_vma(vm, page_addr, SZ_4K);
>> +
>> +	return vma;
>> +}
>> +
>>   static const u32 region_to_mem_type[] = {
>>   	XE_PL_TT,
>>   	XE_PL_VRAM0,
>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>> index 0ef811fc2bde..99e164852f63 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.h
>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>> @@ -169,6 +169,8 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
>>   		!xe_vma_is_cpu_addr_mirror(vma);
>>   }
>>   
>> +struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
>> +
>>   /**
>>    * to_userptr_vma() - Return a pointer to an embedding userptr vma
>>    * @vma: Pointer to the embedded struct xe_vma
>> -- 
>> 2.34.1
>>

