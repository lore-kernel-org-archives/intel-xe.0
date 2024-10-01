Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2B6CEB2FE
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 05:31:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B698010E0C9;
	Tue,  1 Oct 2024 05:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T5Qk3/Gq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C37610E0C9
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 05:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727760699; x=1759296699;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SGXYXuvyYPsxxqJv4r3ftbmezcmNq7W7BC3hAS8/Dr8=;
 b=T5Qk3/GqtPpQq++WfBpcgMrxtXn+w7UScwtWuGT/ltyqESlMHLz8+DxC
 +opHrrRwWpo5QAXbcTFuk/+a/PfYsRboZlrOTflTLPsQjyzvAi3D9Hz4U
 Wwnfw3Yz4xaFKQpDyFCmHQHZFyo6SusWsy7GE8yTrHAeb6uGvydvZyGkq
 GI+vHYsia6XKpefIP8P+Q9/f7ogXLTno6ThmKoPvH6PuBVfA6NyV1WoGP
 w9YTOfjKVonNqg3BtJoByKZ5ZMyG848JkVmMbcFVZBuux7do8RX/xjWA2
 vIHlg31x/z+MjEUIQouSoMvZOyFWEEyTeyvTOU/9GF2VCAQ4QMEwXxJem Q==;
X-CSE-ConnectionGUID: l2oYRNoDQmGs7dvNkNtRbg==
X-CSE-MsgGUID: hJKDDmvjT1C3AlOb3ywT5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="27000028"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="27000028"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 22:31:39 -0700
X-CSE-ConnectionGUID: V87XxH5SR66Yj5FEQguodg==
X-CSE-MsgGUID: 2vP7PAK9QkKU2Vag11imwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="77931668"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 22:31:39 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 22:31:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 22:31:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 22:31:35 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 22:31:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aGRRoUKFv2Sb1AvTL22rXZgtC93i45nlNfIhQPDuJ70tFqILcjojmWf7pHe4OMZeWty52fF4do1S11Gko4rYEW4DK6oOdFBrJApGshcuNljoaN+Tnz/NLOgl/XEVcURQbg5qP+qbSOlKQDMFY3feaM1ce2GsWIBa7z/9kk4vIgCLfdPsFAElZpJN5rPCWD5HcXj4NhqBGIjaBl1rGgSQwU/54F4/h+U54MCjz9lUlxvF7Mv27X20S1JTzHfO8DLp11Fcvzl/YMDDZpgDsJihYS7mAO53aI3z5fm4wgoo+2Np1bC84dAK29DgYlCTn346OBU7p5qrtEV4b6chX0jGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDHxApECaQy7cK36DsGeAU08dtLRZVv6Pc3UvidxhvQ=;
 b=skFFZ0N7JOLkogyYQhiubgrs2Rrt212yMvx4wGhkVOnOirs0iUM/nX/Jre17XVdwVWhcQ/gmX1tZvu1rFJ/iDcVty2oIXBdE3DOh+OafjjXEDIikcpnyW0X1JKT7wLfeAonPBxRZjOKRWWaII+Pi0LB0GIpVySEJ10IailbZn9WO3AD+a5Z5dQ959NHPuywb6Fgr3AFkAtDr4CK319xXve7gVphxMxkIffbz0O9blu6GAebqMbJ9IpsvkxWK8Uvjr+c0tB/AmoPmLWUFGqEwwtKvaoLenWqLHJcvybrq2fEDJ9enXlPVs9zuCvukDhmWl4FSTABp6i5lUi/PAg+7Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15; Tue, 1 Oct
 2024 05:31:09 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8005.024; Tue, 1 Oct 2024
 05:31:09 +0000
Message-ID: <52ed7c31-c4b4-422c-aa6d-c88d2ab6f5ed@intel.com>
Date: Tue, 1 Oct 2024 11:01:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/25] drm/xe: Modify xe_force_wake_put to handle _get
 returned mask
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
 <20240930053149.1246339-5-himal.prasad.ghimiray@intel.com>
 <20240930221352.GD5725@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240930221352.GD5725@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0021.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::29) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CY8PR11MB6889:EE_
X-MS-Office365-Filtering-Correlation-Id: 400a8be9-659e-4c05-b048-08dce1da416d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFU3cFNhY0FXTHZvdGlzVU9FMythUVhBUG0raHF0cXAwY0w1N0JsMUtJV2du?=
 =?utf-8?B?WFRyVWNlSTdZWUQzemdzK1ZnMTFpTTRVVEhwazQ1cXdGNzhHekVyZy9vM3NM?=
 =?utf-8?B?RXpVSUF0blFtQWg1QWU2Zml5aFFOdEMydXA3c1dQa0I0VmpvZkFXcTBKVWNO?=
 =?utf-8?B?RHZXMDJjMEQxMnh2UStoWDgwdlQrRkp0MkpFM1d0MWRuaTFqaE9IbjBlTjVP?=
 =?utf-8?B?bWlCM3lsZXM0VjNvcGVmMVdYZUViYnMxb1ZJM0pyNk9MdkphY2dleG9SRmkr?=
 =?utf-8?B?aE84dUE0dlJJNTYxckdWWm1nckRuYytJbUJqenAzbWR4MWVjVzFlUDJUcG50?=
 =?utf-8?B?elZBZERxMTAxNUhjeVljVFEvWnVkRENzOWtDY3BSZ25XYitaWGczbm9UTEE5?=
 =?utf-8?B?Q2dYL281bmZTLzdJeENVenZhVEZkNEpSSjdjcEdKQzJuR1g4QlU3a09FODM2?=
 =?utf-8?B?MWVKT09IK3ZqZXZLUEU4Z1hoQVl3ejBBR2ZTYnUzQVhnZ3lNcVI2UFJFNnNi?=
 =?utf-8?B?NHlMd0tjYzlkbFN3MkhsOUdWdHZVL2Ura2lDL2FEQjA1YTlCVERlc2ZCVFRU?=
 =?utf-8?B?NDZUeWRLUjUyYlROb0VDcWsvTjBCVUM0NjlpTzdoUUtPRWJ5SHRsZ1U1OTdj?=
 =?utf-8?B?bThzNURqREI2d3NxTU9yOXZhSnAwSU9vTlFQK2NXZnpKREQ4SVZNNWZIYzBp?=
 =?utf-8?B?a0dXaW1PNkdzVm5KQVA5UTBmczRNU3gwZHh1dXdyWXJQWnpUaDJCU1ZyRGU0?=
 =?utf-8?B?VXFQdDU5MG5CY1BrRUFGS1N0dUQyZTlPZWUrN0dsZ3pua0d3OW9UM3pycmpR?=
 =?utf-8?B?YUNFOWJVSDRjVzN2TXhoMVFTWTJqa1VaMVJuWnpvNjlhUmpKZE5WcnBzN3BF?=
 =?utf-8?B?Q1FLOVY5MnJBeSs3ZERCMVVhQVJLWEJZWUZVU1NaaUV4V0V5b244ZnY4S1Bl?=
 =?utf-8?B?TEtxQWZxZjVnN2ZhWHFveVBVeHRxT3dZdVdLczhOU2RZbFMyOTN3akx3anJ0?=
 =?utf-8?B?VDlKb0FBdCs0RWlIZHBwNVFWWEM0UitZOGlXc3V3aWcxTnZUb0NVSXhDMzlB?=
 =?utf-8?B?enhrcUlKMy9LTkxIVFRwTGZQYzN3MW5hWG9KRktBa0VZOXUvV2R0b3RycHdL?=
 =?utf-8?B?SktFMlVGby9mcHg1Tm1vdCszMzhuTEsxU1IzTkNFdkxieVZlRlc0MS8rN0gr?=
 =?utf-8?B?Q3VYM3NhS2dMSm5rc0pYYjRRbnlaTVFPYTN6U0IrdEFTL2wyYUV5eWx2WnZh?=
 =?utf-8?B?V3NwNHczZGVBb2xIN3lFeHlXNUlBMXdUWnUxT0F4LzRhazk0UU01YlN3STI0?=
 =?utf-8?B?bXJlaWlUazdvcFhFRlhhYXROMzBwb3YzTmhheE9WT1o4SWJKSndBTkJtT3Yw?=
 =?utf-8?B?RGpqMStackFDaGFEZXM1WFdsTkFiRmU2U3JyVENrckM5bEp1anZwTE9sTWVq?=
 =?utf-8?B?M09BTkZJaUwwTWloWkF0UUp0a0dGU2VITGY1TWVqYkxhWWtGbUM5cWx2MXgw?=
 =?utf-8?B?M0pTNHVENkdDUk1sT2pxdmdLWUlNQk5HRjNFUXBhQytnUXVCUHdnSU9TS3Zu?=
 =?utf-8?B?WldLSlVuWWFDSzFJSnArS3ZDM0U5RjFocVNDUStsUFp6L1M0SWNGbkUzTVNn?=
 =?utf-8?B?QmI5Y1oxOGQrZlAvRUJuWGtjWUk2OWFybWVTYkF6MWhhNFB2RnRtVEl3eW4v?=
 =?utf-8?B?aEhwbXorbUVtV1ZhVHlwNUVqZG9PWjBKTlBVVDZCay84bENmZnU1TGZRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXlwbkZGWVVGaVpWS1U4cmFINGxNdjNZRDhKbnlPSG9Uell2VkQ2Vm01Yklt?=
 =?utf-8?B?cGJYMm90elc1anVuT0Y0OWZaM2xqelN6U2VCbkVpTnczeXdRY1dXNjNTRGpM?=
 =?utf-8?B?ZnZJQ1A2UEh3Z015K0F0L3RqY2F0ZjBoVmI3cGdHZ3pNeGdudVhLQVVOdnN6?=
 =?utf-8?B?YWJJelpRWWp6RWg1WWl1QlVGSDZYbTF3SmZsZUh6RW4zcDg4UnpKWVZzdHFZ?=
 =?utf-8?B?WithYlJnZkFyMFNVYUlMWmtVaVBTdmZMZmw0cWVuUkZpYi9uMis0YXdTNDZx?=
 =?utf-8?B?Z1h5eXFOSEpmaXZuR2ZYS0ZTQktPOFlZSUdLMUhRL0grdS9rU0pqWm5jaTJS?=
 =?utf-8?B?ZjdjdFp2bzdScFVCOWw0UGk1VnIvRm8veE54NlJ0VC90dm9uUThseGk0aExt?=
 =?utf-8?B?Y0VXK0tPNit5c1NSeFNja1dpZzZDQmJlSVB0a0RGaGwxcyt1aW44NUJwQnNj?=
 =?utf-8?B?RUl4UmhKQjVVa296ZEhiakM3YzJ3cEFtSkJZQm0wYmRnYlB6ekJ0MWlLYTMw?=
 =?utf-8?B?MHN2WWlIek9WTGUwcml2dER6eTEwaWN6S09KOWYzaXd4akhpUGhpbFM3ZkxO?=
 =?utf-8?B?ZUpQN0V6dXd2d2plVXA5c2xYcVZBRW4yMlJRQ0s1S0ljaVhSZG5ZN3RpT1Bt?=
 =?utf-8?B?a2V3eTVURmFSbU4rS1hVQktqUndFMzV0RlNPNWQ0cktTYVd1aFFkWVY4NWFl?=
 =?utf-8?B?bU1SZG9uRTQwa0VzWlVOZ0FxOFdnUnA5QUFqSnRUNFdOTUVoMnlCdjhGVTZZ?=
 =?utf-8?B?TFJ6RTB2YjBSWFFoWlkzeDVXMElwK0hWT3lzYmV6MnEyMUJVMlpHUnQ1Vm43?=
 =?utf-8?B?UlIxdXVQZ0JscjBJLzd2d3FMa0xPN0FMbUQ3ME93QmxvOEk5RlV4UDJBL2Vl?=
 =?utf-8?B?T3BHRE9RazBIbmtZTDZGMGNmVjdkR1VDckVROWJUVGRRTHl1ZWNVcVRNaW9y?=
 =?utf-8?B?ajVsUzRpQWZ2SXptOU1VMlRtOXdvWWV6aC9lbG43d0J0cG81Nlp3dzRMdGYw?=
 =?utf-8?B?QWdiUDhjdXhHdXhzNDVGdGVGeHR5VUhmUmZNd0JNTVM1REgrV0F6K1ZiRmZr?=
 =?utf-8?B?TXFnSG9PWUI2Sm9ZUnBsVklIS0dCT0FWNjJORXREek12N1c0eElySXUxbXhR?=
 =?utf-8?B?Q3ZFY1JwK0ZKSytIbjZKekYrV0ZHZk5GdGVUOVowbFNoeTExcUYwNXBQZmhL?=
 =?utf-8?B?TDhhOWk3bFpsckRYSGxWaE16d1h2YkhJcFloem1WQ0tzWnNadTRxUWl4NXpw?=
 =?utf-8?B?dElJZE1Md1k5ZWlTb1pGMXZNZWw1aTcwVVMraUs2T3plZ3MrMG5qU3JmbEkw?=
 =?utf-8?B?aDRhNGRSNWVIOFhFc2JlUnRuM1UzemtFajJzS3NOcjZVNUgwakFuSXkyNWlN?=
 =?utf-8?B?eHptb09hUElEK0RzSWdTWTlnWkl6aHBLeTBxcXM3U3BNSFlsUU8zajJBQVR4?=
 =?utf-8?B?UnlOaDZyN2ZhV0lJaCt2YS9SYXZRTGJpOHhQbnc5U1VPZGZta2JWTGU1eGUr?=
 =?utf-8?B?QVZUaUNEeGVOOEIycWtBeFZySk1ZVkE2WlY2VWs0MEFGQVQxdklTbTA3dWZ3?=
 =?utf-8?B?T1dWSGlMZmp5M1owQzBkWm9Jd2dTZVB0Sm1MaGFvY1RnbEJEQ2pwMDJ0V2pZ?=
 =?utf-8?B?MDRKTE1OZUg2L3FwUEF6T3FOcnZwVnBDem5HSkdZQVNZMEpuSkx1NEJNclZN?=
 =?utf-8?B?aEp1QlY5QVRSalE5RFJyaUUwSUpPOXp4TTlRNmhiaFdITFpLTkN0K2ZjcVFM?=
 =?utf-8?B?MCs1akZ4WVFTdlc1M1crUFR5YTZBOG16allJUHNxNmFMU3luOUhpNElwTTQx?=
 =?utf-8?B?NmpZWk5ESnZrUHRaN1NKdi9WNzFXNWVGUnFqOWFPVmdOTE5TOVZzcXVTRG8r?=
 =?utf-8?B?MWFVRXlybllpV0xXNDJEVDlsbnkyVkM1L1ZzVDR1WTJSajJLQ2tFSG16eU5B?=
 =?utf-8?B?eUZOemRRUVhFNXRJT2FJUUQrL21oOEN1V0l6L0lVS1duaGVFRHMzYzg0NlU2?=
 =?utf-8?B?TU1xdmtJR0xMUnJTeGZMM0kxRUgwNTREWWZHWnhPZEQrZ0xQQlB0R1lmMDdU?=
 =?utf-8?B?VW5HL3FrQlIyMk1NMitCNkVHZGkvQVRlUlY1VlNJQzlXZmpxdFJuci9Ebnly?=
 =?utf-8?B?ZlF6SzRqUE80WTZYY0QrVDJuZFdOUTlZRXAzd2ZNUWRzSVdIQUg1RlZkTFpB?=
 =?utf-8?Q?o85iZzu+/B4hFUUXn+T5oBU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 400a8be9-659e-4c05-b048-08dce1da416d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 05:31:09.9280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VN5gXAjNOMHbES1vjLqs4tchcd1S5+7z7DeSRpAfRfFaj9T6mnyb3cYUVbFIWbSZnwnAu8wuVFgjw0woJnXumocCLwrvmtHgW7uETfWUuEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6889
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



On 01-10-2024 03:43, Matt Roper wrote:
> On Mon, Sep 30, 2024 at 11:01:28AM +0530, Himal Prasad Ghimiray wrote:
>> Instead of calling xe_force_wake_put on all domains that were input to
>> xe_force_wake_get, call _put only on the domains whose reference counts
>> were successfully incremented by the _get call. Since the return value
>> of _get can be a mask that does not match any specific value in the enum
>> xe_force_wake_domains, change the input parameter of _put to unsigned int.
>>
>> v3
>> - Move WARN to this patch (Badal)
>> - use xe_gt_WARN instead of XE_WARN (Michal)
>> - Stop using xe_force_wake_domains for non enum values.
>> - Remove kernel-doc from this patch (Badal)
>>
>> -v5
>> - Fix global awake_domain
>>
>> -v6
>> - put all initialized domains in case of FORCEWAKE_ALL.
>> - Modify ret variable name (Michal)
>> - Modify input var name (Michal)
>> - Modify commit message and warn (Badal)
>>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_force_wake.c | 28 +++++++++++++++++++++-------
>>   drivers/gpu/drm/xe/xe_force_wake.h |  2 +-
>>   2 files changed, 22 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>> index 7f358e42c5d4..372ea43b0d06 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>> @@ -211,26 +211,40 @@ unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>>   }
>>   
>>   int xe_force_wake_put(struct xe_force_wake *fw,
>> -		      enum xe_force_wake_domains domains)
>> +		      unsigned int fw_ref)
>>   {
>>   	struct xe_gt *gt = fw->gt;
>>   	struct xe_force_wake_domain *domain;
>> -	enum xe_force_wake_domains tmp, sleep = 0;
>> +	unsigned int tmp, sleep = 0;
>>   	unsigned long flags;
>> -	int ret = 0;
>> +	int ack_fail = 0;
>> +
>> +	/*
>> +	 * Avoid unnecessary lock and unlock when the function is called
>> +	 * in error path of individual domains.
>> +	 */
>> +	if (!fw_ref)
>> +		return 0;
>> +
>> +	if (fw_ref == XE_FORCEWAKE_ALL)
>> +		fw_ref = fw->initialized_domains;
>>   
>>   	spin_lock_irqsave(&fw->lock, flags);
>> -	for_each_fw_domain_masked(domain, domains, fw, tmp) {
>> +	for_each_fw_domain_masked(domain, fw_ref, fw, tmp) {
>>   		if (!--domain->ref) {
>>   			sleep |= BIT(domain->id);
>>   			domain_sleep(gt, domain);
>>   		}
>>   	}
>>   	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
>> -		ret |= domain_sleep_wait(gt, domain);
>> +		if (domain_sleep_wait(gt, domain) == 0)
> 
> One of the long-standing bugs with Xe's forcewake implementation is that
> we shouldn't be waiting in the 'put' function at all.  The idea is that
> the driver is supposed to just submit a request to sleep and then move
> on; the hardware will actually go to sleep asynchronously and it's
> perfectly expected for that to not happen immediately when we request
> it.  Waiting here adds an unnecessary delay and slows down the whole
> system.  We probably/hopefully don't wake/sleep forcewake often enough
> in the Xe driver for this to cause a major user-noticeable performance
> impact, but the current synchronous sleep is definitely not the intended
> design or what we want going forward.
> 
> What we actually need to do is drop the wait here and add a check+wait
> at the beginning of the 'get' function to ensure that any previously
> submitted sleeps have actually completed before we start the next wake.
> Usually they will have already completed while the driver was doing
> other work, so there will be no extra artificial delays added as we have
> today.

I don't have any objections on my end. The only downside I see is that 
we won't have a definitive time for sleep acknowledgment with this approach.

I'd prefer to keep the current changes separate from this, and we can 
address it in future patches.

BR
Himal
> 
> 
> Matt
> 
>> +			fw->awake_domains &= ~BIT(domain->id);
>> +		else
>> +			ack_fail |= BIT(domain->id);
>>   	}
>> -	fw->awake_domains &= ~sleep;
>>   	spin_unlock_irqrestore(&fw->lock, flags);
>>   
>> -	return ret;
>> +	xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to acknowledge sleep request\n",
>> +		   str_plural(hweight_long(ack_fail)), ack_fail);
>> +	return ack_fail;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
>> index eb638128952d..b5a75544d86a 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>> @@ -18,7 +18,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
>>   unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>>   			       enum xe_force_wake_domains domains);
>>   int xe_force_wake_put(struct xe_force_wake *fw,
>> -		      enum xe_force_wake_domains domains);
>> +		      unsigned int fw_ref);
>>   
>>   static inline int
>>   xe_force_wake_ref(struct xe_force_wake *fw,
>> -- 
>> 2.34.1
>>
> 

