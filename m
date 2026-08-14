Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DE3C5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 10:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C8810E54E;
	Fri, 14 Aug 2026 10:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jf72+RV3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A03C10E54E
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 10:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786703713; x=1818239713;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d7XEeZWmr+D15uyUy27DAqrnylRZARaqO4kwZCFL/2M=;
 b=Jf72+RV3NgR8/ZLShSXSu35OpefCOcRitwHdRvV879V5RZCP6D8R0KCW
 gpn+2BZdUN04j2LVueO1FEezAoOfF2f+0XZXTd/OutLgjTRb5ie5BQZmr
 Mb2yJbpR6I8b2rLxM9C8/r657PpD/Nkd8CvR2Ihl+7qlXWSh8l2seLLei
 4ctObpVz4XI69lVI2Zres3jthqcS4BSUCqM4iUZRcf5X9HgBGIqkURlDq
 5oVFmh36quZ9jGwyzCw7ltYCFpBe/OwQ8AaJnCemQH7P7ep0m/O1+tcI9
 6eK7LSPj8dv2s4yMEedG+J014/YwkCVotyjbBXIa60kM0wZhB12/o1y5L w==;
X-CSE-ConnectionGUID: /LdkpgANQ+WQHphS9a4zaA==
X-CSE-MsgGUID: lh3f0c4HTPqpziLEAv+UBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="91092998"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="91092998"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 03:35:12 -0700
X-CSE-ConnectionGUID: czY1Be7tR7SLFtDd7ipFaQ==
X-CSE-MsgGUID: k4b+58YRSZqWmpl0CXBaTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="269382812"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 03:35:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 03:35:11 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 03:35:11 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.21) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 03:35:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWJpn2rnV+ObicDsqDh9J+k3X9u89NVwmqTssB0vsicMDGB4uw43ph1Plg5Ebdaf9vgIPlTpyFy7M5ynQ3RsMypYJiKFDzwIXrjU+Nfok9+8968LjOt9MAQ/6vxaGDXKmsGxB7LuwgIb387jlTKlTJipdbBrgk1GxeC3RubJ6rNF7Y/B4vHf1Q5wa/ICwCpSy2yZ50x8Pdz9Un3PjzyWMX9AifCXg4S7t351Oa5rczHqAHFFPgnPM/YDSD7ISqq4EmFWueiWtx4VMIEx+nFIp5t/wfS40BEUp1PAqae4nRuAZMneTVo8JHaYln9E7X5JdymcZRTVtqxQFGVm05ZKWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZqDtFL4Y2zKJ9zottLS7LxD910eQlveByghp+v4++k=;
 b=PVMfvEc0WcCAIM5L8i4ZYX4dMeTBPAF+coV18oFjDhNx3MNbdWFvVRrGMkM8g3OH9gz2KbYQ7lYTDxxFxvofdc12oEMCxCud47Xf/FhEwbKXP7fB453nUG7Ouo0vfFVjc+OJY1pEadOg658xwMB+Bh1I5mwy/1nITnpE+4Icyc01jDclijGu8fId7QgEzjVjr+ItH4oyO6JMU7jePip4quTQ+Re29R7QcXzg3YbQ6X2+C1NH2m4EXm74pmMXv1FhgiJO2CrHcakIxRXMMnYK8ZTADZSa3lp8s+AX3Z/CwgchD1I6YJQNKmmwQJP6sDftEUEwGsadRtYi3R/uGDWSEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH8PR11MB9484.namprd11.prod.outlook.com (2603:10b6:610:2c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 10:35:05 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 10:35:05 +0000
Message-ID: <cfcbd22e-88cc-48de-94c4-875e6d8f6a55@intel.com>
Date: Fri, 14 Aug 2026 16:04:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 21/32] drm/xe/survivability: Report 'sysfs failure'
 error using SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-22-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260812191450.11690-22-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0347.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::19) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH8PR11MB9484:EE_
X-MS-Office365-Filtering-Correlation-Id: e00e49c7-5563-40aa-2475-08def9efb42d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ytKUV4Gd+/gt/EyondDnjKQuYYcKTyyMqT8z4PWhO5FMv3rr0T+22sHPe9KEf1RicOJRgc0glbOKOUasCNpC8kAXqRyE0wSJeotI3rn5V+N1+2ba1AjgOd2A6DGBqpHWzmpyskMMwW6lsMJflukMbM9hQ3LMnp09PCO9WpAv1toAeJqsEfbJ5wxqvpPDn8WXgV5T+y0/nLzdvusUiKIt7wPWIOZ0+FXJHNLG7/QVTE5PuJmRNgmq+YAR4iQ7A257ej8gHfz1NWx2eacUgGAxhCqJafmvNXOdhmYQOQJpAWbFRNGfXYBiEgwsLT0Vyhe4qvIHXWUbGO3D+E9/mWGzRtEGxGJSTT3CP7v3XfXqXSuNtcI1Br6YeXEvKSA2BrxLwvP99g6FSHgcxHRenU8lHHFMPnt2d0BtPfv/UupPz5VNm1kCu23IJHunMEwUjh107wcA9d7miq1wS5YuK7w1l7Rc/8DT2+xv3MG/sZsr49+2O1W/zNKlrXf1+N8N3wZ04rtaYViV7BgfsvFu24soy7PkXsGvTgDeKM8GAsYTO2Ga0Z5L9Xqh9jjM/INLWftHOqkg+zBDjgcok/41sAiSAfrku8GBF0Xsmy+su/PnF0z3l8Mhu3W69VO/cAYxj5guLWK8gl/1DSbZKvv5agbQ3DARQyJ6gOJd7WBKtHKxquQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWFOWVltb2x4ZllhQ2tqU0thbUNtWGp2UkdpRnJadXV5RFM4bzZMOTAvejEz?=
 =?utf-8?B?OFh6VUxDUFp0SEN3YXlnQmFJdzk5Z3plSkk5ZnFaMzZaSy9GY1VxakdlMnVP?=
 =?utf-8?B?YU1LdFFJTDQ3cUNtN2RBMlQrNlB1czk5Snl6YUZGamg3U042TDZqSDQ5TFU1?=
 =?utf-8?B?M2Q2cUFDWjVNQVBQT3Jua081STlYT1pXVWl5ZHJQTEc3N2V1ZitHbHA0cG9i?=
 =?utf-8?B?V0VMQUdrQUgrL3Y1UERPaW5TMVJUU25xNzE5VXYxcUp6b0JSek1oU2JpSmd6?=
 =?utf-8?B?LzB1YkhzNEtBOUYrWHdZcTY0TVN0L1NKNC9PaFZIVjZlNlU0VnFSdjBSa0hr?=
 =?utf-8?B?U1FNR3NhdkZWVEpUUXpDaUM5dE1HQU1uUjJ0SEg0UWJmMmJxVnpQTDZzQzVU?=
 =?utf-8?B?c3U4NHZpd3lTYmh0d0ZoRk9PeXpXOFMxZ3YzN0g4TTRrN2hWZ2NpaTBsMFhG?=
 =?utf-8?B?R1VYd1o3QmZXWEJ1RGxQbVpPc3pDbEZBV1lWa0ZMczZ6dDQ4MjZ0NHM4Z1ps?=
 =?utf-8?B?NVIzcUtrT3NzbGJqQXJNV3h1aGVaNHpjNzE2UmN2bUdvZER6bllPcXlEOExB?=
 =?utf-8?B?Q1d5ckdKbkhlZkQxTmJxbFpSckRHMHgxWEJXdjIrbkMxL21uZlR3Rm02ellW?=
 =?utf-8?B?QWplQkJSeWhBdDNPcWFpOUVwSS9TcGZrRFJtUTZjOTFiUVhJQ1dBMzV6V0Ru?=
 =?utf-8?B?N1E1YzBiRTFZempHb1lQOVVrSDE1V2NzVUtBa0JDOFQ0Mmxra3h4OVh4Mkk5?=
 =?utf-8?B?eGJvNzBmYVFoQ1ErM3hiRlJGTzJYWlV1Tk9GdHR0V05Ick9RR1g4M2VzT3Rt?=
 =?utf-8?B?dHFWMFlnODVwRlBDWExJQlh0TThZQzM4Qk45ZlgzL0dZME1aWWhxYkZqVjRN?=
 =?utf-8?B?bURCSDE5b0xrR0V3S094MzVSTWk0bWhLa2RvQU5ZV1FwZkVsdVlQZDBBT1dE?=
 =?utf-8?B?d01iYmU3eUU1cUN6ZFNmSjdtdGgxbVZvN252cXZlZitjcWNra25TQURZQUZ6?=
 =?utf-8?B?ckhCekkrMnhVYjJuaGl5cFhBMHZDYiszTWs5K2h3cnRNaW85TXNteEdMSW1S?=
 =?utf-8?B?aHdzWXN0ZG91K0NWcDBBMlVuQXVYUHFEbWJMSUJXcE16Qnd5QTFNcGFQMkNU?=
 =?utf-8?B?bFBGdWtZelFrcmRhM3lGdWtNYlB2THRmbG9yVzl3a1AwRkYzZHpNVG5Jemdo?=
 =?utf-8?B?VitPeDdpS3BrNDIzM1JmYnBnRnNRdG9oOXkyQjdVQUsvaFJMLzVoamtGMGQ4?=
 =?utf-8?B?TGpFc3lkazRqTlVzL2I2bzcyeUF5QW9GSHd6YUVsT3FoQUVLRzQ4dFdCamVO?=
 =?utf-8?B?bTdwQXJBSHIwYXdyVzQ1d0dwRHA0b0JFb1pCRkI3T0pxRksvVUV5ZmtkWDBx?=
 =?utf-8?B?cE1RSW1OUUd1aXVFNSsxOG11U2p6OGlWcUUxcW03blZWakR3NHMzcUk3bjZD?=
 =?utf-8?B?dmF6T1czTzV5SkRjZUoxU3BqZUx6WGlUSUh3SUVhTmFpVForK1BrU3Bsb1g2?=
 =?utf-8?B?NU5RWkpNVnlFN0FIWlA2VG9oRXdqald6MmRsWlVVemRMZnEzL3NxVHBzck5u?=
 =?utf-8?B?M1RDY3NySCthaW9WWnJhQ2VPUkltaDNIN1U0Tzk1TDZYQ2hvRVBrTmRGSGtr?=
 =?utf-8?B?czBLbVNpUyt2U1pNYVlsQU14VGRoVkp5d2s3WC9pYnVvejlVU2dHUlRjalRX?=
 =?utf-8?B?VjcxVXhNQmdXbm0wMkdNYXd6Z0JyZ3Q3YnZORnh5N2hGWkFBL3NLaFAvZFF4?=
 =?utf-8?B?MlQxNHNuTmU2cUYwSnllSFZsNkRxYmhxbHRyNzE1MUhrR1h6amZaT3RnODR5?=
 =?utf-8?B?cHJjUGZ4UUhFUDJ0SmY1Q0FOTlVmWERWV3pSZk1GV3hGa1dYbzhROGsvNTBS?=
 =?utf-8?B?L2c2am44K29sZ1hSNUFUTmROOGpoSjVOUFZrd1NhR2tBay9OU2gvS1RsUlhC?=
 =?utf-8?B?c3JLSUV6ckZ1Q0pha1dEVmYvMnVsdHE0Z3hHd1V4Mit2NExkUzNjQWZtNDRt?=
 =?utf-8?B?V0dmRkFlWDFLazdMVllCYVhqVzBQeTRzS2ZIeSswdjlQWVo4c3doMHUwY3BX?=
 =?utf-8?B?M1Z6Mk02TnpuT21yUjFyQm1UZHNoTUk3c3VqNnJnVzB5YjF0MCtFT0N3Tisw?=
 =?utf-8?B?SGhTSlAxZGkrZG1Ba2loSmFmS3BjQkQ4dnNWRVlOR0wyTGxKc2FFZDdpa3Y2?=
 =?utf-8?B?TSt0c2gwN2pZdUs3Qk1NOTc1SnB0bmpheCt3cXhzQW8vTXZ2RXJPMU15SzFD?=
 =?utf-8?B?YjE4enN6ZTI4cXJRNU1zT3ZLbHFDSUxFSE1LdFhJK09oRXhzS0R5OXprNEJW?=
 =?utf-8?B?RlVuMTVFY1I1TVBOUkIyRlJjelhkMXRNNUwrT1d0bXJoZWhibzFodz09?=
X-Exchange-RoutingPolicyChecked: UmJKXTbRZfV6h3daAioTJm+M6EQH7NU8nFa1IDOKy8DtBYktaOoIS6VcAOt3w7blYSg/cx/NMfv/F1TNochgk+g+TT+hJpOl6Tq4vNyfBxkH1TyAW8qpfC31c1Mx0DKIaoIh402b4RvwCV64M62G5E9gXM5frU1kdTtaQXiBmtIIQtaYTemkofqhCUoWFiXZg+Bou/KWPFALdvbR5du6JNEHlLnAkpV4zzeuqQT/DAteIkSoGFMgXdmAM9DV5zu+bnoJYPmQ0BQDQbUIuYjo6KKd73T64A+N3L6TuUVcmaclJW3jzuuhBI4+AwJ+OD57CMflkzNxviWWNK22wKXweg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e00e49c7-5563-40aa-2475-08def9efb42d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 10:35:05.1901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a3+cVlY9rkG9cqCiTb8EEz4tGEAmz7ZbSZBTereKD3bnknLD6nOAsInmugk3u5Ou3VmdtViYPlQTV+XGz7VzUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9484
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


On 13-08-2026 00:44, Michal Wajdeczko wrote:
> Report 'failed to create sysfs files' error using xe_log_err() helper
> from all sysfs failure points and for all call sites.

Is SIGID appropriate here? My understanding is that SIGIDs are meant for 
failures requiring corrective
action either from driver itself or external.
A sysfs creation failure is a internal issue and may not belong in that 
category.

Thanks
Riana

>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_survivability_mode.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 85b4c125a217..2d8c532157fd 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -280,24 +280,26 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
>   	int ret;
>   
>   	ret = device_create_file(dev, &dev_attr_survivability_mode);
> -	if (ret) {
> -		dev_warn(dev, "Failed to create survivability sysfs files\n");
> -		return ret;
> -	}
> +	if (ret)
> +		goto failed;
>   
>   	ret = devm_add_action_or_reset(xe->drm.dev,
>   				       xe_survivability_mode_fini, xe);
>   	if (ret)
> -		return ret;
> +		goto failed;
>   
>   	/* Survivability info is not required if enabled via configfs */
>   	if (!xe_configfs_get_survivability_mode(pdev)) {
>   		ret = devm_device_add_group(dev, &survivability_info_group);
>   		if (ret)
> -			return ret;
> +			goto failed;
>   	}
>   
>   	return 0;
> +
> +failed:
> +	xe_log_err(xe, SURVIVABILITY, ret, "Failed to create sysfs files!\n");
> +	return ret;
>   }
>   
>   static int enable_boot_survivability_mode(struct pci_dev *pdev)
> @@ -403,9 +405,7 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>   	}
>   
>   	populate_survivability_info(xe);
> -
> -	if (create_survivability_sysfs(pdev))
> -		dev_err(&pdev->dev, "Failed to create survivability sysfs\n");
> +	create_survivability_sysfs(pdev);
>   
>   	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
>   	dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
