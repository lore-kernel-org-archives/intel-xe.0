Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1487FCD6E6E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 14:14:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBB210E826;
	Thu, 13 Nov 2025 14:14:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cNBqcIAS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FDD10E826
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 14:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763043274; x=1794579274;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=ePy3XdOZ9mdekAPQKDTPE8JOrTSLwDQkzKeHY1yPGuc=;
 b=cNBqcIASOOiibMcKwRb6dAOhrizKYzKPW/oOBuPwTtaIs23t7PigSyie
 h3SYITtYx6ABs+Jm8OYfXghlCGrMnO/VundZSUTeyLZvsjPaWHj5JPqEF
 kggJIqx2cqik0qKxQ8gJsbbAZpZXW316xGShYpA1eQMl2X8ucudIwL7PT
 ZbBB9947BU476g0nh2unng+vjz3sqQBEDF7Iu51HF1+3ZGg+pmb4InHhj
 XobNRsKdkGkSHQOj/tooMC+MAXFCGrin3aWu14mP5+/q7TuJkUEAfVITD
 AKHQMRr80fUJuCgYup4RQv1q+XpUQ8Qg5n4q/KYaXzEvpGTdoUdM/06nb A==;
X-CSE-ConnectionGUID: 9Tpia8MiQn6rJL97SmprLA==
X-CSE-MsgGUID: xSjei04nRHymoXjyQwX6IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65030020"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="65030020"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 06:14:33 -0800
X-CSE-ConnectionGUID: TYGNX/SbR6WPMZ0tp4zgPQ==
X-CSE-MsgGUID: Ac1LkkK+TXuF3bDjjayN1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="220312422"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 06:14:33 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 06:14:33 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 06:14:33 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 06:14:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mEMo8KT62T/1r1QPb1VZB9VpmHOwNVVKsWn6wZ5cFwKsIz5bSU6NxAhdfw3Ip/S81swRlNUOheH1FHz60eKSN67C7Roxg61CCR22DrIEjsyGD5Wstx7vXgI0AymsZOz1m6LIeZPm3ZHuG0BdS32pb8bpI7Syb8I42LnGf6yWcvcAyZDtXdeR0QhKefLViO0gW13Uug4cIiPgB+pH5kpMPOAY/y4MGbprF+LxjFqCbn/cNcF8XFzarbYXCXRqN6udWXU1OQ8hGcn7QH8l4gK4Wc0Pqukdq73vpXHQxQonxKh+dUufskoqvmhjvppMGw2+eUboC+Jo46yglPbq6YIN1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8OyA7hW+2OmBd6NLtRPN7TuxUZYZjj1xLbVg8l7Sb2g=;
 b=vYm8rbPnwxskjp6d1yE4HdLQtsaj0CW66uBLk5FEQGo5KlrC+VK0i29lmdKB3KvfawwUjnaFllsEHr/RMMyNEGP6TzPfswqLh0SbE2EWpnb2JoGcx2NtIgSGvLJEXE6EhB2bjguRHyO9WffbRWynvizDxHBILIhPxd6/I4BtqbU4yTvwE+JIPDQnGnPmY/UMtVrGVK/OB06ek+57IatYpEGJ/Yoy/PlMl8t7Xj5h0guVOiQNibIwc9wjxrxuTeS+rzN+ECgQ60y6K7b+uT+i5QJBy9N1uVGMAiM3jBHLTUQoF395wSis5iplvB2u7Ij9lbfxLhQoJ9/xBuHEo7nrgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CH3PR11MB7252.namprd11.prod.outlook.com (2603:10b6:610:144::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 14:14:22 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 14:14:22 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110232017.1475869-47-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-47-matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 15/30] drm/xe/devcoredump: Use scope-based cleanup
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 13 Nov 2025 11:14:04 -0300
Message-ID: <176304324487.3698.16197271036502887154@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BY5PR13CA0031.namprd13.prod.outlook.com
 (2603:10b6:a03:180::44) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CH3PR11MB7252:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ae1747b-5fef-4af3-520c-08de22bef193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RjRPbnZtNnp6UjFFWXk0WGxYV24vL1l3cXBWNmcwVmRWOVE3TmtleWYvK2NP?=
 =?utf-8?B?cGlFVEttWlloNWFHTVQrakxmbU55ZEo4SzVmZzcwYm1VWmIrTWVOZ2NLdzZF?=
 =?utf-8?B?azRyVzFXSTJFSTZCaHE2T203S2IwUkdWd0YrMlA3RFJLQTkvVjJhQm1Dc2VI?=
 =?utf-8?B?UVUrRXZ5QjZWb0FQRWdKOG1pTTZYRzBkMG1wQW5VdlVyRkNLWEJjZTN4ZmNx?=
 =?utf-8?B?U2xBTUR0SHNkNFI4ditYWDJOMlRYNVBYbCtpR05ESHFPQ0h5QXp4YTFkWDFt?=
 =?utf-8?B?M01lMnBFdnY1RkhjQTNnR1R1S2tIOW54bzlUUmhNS3dMYXA0YjZWTkVPbTlN?=
 =?utf-8?B?ZjJUcC83WVNBcU1nYitrNXBhR05mdnpCazNMdjByRXpjWnhXVnF5dEdxMlNk?=
 =?utf-8?B?b2tQVEhiZ1lncUthdmtNMEwwWmcxckkrS3loQVhjeVY1aDV5RmRBNThlS2Zo?=
 =?utf-8?B?NEtSUFUxeHozTGEwWkgrZmpuME5kSDBQUkRMVXh1N0NtTnVMeVRYL2dmekxQ?=
 =?utf-8?B?eXM2L3JBajRvdDZBd1RIYktIVnFaNXpzMVRkUU0rM2hqQkgzalpyTmtBTUxm?=
 =?utf-8?B?RHhqMGtkQ09FZEpQRWxQRFNqSEJKTXp0T0NUOERtd0hGdHNOOTFaMnRNK3px?=
 =?utf-8?B?V1pwcGRSblZkNkREbTdtZDdqd0cyWW44aWFiWU5ybHBqck8yRW9JVnlPZWlr?=
 =?utf-8?B?NzlKaTRCZXlKSW5nL1dHdUtFaUhkWWprZXN6TUl4bXk1dnUydXdzVDF1bHpD?=
 =?utf-8?B?c290aWp0Ly92VWM5OTJxVXZXMy80SkhWb1lrb3RkVm5MZUpiMEFmMUtNTG9r?=
 =?utf-8?B?TWVldkxmc1lJZzJZMlZmZmVaQUhBODNqSXk4L3ZGWU9nZFovQkRWWXZuRGxI?=
 =?utf-8?B?anQzMVVoNkNSazlwUkJBN0w5WWVLV1UzV0ZpOHNmQ3BCMHZab0pOeVhZN3V0?=
 =?utf-8?B?aHVKSkNGMENOeHpTSXkxVXZ4Y0pnWHgyTUJMTFRZWUNOU3VMNkFqQmhOM0NX?=
 =?utf-8?B?bGcrNEhaaTltczdXRFBWRTRKTXA4SkcxQjdMa01yUlQzRmhCa3Z2ZDl0ZDZD?=
 =?utf-8?B?bFRwWnRCdzN5V00vNldSUGxITmJkNDc1UnBKQkU3MG1lNHEzMEdid2FrUVpj?=
 =?utf-8?B?c0tDSEdYamlZc2hOcStvRzlmWmpuOTA1S2kyb1o5SXhDaVVsUWVWRkw4T1Vl?=
 =?utf-8?B?SVlRK3ZLV3lrSlM1K2ovK3hiODNiS0R5MVJFSnoxUlBMSStCdEg5aEV4Tkwz?=
 =?utf-8?B?WXNtM29WVDBKZmZuSWNhR29XMWpnQlFHMjVaWXZOK0V6WkhvS0NEckZESUw5?=
 =?utf-8?B?SGRTbkNUY2I1TFZqa1NIcWRWcWVVUkwxTXNRS3JsRGRWQTVBTFlmQ0w5TEds?=
 =?utf-8?B?UWx6UzJlcnpGdDBKWWZGdDFPeUk3Rmc0cnFSK2hkVTdCTitSSndDTnhKZHVu?=
 =?utf-8?B?RXZpSStzRXl0a1poa0tQSlpDbmJmVzZRQ1VYVkwzNFNsaGxDenl3dkVWYldz?=
 =?utf-8?B?RTM0cEpVY2l1TzBjVTJzZXozRXNTSisxS1p6YmR4NEJDWnlUN2Y4MURCd2t3?=
 =?utf-8?B?a1pReDV2RUpIQmI2L0FNaFR3MXVObU9PYm5SUS9JZWZwT3BLejIwVGdXS3cy?=
 =?utf-8?B?YmFWQSs2S2dBYVhBWDBPTXdjQU5kV0ZheWE0bEVLSkZDaWw3NTFVQzh1L1h6?=
 =?utf-8?B?cm1XRVBPNWx6YktRU3NNVHZyQkNmUWlnSENnSFlUWTQwSFc5L3pyNGNRRFd0?=
 =?utf-8?B?RlhsMTdlSUhLVGpaTDdGcElNTmQ5bm5sbWFscWNjeFFHY3A0ZXJMQ2s1Tmxa?=
 =?utf-8?B?NzVCbnV5dFBJWU40S1VZanJjUko3Z3NIMHVsVVVLZUpGVlE2QkUzRlFHWURN?=
 =?utf-8?B?WTFLWER4TGhPcGtlb1BoN095R1czaVBuWTFqWllISXYzc0QvRWtaY2p6V29U?=
 =?utf-8?Q?F+RnMvfjbiE8gubh8ASGhALKz1X2nGIx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S21oZ0VNMXpLdTZuSU1wMnlSbU9za0VEVE84TmRTN3B3SVdVN2o5eDdnTkxa?=
 =?utf-8?B?c1ZsYTV6Z0I5QnZpcVM3b0dqY3QrSXV0d1psNUhocnVMSXdSTllicG53VTdK?=
 =?utf-8?B?QUhIQ041WkpWR29RU2NqOVR4Ny9uUytveGlTT2EvUkQyenN4MnduZGxiYWRT?=
 =?utf-8?B?VGlJOHIyelJ3d1dwdmMwUHpYbjBOL2tqY1JtL1hPUS92ckxab0lKelRwUjlI?=
 =?utf-8?B?NHAvRzdxRzRFRTdlUU1sUmdwQlI4SUlSWUdJeWVJZ0ZFZGVQVFNCZjVVdkl0?=
 =?utf-8?B?M3kyaDM3NStiY05QUTZ4ZnlCcGx2ejgyRTk4U0RNYjg5VXVEZkhkZFo4MlB3?=
 =?utf-8?B?WkdjWmNheGJsaERnMUk5b0x4TE1JVlJkVmFFVDN3dkRJYUZiRi90TjhGeFNa?=
 =?utf-8?B?b2lHWHVOaGVaOXlIR1ZJaTI4ZU5XbkpFV2xkdWJKYk1ueDYzYkJVZUJ2My8x?=
 =?utf-8?B?U2hCYnE3VUpncWlQbkRjdDlpcjJIdXBNODZkaUVqbWFlNm9ETlY2alE5Uk5I?=
 =?utf-8?B?YWNVdzIwUktrMjhIMnl2eGVqUC9nZWltd2MyYnZFTW1CbUJJbVN4aUJDSTlm?=
 =?utf-8?B?TjVmZXpOTjlGdGZzTmdDOG1WeHp6NFAvRkpZN1UxZ1ZUUnpObUEvQUF4d0NI?=
 =?utf-8?B?eUtaUzBDRDIwRW5YK21ZY3pLejVzb1VzemY3S0ZFY0treGdIN3V0V1FaQzhG?=
 =?utf-8?B?QVhZWS94bTNjNDcvTXVVSkFUbWVHcENzYnMydjlpSEpBV2hJRTdRaCtkNnZz?=
 =?utf-8?B?YVd5ek51WXFOMno5MDRhLzZPOS84TmkzL0tZWGg3d1c3VkpJMnFOR1ZCMTZX?=
 =?utf-8?B?cEttcGFUTlVpVXJKZHVKbWlaT2hQV3JLWjdrMW5UMGtVMkNEcEpRN3FNaTJw?=
 =?utf-8?B?MlZubU96T0RyY0liY05pZ3phdDdFTGdQWndvdGY3Ty93V3ovYlRpWWxqWTVY?=
 =?utf-8?B?RkQ0L0dZbStOdERSSzVocEgyampwK2hLOUtDVStWS0Q4QlhMT0xHbVhkWG8y?=
 =?utf-8?B?SURGR2pKUVdNYnFTc3YrR2U3bGlvQ21SS3oyYlBTOXlzSG0xcW4zWXlEQjN5?=
 =?utf-8?B?bU5wNXpNcStrL3dFVFJqL2toRUVPa2VqYkVwdTdkUmhocVM2aGRhRUxuQVVn?=
 =?utf-8?B?ODFHTUM2WldMZ0RXa2M4MGg1LzN6bnAwNDFnNGlVSzJ2bUpxSVlPUWtoOVhQ?=
 =?utf-8?B?VkY2eHBJQ0tUZWlINUI5elUxUXRSVnY3OW9Zd29zcmVhRmhoWDhxRHl5d05r?=
 =?utf-8?B?VTJhU0x4TWd5SFNiUGYzKzdNS1E3YXVkRkxzYU5pZ1VtQ3VnaGlwd2ZHNWZR?=
 =?utf-8?B?T3lFUGREM0RCUDhCZGJETUxLUW9TWE12Z3NLYXFaSVQxZ0VDaWdUS0xWdEZk?=
 =?utf-8?B?Q3NiY2tQSGkwNlM1ZDgraEIzNGN4VDRqOUxvSEZUVnh1RU51TkxsU3FaVE10?=
 =?utf-8?B?NGVIdXAxckRtMERHUWg1VFVyL0ZlOHRHZEd3R3BKbFl6YXM2ZUVkOGtOc0Fl?=
 =?utf-8?B?bHhFUXZpUjhZMUtpeTUvMnJXRUFsRUhoUE9ZTDNjcHhEMlJ6bFphMEF4ZTYy?=
 =?utf-8?B?RW9QV1Y3Tko5UlhrY0F1MitoVFlxOC9MT2YzQzVPZjdnK2xOVmxMZEgyYzhY?=
 =?utf-8?B?QldoVlByVSthNExnQ0JFaENCbENOZkY4QVR2SHFEcENnbzMrVXpnMjNkVmY5?=
 =?utf-8?B?RktNYjMzOHNsMUpwbEhuZ082SnVMQXYvMWdNanNuTzJTaFJ1RWR3R1A5SWZu?=
 =?utf-8?B?dVc4WDk0eEh1S293c2xMMlVtT3EzQTBQRnlxWEFydFNyUS9jK0N6SWhjT1pm?=
 =?utf-8?B?b0F2U2tPcWdrMGZxOEszdGwxdUQ0NFQ2d1lsak5tcEJZc0k4TG0yWVB1NXgx?=
 =?utf-8?B?YmZIVzI2OVdzMGFrS2o0ZlJBUTdPc3ZCTG5iZVZQOWtIWTNtdklqak5sL3BZ?=
 =?utf-8?B?RHNzRDhBZW1KZnZyeExoTTNodi9YcVVxQ3ppbko5NWo4QXBsZi9udVMvNG45?=
 =?utf-8?B?Yy9iRlkzSWlWMzJKKzNFYW01ejFObVlPMDVsQWtMUUNmbVpVMzZML1VmV2xF?=
 =?utf-8?B?YTdzdjFSVkpTeUY2SG4xZ0R2aWNpSnVseWtXRVBySlJQbklUdEdPV3MvQUkx?=
 =?utf-8?B?TnI1QTBrMWE4MzBNYk9iTFJOZkVSTWFVT1p4RmErR2xvaU1UUE1yVUk3WFpM?=
 =?utf-8?B?Qnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae1747b-5fef-4af3-520c-08de22bef193
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 14:14:22.6718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GPe4Q9cizSaE7P+JULHF9bC4UCEoYBM+FgAuGMoMzJmvKoYJPNH3+doBIAxmfDY/fw/iN2Vu0O5Vo0dS0zQ30w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7252
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

Quoting Matt Roper (2025-11-10 20:20:33-03:00)
>Use scope-based cleanup for forcewake and runtime PM in the devcoredump
>code.  This eliminates some goto-based error handling and slightly
>simplifies other functions.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_devcoredump.c | 26 ++++++++++----------------
> 1 file changed, 10 insertions(+), 16 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_d=
evcoredump.c
>index 203e3038cc81..599c886c865b 100644
>--- a/drivers/gpu/drm/xe/xe_devcoredump.c
>+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>@@ -276,7 +276,6 @@ static void xe_devcoredump_deferred_snap_work(struct w=
ork_struct *work)
>         struct xe_devcoredump_snapshot *ss =3D container_of(work, typeof(=
*ss), work);
>         struct xe_devcoredump *coredump =3D container_of(ss, typeof(*core=
dump), snapshot);
>         struct xe_device *xe =3D coredump_to_xe(coredump);
>-        unsigned int fw_ref;
>=20
>         /*
>          * NB: Despite passing a GFP_ flags parameter here, more allocati=
ons are done
>@@ -287,15 +286,15 @@ static void xe_devcoredump_deferred_snap_work(struct=
 work_struct *work)
>                               xe_devcoredump_read, xe_devcoredump_free,
>                               XE_COREDUMP_TIMEOUT_JIFFIES);
>=20
>-        xe_pm_runtime_get(xe);
>+        guard(xe_pm_runtime)(xe);
>=20
>         /* keep going if fw fails as we still want to save the memory and=
 SW data */
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
>-        if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>-                xe_gt_info(ss->gt, "failed to get forcewake for coredump =
capture\n");
>-        xe_vm_snapshot_capture_delayed(ss->vm);
>-        xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
>-        xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
>+        xe_with_force_wake(fw_ref, gt_to_fw(ss->gt), XE_FORCEWAKE_ALL) {
>+                if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORC=
EWAKE_ALL))
>+                        xe_gt_info(ss->gt, "failed to get forcewake for c=
oredump capture\n");
>+                xe_vm_snapshot_capture_delayed(ss->vm);
>+                xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
>+        }
>=20
>         ss->read.chunk_position =3D 0;
>=20
>@@ -306,7 +305,7 @@ static void xe_devcoredump_deferred_snap_work(struct w=
ork_struct *work)
>                 ss->read.buffer =3D kvmalloc(XE_DEVCOREDUMP_CHUNK_MAX,
>                                            GFP_USER);
>                 if (!ss->read.buffer)
>-                        goto put_pm;
>+                        return;
>=20
>                 __xe_devcoredump_read(ss->read.buffer,
>                                       XE_DEVCOREDUMP_CHUNK_MAX,
>@@ -314,15 +313,12 @@ static void xe_devcoredump_deferred_snap_work(struct=
 work_struct *work)
>         } else {
>                 ss->read.buffer =3D kvmalloc(ss->read.size, GFP_USER);
>                 if (!ss->read.buffer)
>-                        goto put_pm;
>+                        return;
>=20
>                 __xe_devcoredump_read(ss->read.buffer, ss->read.size, 0,
>                                       coredump);
>                 xe_devcoredump_snapshot_free(ss);
>         }
>-
>-put_pm:
>-        xe_pm_runtime_put(xe);
> }
>=20
> static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>@@ -332,7 +328,6 @@ static void devcoredump_snapshot(struct xe_devcoredump=
 *coredump,
>         struct xe_devcoredump_snapshot *ss =3D &coredump->snapshot;
>         struct xe_guc *guc =3D exec_queue_to_guc(q);
>         const char *process_name =3D "no process";
>-        unsigned int fw_ref;
>         bool cookie;
>=20
>         ss->snapshot_time =3D ktime_get_real();
>@@ -351,7 +346,7 @@ static void devcoredump_snapshot(struct xe_devcoredump=
 *coredump,
>         cookie =3D dma_fence_begin_signalling();
>=20
>         /* keep going if fw fails as we still want to save the memory and=
 SW data */
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);

Should we move this to happen before dma_fence_begin_signalling(), just
so we keep the LIFO cleanup order at the end of the function?

--
Gustavo Sousa

>=20
>         ss->guc.log =3D xe_guc_log_snapshot_capture(&guc->log, true);
>         ss->guc.ct =3D xe_guc_ct_snapshot_capture(&guc->ct);
>@@ -364,7 +359,6 @@ static void devcoredump_snapshot(struct xe_devcoredump=
 *coredump,
>=20
>         queue_work(system_unbound_wq, &ss->work);
>=20
>-        xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
>         dma_fence_end_signalling(cookie);
> }
>=20
>--=20
>2.51.1
>
