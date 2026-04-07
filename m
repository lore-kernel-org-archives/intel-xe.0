Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AB4EDB7EF
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 10:48:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B82E10E3BD;
	Tue,  7 Apr 2026 10:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zlzn5xs1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DBF310E3BD
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 10:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775558917; x=1807094917;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=vzNENKOzl7g2ysFods9TiwYtDuSLy4cMGouD7pGxRb4=;
 b=Zlzn5xs1ZXytAie/3xJb9HaPMlj7qDM8QKygfpUqSaZZHlEErSO861TZ
 bAPmMjSzuMXGW9yf6SMCZNIO1ixDaLfmWp3G1sbM0Qo0caqiQTqd0bDaO
 hb78w0Wip58qahJRelr/6GEXNbDfHvaiOLpGe3YLPTIxgozGFfCJh3eKg
 OVS8MVq8YjJWzbRbkypkAMcrqgbSIM2dV11h8VlFspWjNzdiefVwJzUSH
 m3Di4aVWct52jiqKQStqEWDHdYu5AuT2x28YMuDmZfNhzkd0bWlhHvInz
 9ktv74STXMnMxTc2+tKbSewmqrzbpCIi4XNWFAC19dIbNHlxv4COiUc0j Q==;
X-CSE-ConnectionGUID: LVIGa6G8Ti+4JGXowAgqRg==
X-CSE-MsgGUID: /FtWyktcT/mgN5Z78JblBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76530831"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208,217";a="76530831"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 03:48:37 -0700
X-CSE-ConnectionGUID: ppkthBzoREavFWLRmSBYHQ==
X-CSE-MsgGUID: QmqJ0N/SQemVB/R9qXMbiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
 d="scan'208,217";a="232537868"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 03:48:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 03:48:36 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 03:48:36 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.32) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 03:48:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVwAWrkp4g8m6s9N73tS95Zm8fQECW5+9bpeZ50f1gipSHdQ1cgGjXydcHLmjVq2y4Nsy/9w10R0S47CrWLciFzdn/47jMzeyPXhH37OEHPd3cYl98Qxx/vOqwJ9UpXCeYQc3Pb3Cb53f1idtOjIkYLUakxnuAtVlsX3CFTh7yxVANKHDSQ8IrQC+ovRsL9Y5Dh0MkKM3GZTAsKuPJvIez5MmpdJlQyZPWEHLa1fciQMZeUSwVlMAI0Hr3jqEgRfP3Wz5ZTinlYS7IXvasYW9ECYoeLTb3rXwW7A7RHtU5DVpr9cPEGl+XnoDg1RS8NwNvozbdiyz40AEUp24TDtuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KaLuAPhxp8Hce/dsjNwRgHCXBkXxaJFLkKeihe2JFOw=;
 b=n/WNjVpEVuzRBhoD46KFW8Y4Wnnao0d+iTcO5zSuMUFa2ukDdotbjUtqAXMix5kefywNWdEBZ6CX/BRibBeKLcz0CJ2OQU/AocoXnTeHKObm3WdSrHwp6kJGD6DQW0AV58cBJfCcBlnJgU0+3WM80qhgoMhWiwIRDq2lQRUUz9nV8/qF/v8MKqkvBl5dLjKJWDheT2nq017zc4/PysbUfz4lVEHQiRs8YYRGFh1kPtx1fDxEqXfUL7xE6lbngDVn0ZckiM96cSASkGtl9jxZnqHBf18wK/FepVJ7ou/lU2ewXMCAWd4+00UyBo4+ag5//r7dSc8p4a3QV1E1wgy4UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9304.namprd11.prod.outlook.com (2603:10b6:208:57d::5)
 by MW4PR11MB6960.namprd11.prod.outlook.com (2603:10b6:303:226::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Tue, 7 Apr
 2026 10:48:29 +0000
Received: from IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::6349:cd26:d23c:4ece]) by IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::6349:cd26:d23c:4ece%4]) with mapi id 15.20.9745.019; Tue, 7 Apr 2026
 10:48:29 +0000
Content-Type: multipart/alternative;
 boundary="------------DwFqxHWWTU7WBIVdiKg9jt4T"
Message-ID: <7a2aba65-6eb9-4be0-b2a3-521b3d562bac@intel.com>
Date: Tue, 7 Apr 2026 12:48:25 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/srio?=
 =?UTF-8?Q?v=3A_Mark_NVL_as_SR-IOV_capable?=
To: <intel-xe@lists.freedesktop.org>
References: <20260331152259.58270-1-jakub1.kolakowski@intel.com>
 <177499435362.419941.17654559036249635909@a3b018990fe9>
Content-Language: pl
From: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
In-Reply-To: <177499435362.419941.17654559036249635909@a3b018990fe9>
X-ClientProxiedBy: VI1PR07CA0302.eurprd07.prod.outlook.com
 (2603:10a6:800:130::30) To IA3PR11MB9304.namprd11.prod.outlook.com
 (2603:10b6:208:57d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9304:EE_|MW4PR11MB6960:EE_
X-MS-Office365-Filtering-Correlation-Id: bcfa1c43-4c60-45a7-bfcf-08de9493344c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|13003099007|56012099003|22082099003|18002099003|8096899003;
X-Microsoft-Antispam-Message-Info: eA1jD5DktWix7IMG8eiHjRjzSSuuonNu6UMo9cnnsRMKTEZ8hVrUEvRYhztW+HsPK+UNMD1RXfH5IEdMOjcW2cf44OSohpTWSrJBwAAhbAPYreCrKsyT0G+8c3fqIMQzSzRB25SpIrwkUWdvflgx643Uy5VAo3BytB4RItDYBwYi6ZFIyB34cwGyXL8HMK5FKMQWqmFevyKyiZr1jjJYTXWgiBDLKxMX1tcxsKeIALNlABvzYNMvCQGjqW6IPHRqAbVkw3T097Bxgb4lZqTp8rjB1t729Roinx43dFKNR+05FuKyJmv5S5e3qAiTZhMmTSwb0aBVsRmTzqhZEM6pi0csNTBH960ESwPEqua1s6ccMM+W0Vz46k/qzEnRHXJbFN7H2Gfv4K58LZXIFct4CR8Az5zzpcD7+VnXOWjSkq6BRtHeVGDFrcE2hn37Dy9zro0yrZMs5uRBFyn8XCE9XGGYgxanoR15/MOy0qR5LeUekscl6ZdmegTBFoiV/FHoaxdZkVzXxfQe1bgJzsKlywIggUzAp2gNzKSh1aIJj9KmGDij6fvpc7+yt9BW0D90tQGBYqaPchO33EUxV5f+m6By66H41Kw7BLiwtPcBVxb07j1pmvd3QJeH3JX6fcUzJyFu95S8FECDlw1Zr0JpsuZHfcWAhsgQaU3lCUIgH8mlXisqZ9LgK7tnfuegxZzx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9304.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(56012099003)(22082099003)(18002099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dW8xYWZXTXVkNU1UUUl3MFBjby9qZFFuQVRXOStTaTh4UlhCNnh1dVF6VUNY?=
 =?utf-8?B?RHpqM2tuY1docjZNUDRVSE9JTndZenhzZnExUnBXc2Vsa2dudzFjWDVERnpi?=
 =?utf-8?B?bUJTT29mUWM0YVJpMXE0ZWU1dGhQWVQ0ZXQ2ZlhjeEFrSFEwKytPZTZ1U0Ro?=
 =?utf-8?B?SUowRmlueW9WaDBQdnYwRm1QOXR2NytuQ2ptUmJFVlh1U2pQMXZuQURkRzlw?=
 =?utf-8?B?NUEyaElNVmZqOWFQRnlTRVZiTWpjNU95ak1pZloyME94cGh2SEdMTDlxdklY?=
 =?utf-8?B?SXpuL21OQTVTbnRna2Z3aCtReDNaaE4zMkpkTUE3RHg4VUFqcC80Y2xuRGRG?=
 =?utf-8?B?Zkc5MDJpQS8vNzZaMWszWUV6cVZrTXpRejNTcDdKRVVtVkJVZGd1VzdyT2tu?=
 =?utf-8?B?SFg4RWVpOHVvQnl0Z2prbCs5dU81ZkFEZ09QZXdYMGMrSGdESGpZT1F5STQx?=
 =?utf-8?B?aWlTdGdHTVo4R1ZvUjJMSXVtMnJQN0RTZWQwNStOL3VzeXdQV0RJaWMyYTc5?=
 =?utf-8?B?enpWdWV6L0JOWnhsNDJlamtHQ1praEF1SkhLSTlyVmlZMUxtUjV1UUUzRkZB?=
 =?utf-8?B?eGs1OFlreHZiQjVFeTVSZklHZ0tWSk9jbEQreTVPTDE3OWtKSWhVQVBydnZy?=
 =?utf-8?B?VjFXYm96OTV2cW9uYXptc3MxWitxK2FMeXU3N0I5QjVYVEMxdnNBOTZJbGlq?=
 =?utf-8?B?RmlvYk5EcGNBS01PemZmSWFTaDZmb282U1ZYMmQ3UUxxM0FmVDcwUjFkdVJq?=
 =?utf-8?B?RnJqanMrdjNoUzFPOEk5RStXeHFQOWtYaHZPdjd3Mkd4YUx5OUphUU5LeDRr?=
 =?utf-8?B?VHRtZkI2Tnh3THg0Zlp3SUpVUW15dVlGaEU4aUtpQVVRRmJlTlhHcmxSb0Ri?=
 =?utf-8?B?RVhJTFJpRmF0WnJvU0puUXEyRHF2VnlMQ2VBQTBmMkdBZnhkK1VaVzJmNmVq?=
 =?utf-8?B?Ty90U3JZM3Y3dy9sYVY3RDd3WnZab3l2Vm4wRExzTy9UbDNuZzJzOU5kYXlm?=
 =?utf-8?B?TW16WXVkZjBaUmpIakhmakVEc3Bqa1N5L0l1Y2ZLbDNoeG5oMXRLZGo0UkFa?=
 =?utf-8?B?MGhSN0UxaVZvcS9jckdiTXhkWXZFVGtCRGhXYTZzaFlVNEErZVRkZFBabjY0?=
 =?utf-8?B?MXlvQTdaNVJzSXRNUExmQVl1blU3VWRiTUNOSUNUYXlZS2s5OG9vRWg2S0pw?=
 =?utf-8?B?aTFHZGREejVBSXVieWJzb0FVcS96aUcxOUpITjlPNE1KUUQvcWpPb3RBQW1R?=
 =?utf-8?B?MVlldmxMajhmcEFaRlRyeU92M1pHZFdLOXFDbDlsOUFDMytyQVpGbEFjdHFS?=
 =?utf-8?B?R1ZtZEQ4RkdhUmlicFVMOE1lREs4dGNPcGhobkRlWEdLWnd0VERZTUNPOFdu?=
 =?utf-8?B?d2R0UzYrR1NJY2ZsRUhlcFUzTWhjeGUrb2h5S0JTMDZlT2dDUXFkUmJKTGRL?=
 =?utf-8?B?bUJoK1l2TUFqSVdVcEVHU3VGMk5YRlRqNjdKUnBDcGRjWWZ4MTd2bW4zUk5V?=
 =?utf-8?B?ZDN3YVJRQjRmNmRiZWNzUjdha1kvYTNIdkJpa3FiNDFJVlNFS1EwQ2RCQ0hz?=
 =?utf-8?B?ZkV0M29GYjg1T2VQZVFmZFFENDBmK0tidjVFVm9wYmdIMVFrUXFjdEh4V1V5?=
 =?utf-8?B?c2xaZjZrVTgwMFhDQUNlakQxR2szdUJHOFBOSWRSdHA0R1drRi9wdXRyT3hV?=
 =?utf-8?B?NG5MQzZUdnFpaFBhZW1rYUNzTTlWcFJpY1MySU8wWDlGNzhqQTJXbDh2eVRO?=
 =?utf-8?B?b1F0aTNLWTcxOEY0cE16V2RRV1ZFbysvWTM4VWMzTkdVTHQrU3ppeXZIZnVv?=
 =?utf-8?B?QU03NFBJYTJOWnpXQ0JTNW5Bd2VWazJ2MmZGZG9nRUJPdHF1SVBHV28zdTZL?=
 =?utf-8?B?MzcwUHFES3ZBWmp5MERSL1ZncnF6WE9sZk93cVo3MTBxQXduVW9HZHpDWUdK?=
 =?utf-8?B?R3dYakdGQjJKMlFtNGgyUjMvaXNlVDBaZjFuc1B3MDRtb2dZRVJhbm4rRGVR?=
 =?utf-8?B?MTBpQVhFVktBdkZ1em1yczltaXpGeG92T3pRUDRoQ3BhVmRxc2dHZThTb0FS?=
 =?utf-8?B?eE11MitzZWxiNGJCTi9rcE0rZ0tyWEVJSFFVMm1iaFVsSjJzZkg1cmxkWDhX?=
 =?utf-8?B?ZGorOWZYeERpOXZYaUVOU0lxRFhJMVQvVEpOSWdIT3dBT01MSTg1U2dTUlZn?=
 =?utf-8?B?OHhrMm4wRnRLYkFRbHZ0VnA4UWlwN2Q0c1laTXRReVI2R1pOQ2FNQmRiTTlC?=
 =?utf-8?B?S3l3T2lnL1BXanFndmRFR1hPNjlYQ1o0cXVFWTFVU29vZjFrd3ZBNWFyV2Va?=
 =?utf-8?B?azR5VWg2OWRRQjlUSTgvN1h0dGQyNXRhY0pxTE9MVUsvdWIzK3BodTlrcXpP?=
 =?utf-8?Q?hxbvzkfjH3W5lSmg=3D?=
X-Exchange-RoutingPolicyChecked: rgDoBV4NQaSVjf+pGhAtodqsjdyAUyGCzr/uoNDIZi6arYQCHXvTNaIVouXL6tQYx+VGj7IHvMlqJsqTLP6fLxVDIYbSNgXdRi1TV6wXjnTbQrNXCikO0gjWmKcrLTZ5tp6fF36M5ZOi2LihIVNpUC7ZVnoDNQ6+zHLkydsD/7xsHQcQeAraGg7IB2mCGh4y2hKlR/r9hOBkalS33fw80nkn+hkZtHVlI/fZ4hM4Zy2w6UNvCbUNA8iwUHS3/idznQwAcpHUvY4EWPNhfG0PIJA32JPMc2hG80Bsb1Mp5LcLMuF35YfP8388UrIn1ahBwuiIzvGJm0mbwjTyz3I1Hw==
X-MS-Exchange-CrossTenant-Network-Message-Id: bcfa1c43-4c60-45a7-bfcf-08de9493344c
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9304.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 10:48:29.5344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJA6A7XvhGKPDu7LEH3bprdBv+V//KtD3no9d1jxzUCUmzglVrBWQz3U6EWvHMFfh95oKRC/UQdztCWjE5WlClf/+wDbkS8BJPWciqB4XRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6960
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

--------------DwFqxHWWTU7WBIVdiKg9jt4T
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 3/31/2026 11:59 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe/sriov: Mark NVL as SR-IOV capable
> *URL:* 	https://patchwork.freedesktop.org/series/164174/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164174v1/index.html
>
>
>   CI Bug Log - changes from
>   xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c_FULL ->
>   xe-pw-164174v1_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-164174v1_FULL absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-164174v1_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (2 -> 2)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-164174v1_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/shard-lnl-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164174v1/shard-lnl-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html>
>
this patch doesn't relate to LNL so the abort is unrelated to this change

>  *
>
>
>     Known issues
>
> Here are the changes found in xe-pw-164174v1_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164174v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +1
>         other test fail
>  *
>
>     igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164174v1/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html>
>         (Intel XE#2142
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142>) +1
>         other test fail
>
>
>     Build changes
>
>   * Linux: xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c ->
>     xe-pw-164174v1
>
> IGT_8839: 8839
> xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c: 
> 779129c7868f4c7205901d6e57b25de52b411d1c
> xe-pw-164174v1: 164174v1
>
--------------DwFqxHWWTU7WBIVdiKg9jt4T
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/31/2026 11:59 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:177499435362.419941.17654559036249635909@a3b018990fe9">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/xe/sriov: Mark NVL as SR-IOV capable</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/164174/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/164174/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164174v1/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164174v1/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c_FULL -&gt;
        xe-pw-164174v1_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-164174v1_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-164174v1_FULL, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (2 -&gt; 2)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-164174v1_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/shard-lnl-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164174v1/shard-lnl-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html" moz-do-not-send="true">ABORT</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>this patch doesn't relate to LNL so the abort is unrelated to
      this change</p>
    <blockquote type="cite" cite="mid:177499435362.419941.17654559036249635909@a3b018990fe9">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-164174v1_FULL that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164174v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164174v1/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142" moz-do-not-send="true">Intel XE#2142</a>) +1 other test
              fail</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>Linux: xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c
          -&gt; xe-pw-164174v1</li>
      </ul>
      <p>IGT_8839: 8839<br>
        xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c:
        779129c7868f4c7205901d6e57b25de52b411d1c<br>
        xe-pw-164174v1: 164174v1</p>
    </blockquote>
  </body>
</html>

--------------DwFqxHWWTU7WBIVdiKg9jt4T--
