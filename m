Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834AFC5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 18:27:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB2F10E588;
	Fri, 14 Aug 2026 18:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SiifCDhQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0140510E588
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 18:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786732059; x=1818268059;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/r64N7GG6qj/fRPWwpfY3BR2ULRIBK/zyuShfRetaI8=;
 b=SiifCDhQzawtKkier7mdH8eS6Ov/2rUAASYXk6dFuMkbqzGLIhSyvwrd
 43fUFe6s0a7nt+Ny3ekv+qGhAze7+HrQ7KohJYHMJ3/qDNuT1X0a9cpUE
 JrdxFwh5mJdBaDSc0Ti9bbgGz+mqBIxQFR1iNmx3h6l5OuRBrvaaNi/AI
 Bg0dFgOZ6Xmusla4DB7g7ABAloyQXv7iCbe277Fuwz0LMPrz53WWKcQ1R
 Y5ONjfLEth2lS16n/Qe9tuD3LpNfLeaUgxWMxAVK++4V5d4386BbJXLw1
 jpDdygAmSihna/UQtimN4qnFzC7grrvqux7ZKMmz7WThGgUeynPnW0yFa g==;
X-CSE-ConnectionGUID: CHGmxVBqQAuHWEB16hbm3w==
X-CSE-MsgGUID: rqG7xm1QSLyfVO6GOdBIRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87336030"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="87336030"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 11:27:36 -0700
X-CSE-ConnectionGUID: 2gs/AZO1T/qIFDg6X7QMgg==
X-CSE-MsgGUID: 6DxPwiaUTxGzqWB4H26RFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="294215215"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 11:27:37 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 11:27:36 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 11:27:36 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 11:27:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LO6gCogNlBZHM9JnJShgyDXLQDT1ACXpUQarMjnbHt9sBBDNehCg1U+lp1yb9l+ESetwTOc8W0BvjsLUnbiUMsHezeYXqnVGkOTMi0X05wqg2gHQYIGTRPsIEiDERwd0h8bak5lEPBH7Oe/op5piqHjWeZkJPMHnKZ1k18LUdXqkPfATxiri2Psi8Syv55q5hqTLd7JO3stmXJQJ3K85S+z0Dm5pXhx9YQfnzksZGtyAEi6wY5h2UC6WD1kUMYFzgXO3dxSOUQfNlGNDEUUQchSwaAPzufmm1ga7biv24p/CFmoor2u9SWl5DUDeCa9ex9OT06bdFtTh40UtiulLNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZRsgxbAeDkqlchJyRa04RlO8ehqhWdzpGagHUltRxc=;
 b=cT8BL8L3gtSkl+rKDO8ICQX3FdPHCArwNmALfE/r4cX5DJSF0iiYuC7iH+Hv1x7sEDPf3gxXQQY9OBJDhplYRhQ69Zxh6NZaONXGh1C1r2vQcjXaea/nPsUX2jmjSLDXaJpem4QS/nplfNZCN5it5ga42CZ7ZQZ0Xl/GqMEufPZzr7g/mKN7vLKxC/K1Og2wVrwcfju+pqwN/iDuI313YLieBBVkCVvXhPa0af0UP0FJ3dbYWK79AS2WEaCAc6Py+xTrcmniZmBb0tQhCG99Y7wXI6b+J3b9HjTarOqofJthaC/q6jG+S1gAYwGziQz4tcXnGcjVQhjTq5ZKvyngNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CO1PR11MB4770.namprd11.prod.outlook.com (2603:10b6:303:94::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 18:27:32 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 18:27:32 +0000
Date: Fri, 14 Aug 2026 11:27:24 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH 4/4] drm/xe/ras: Report CSC errors using SIGID
Message-ID: <an9eDL/b0zkDOCtd@soc-5CG1426VCC.clients.intel.com>
References: <20260811235254.153783-6-umesh.nerlige.ramappa@intel.com>
 <20260811235254.153783-10-umesh.nerlige.ramappa@intel.com>
 <3520b3ac-9798-4077-a7b8-45b06c01ed2b@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <3520b3ac-9798-4077-a7b8-45b06c01ed2b@intel.com>
X-ClientProxiedBy: MW4PR03CA0220.namprd03.prod.outlook.com
 (2603:10b6:303:b9::15) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CO1PR11MB4770:EE_
X-MS-Office365-Filtering-Correlation-Id: 531d96b8-32e2-419c-0666-08defa31b467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|22082099003|18002099003|56012099006|10067099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: zYN4YBraE0nuFqFdbuvab3QSe4gkjzrbt9v6GQ+EoPArE4RnFkYbK02V0EKvhFpIMGi7cVvF7KSZy3XUR5BeT0YkGVgdNZoA9POWWq0gEvwRFxSalIJcB6JUPLHrnZggWWqL6HvmfEM1TyjHrCCMSv24VzpuOgCGtIIul6ygj7UTZYf+lWENQHzmj3x21x6XASf9z5VVxgkM6l6ToknVIR8Ma09iBdzXFtBdOIUeuH0W2t+sPdZKGW67Qgjy9Da6j0mm9ZFouWhguzX3M2+Dn6gmkXvQQhImeJAN7AWi1DZAJjgSWGnSFsGYcwKLj2X9exCXTViI7xYPinUxh/4FrSY5gidk1JFooeluXL8ulyMGeVg5OdL+WuFwbvmEmCk/kPlME3MHs8P3zotF7UwBD7UcpKSzQG84LSppYq1xx3sJtnRHKe6Tz72Cap23frdarR2Lvu5hBT86zmLk405e2ju9CbcXbdilsJyZHPzE1xjNBI39VXQPFDqPS7RqbAQLaRg8NOwpdYcwDhA3HpIVcW53LZ3zbPNxzphwZCuwKH0O5F8wTxtd+N6tNgDxRrbwNwUcWGL8tMBYuaw0vbQdIG3/yEXmskvpZv2/L2NNUS6o6xubk+eZ1wyZ22g0zzfP2UgZrWGwPvTOIA9XWwSVNbsci6yICP6DjPwpMKAA+8g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(22082099003)(18002099003)(56012099006)(10067099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDM5eUt3K1NzbDh1NkgvSzVhRXEzU0p2VTNxOUxRb0ZFbHR3cEhHWjVUWEhn?=
 =?utf-8?B?cGl4Q1QyK1pTd25QTE80WTJEaDlNRzcwRWplVFlnYXZEcXBTdnNDSTlMNThl?=
 =?utf-8?B?V2dYWkl5bHRXTGZrVnpVYm94M3BWTWVUUjBvMWp5TGVNZ1VCSXBuSW8zS3Fo?=
 =?utf-8?B?VVpUdDJhTlFvdnRHMDkxUm9RaG1ockpyVE56aFZDZ1RNQWtvNEJheURjUVpJ?=
 =?utf-8?B?enFFUktFQ29ZSFVQNkpPNnJXREhlTWJUZ281WWptUFdIaDJoRmxHdzRFaFQv?=
 =?utf-8?B?K2NnanZqVU1xWWFxWExJbFhWN2syWWFZTG5YdEdZcWtnMzJVWUhaWTRZWGFR?=
 =?utf-8?B?T2d2aGxHeWUwbG1tVmZLb0EvbVFEV1B2REQwZjFuOEpOajd2QU9rMmFXcXB5?=
 =?utf-8?B?T2IxRHNXRjg4Uk11dVFhRWw5Q0RmQ3hIRFhBUEQ4WjJaay9namRiYnZwVEtY?=
 =?utf-8?B?WjVzMERncjBzNE9rYjRWT2ZiQmFTaFFMbS9GSVFKbU9DVjY2bExhdkJocDBH?=
 =?utf-8?B?SldkV0dOZ280K01nVzAyRlNnUTVjYUkwU1B6c2kyYzhvZ0JLSFFJNmw0c09N?=
 =?utf-8?B?RzJFLy9XQlBrd0RmUXFYK0dMR2pBQ2ZCZEdQY1hJeSt5WTl4NG8xWUFhRFZ5?=
 =?utf-8?B?SlFlb0lYd3RKVUU4bG8yek4yeEdBbSs5SEk4RDNIUTNCZlFDNDBuUjZXWUk1?=
 =?utf-8?B?U2xPWU1LNmp1UkRKbmRnTmJhVWFJT3FKa3VrR3A4OWFyN1MyYkhlVXAzbEJR?=
 =?utf-8?B?azFuUGpMNjN1ZjVOekJmNW0vODJtNmVyTzI0eS9ZNHpiMVUrUmZSMlZnTWNX?=
 =?utf-8?B?ODZwMEpTZTlYbmJ5ODNwRVNhL0ZVZjhtNVc4SFBocmhaSlJjOGVPN2pxY3c5?=
 =?utf-8?B?SWlQM3I3eGZ3SlVhVGExYVBpQmJSNldzeDh6cjJJaWNVYmhNd3BMblVWTTdO?=
 =?utf-8?B?a2hkbHpBcFR6b2ZNZHFyd1laNXBQWTNyUHhxM0FSdDZETkE5YUh4RUtWMnBX?=
 =?utf-8?B?K20wVTJzaUF1dkZwRVN6eG4vWFFYZ3kwend3akJLSTVRZkttbkJuMEhEZE1h?=
 =?utf-8?B?MjZTbURCWDNIQjlCUXZFMGd5R0lSeDVoN1gvRzlPd3U3RHFyb2l6TXYySVJ5?=
 =?utf-8?B?aG9tbTNYdndzUGNOSDVyTXI5aGV0em5oN0FRaDJ6THkzUDJFNk9IbDBXVFNm?=
 =?utf-8?B?MXdFN3VIL1U0RUluMG9ZeitjREhXNVEwRnFzQXBqY01jdEliREEwTmdLMWRP?=
 =?utf-8?B?NVdvQUNiQjBVZ0RBR3dvVDI5V0JBdElrbEUvZlV2WVpHd1NtU1VUYjhjaG84?=
 =?utf-8?B?SlMzREUxYXBKQktSTnFENmJNNWVPakdQb0h4MDV5MkE3WW1yenNONnBPcHlD?=
 =?utf-8?B?aU9oRm9QOERINEZSQ3ZKSzN2MU5mV1R3NHhjL1M2U3ZJYjVhcWo1VEdQVmZu?=
 =?utf-8?B?Z1JhQWxPMDlKeHlOaWoxVGRlZUxZS01UcmtWSllBYmUzNlZXMk1YSUVQazRN?=
 =?utf-8?B?RU9LclNMMno0ZWVJT3NxSzhkSEZISERGQ3RFd3ZlR3pLZlB1a21icGVqYzNu?=
 =?utf-8?B?bU5XQ2V1Z0cxVmZLUGd3bkZPeXQ2ZU1jVWhuc0tYbVdvOHFsc3RYZ280cHlt?=
 =?utf-8?B?b1pmRGc3bFUxUktWUFgvdmg3RlB3NU9ORndpcmVrbUlYUW5nQ01ISDR0eVQ0?=
 =?utf-8?B?YzQyUFRaNURWK05DbGgydWVUY1JKVVkvMlJJRFFFRklBVkFNQzZ6RkxmNC9h?=
 =?utf-8?B?d1JWWDhLSjNwaVZ2N3kyMWJyaVZWWUdGaVpxaXFrNEx1RWFqcldzMC9nd0d3?=
 =?utf-8?B?WmgxK2xxbjdRbXE0bHUxdkxMdWplUHk0SUE2OTVkWXB5VFM4MzFPb3BnenJ1?=
 =?utf-8?B?dCtBQS9OWkk0RW1HOEJzUU82OEVpT3FZcllYTGtnRFdja0hMclcyMDJDSEVL?=
 =?utf-8?B?UzUvWmd3QmRRL1IrWmNoUFlFRklqT2JVb3hlTGxOVGJFaUt2MVBwblFyM2o0?=
 =?utf-8?B?amJ4VTB5QVo4WFVUZ2NUa3MyT20va09xKy9RemZZckgzejNlVy9TSUtTN29T?=
 =?utf-8?B?eXlvV3E1SXV2c0VnekIxZERPMHc2ZzgxaHNHZHZ0WnVveUFlb3BNRFZhamZt?=
 =?utf-8?B?ZUI0aWdzcUlzY2krYi8zL0c5bGxENE9SSnhwSFpxSzdLZ3ozUm9SUEpaRTE0?=
 =?utf-8?B?K2Z1RXV5SEdnNFZzbG5WVXUvZUxuZDhVNm5TNEhoYjhGMmdTa29PNG9paklZ?=
 =?utf-8?B?MWcrRWNSN2NNL0doYUxCS1UzM0RiUGh5ZktjUVEwR2svRXFhVlZacCtnNG1N?=
 =?utf-8?B?NENmbXpNN0FtK0RyQ3l6UHROdDIxRkwxQVNGcTJKMEJQNVB3V1Npd1N5UDZW?=
 =?utf-8?Q?Xx9pmF3JNJHo7J40=3D?=
X-Exchange-RoutingPolicyChecked: iocjQQOMvmNVbCaLJtEzkgKy0f7D+6iCMx43itL9nwCFcK7sxC9+k9gCVFZyHwmXwKtuOkPsxiCuV8OHjep/0IaXRN9XO3mvX8y7kuIqy9arB+c73dDv9ZcGUgxlOQn3z82TD3db9rcvmoYu1ICc+QNXW9/40xUeytSeGYHYzzntORn/WGmmlgCKJCQANR1PzxA5kcIeSf6fCLySpf8jC8Zrh21D6D/pJXL0HtTn9WHcHryrrDHBaRK1Y0+zgm9wYVeZHEQOqeet7QItFbDXolrQ1157eg6AlWL2IwKFeB8RGQrUnZsiHz+X8MLkS9N13uEYq8KtWo6ypFy8LQ5siQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 531d96b8-32e2-419c-0666-08defa31b467
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 18:27:32.2310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GR02pF4TL8tyhx//Hsk/e3M3dWJvv+vfGErOyElhTgF3+2oPT4ooPG87+z20zRDaZPyDeN+KjnUO/zNhmNM+gOrgg/KSi6fdTO6IgPtz12M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4770
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

On Wed, Aug 12, 2026 at 09:52:22PM +0200, Michal Wajdeczko wrote:
>
>
>On 8/12/2026 1:52 AM, Umesh Nerlige Ramappa wrote:
>> Use xe_log_err() to report CSC errors using SIGID.
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_ras.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index d1aa3794f2e0..e50ab49bce5a 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -283,9 +283,8 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>>  		 * is required.
>>  		 */
>>  		if (csc_error->hec_fw_error) {
>> -			xe_err(xe, "[RAS]: CSC %s detected: 0x%x\n",
>> -			       sev_to_str(counter->common.severity),
>> -			       csc_error->hec_fw_error);
>> +			xe_log_err(xe, SOC, 0, "[RAS]: CSC %s detected: 0x%x\n",
>> +				   sev_to_str(counter->common.severity), csc_error->hec_fw_error);
>
>hmm, it was assumed that for HW errors we will use 12 byte data
>while xe_log_err is mostly for the SW errors where we use errno

Not sure I understand what the 12 bytes data is.

>
>do we still need to use "RAS" prefix ?
>
>maybe we should add component XE_LOG_COMPONENT_CSC with SIGID_SOC_INTERNAL ?
>
>shouldn't we use common.severity to select right xe_log/CPER severity ?

Not sure how to use this macro to do that though. I thought severity was 
automatically handled in the backend.

Thanks,
Umesh
>
>>  			xe_survivability_mode_runtime_enable(xe);
>>  			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
>>  		}
>
