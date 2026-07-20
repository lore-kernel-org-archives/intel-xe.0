Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3139C44515
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 06:20:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D5110E129;
	Mon, 20 Jul 2026 06:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uendbm0L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 933CC10E129
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jul 2026 06:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784528422; x=1816064422;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+XQlqf+14WKIOvrA5bWexGOw7yJu4TuDkdUpoziV80o=;
 b=Uendbm0LktFpRKv8jrWbZbxUxRxYi6UbWE6vSftRZQ8/hznVDXwuUYTt
 nYu78eUoSKc7Cx1xKGSklSx3EsPjBR5Tpsal/Po4zQ8zkFt5dh/bt2oeM
 GUSU4U84o5AX4lJSL9V8J7rkDIjNtET2+BLzZ9aDcoGqcC6IOtHyWTdSA
 UpP8QWjlVuNqDsDcskO3KyX5Moff4C1xEUc1G91goHufCehDr21mA0vM/
 DVcNIMe30epUWIlO3+wjk2oGLlEaAEbOpoQhb3ttCadL1b/1S5ha3sxCe
 YAKf+gZ6r/VWSjVcrC8NxOPdfmubv2dIpgniMbnjhjDBs+zoga8kr6y/d Q==;
X-CSE-ConnectionGUID: 7z5LdGSOSsyV3GZKLdQGLQ==
X-CSE-MsgGUID: 9dZbZVGSTZCQRhSS3b0GIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="85125449"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="85125449"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2026 23:20:22 -0700
X-CSE-ConnectionGUID: 3rON5aczQx2A39CR95vAMQ==
X-CSE-MsgGUID: Kt8cQ46pQoSfIBqDI50RZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="281834952"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2026 23:20:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 19 Jul 2026 23:20:21 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sun, 19 Jul 2026 23:20:21 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 19 Jul 2026 23:20:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFaBKfc5yipYAHw6l09kbXKMrOuYoIe4ftE7KCohXAa0+QOcEHee2hnzaY/0yiVhlnzyeMCyHWAHYpixJyXrhvdpaiZgtv8EJgOY6Dkl6Mc820SeKP7txTM06Rj3IlVRkLSS6CjZ48TAoPABNfPNxDbRgPe2gG9U9cUwerOFzGmHB6S4Lmv5OcPljd1RGs3Wd+hWvVAJYdGhPEzQBPprhxBZGEE+BuGSt+mddmHO2QY6ENPPhU3HxVoqEaY3yQftp6ff2o7JspWwL1gVOfLyuQ198f9w8snh8J0DUsrRSBnpmXepOVfnbPq2CzI/5VthZOWjZSur6m+07IzrYKF/bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTBKQS7ZjqbM8LpUeQRYbY4rQvx3KBtXQwaLWa2zQME=;
 b=aaaRNrGnr5Y7ZENl08E9R8z4JbufrHWXBuW5FIA27Ks2sF45FJGmQ2q5q5Ojd5iw9bSp78zwXJwqvyGRjCyyO2NHbKxkJgo6RFg90quDaCACuvKDaeDbPu1NTk1twF3zepe7mWxX6vvhVLmFBaCoIQhTanvfGXpBymsBGhngVVhHUpkemL3xLC+yyCVfbGIqhERxvWUPMx1Okj8AldySDveRN9y5UFYrb0Y26U4OqpUgT9krcPH4WsPJDPHCs48bGpNzUJvLy+FPfiIipsqwNms2pikqCgjDKNXFlKRzpbpiLhpyKMjE5Sj5TXSBssFojoS6zn+y3WPxq1HK/5XY/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by LVUPR11MB9835.namprd11.prod.outlook.com (2603:10b6:408:39d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 06:20:19 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%7]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 06:20:19 +0000
Message-ID: <e61ad993-aee9-42ca-ae19-b777e94d197d@intel.com>
Date: Mon, 20 Jul 2026 11:50:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] drm/xe/hwmon: Update fan info after late binding
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260717041757.2759084-1-karthik.poosa@intel.com>
 <20260717041757.2759084-10-karthik.poosa@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260717041757.2759084-10-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0075.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::16) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|LVUPR11MB9835:EE_
X-MS-Office365-Filtering-Correlation-Id: 22cc1a23-34c2-4f1d-a6a7-08dee626f8db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|11063799006|56012099006|10067099003|4143699003|18002099003|18092099006|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 4lOx3Jph5Kz3+fmqw+vUq0TpYOBlM7hOTRWiKOuLKlpP3TUOtv2ZfSo9FueANaxPEaETMzP9+OfMP0M0Bmyt1Mykh1Do5Uq5cIY2Z7BoQ2smLl+6GvWHHqit3hlkIutNFvct/U+1aTyrPRA7WbXBvPpQPQgbz93/hK+3dvqCDCkeadDV67SEnXQZXdgawzXuVLabqN19HZcOlBf1II/T4Qj+OF09pMSFZuh+c0dqEoOlVONJnkW88F8R43S1eGbcTdf5urQcVsRphEhuTMHS1GtKFR7NK09N5f7p8L3/emukaorrO8b+hKEOnS46KyTfXjVbHUU5TuZGAWzXAAva142bzRYnePXsAFeOyo/L5yU1hiJ9xptfIoP+dy4xpHkDSxdybE8REo048Gh9QhbubY7GtnGRmKE4jFBnERpSvJEhkyfb2UnUcqJILA+GgiMObbr5mI3c5EAVwWtSRoHn5Xjk1aYvOcnctEZ6O4CctVVv5TQ8p7VU0+7N1TvOB/QyKCTX2m51AgWXDx4hihnLKfvhjNQ5sY93jc8Ehmex0nJb8XKJjA8hLYL9aQOkSDCS5SGDc8RKmHtdvUOBRU9B1Y7NqtJxWq18UFCU9JNyGGdPHC+dEYBZm6blcsfs/O48EHMk1mO6CPrPjdEAaM0U2zba7trZrZZWTChc8ohfGAw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(11063799006)(56012099006)(10067099003)(4143699003)(18002099003)(18092099006)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TS90UjVjRlBHSmdHYk1EMTdyUVdlaGlDSTZtZW1vOXk1V2d0dFBnNUltd0tW?=
 =?utf-8?B?cXZuNnpMakgxckV1L2p2eWxEbzNoUWV4ZWNJam0xMENYMzZIRFVldExiMDBL?=
 =?utf-8?B?L3ZzemtuZDNmb21oU0xGaHZISUJxS1pkY25QNU9aOEhZWE94cjBHMjdjSWhk?=
 =?utf-8?B?MEk4SzRkaDJha1M1Z3FJNFZCRlZzODhNMGZ0KzB4K1ZXZlNWVzhjWEdrdWp6?=
 =?utf-8?B?aHhvQ2gyeTAyMTRUczJIR3ZLb0I3dTVBWmJHWHp3TGZQTE05OTVWZnF1dkk1?=
 =?utf-8?B?akt1eWo5SHB5dElvZkwwOW8yNGNWUXN0bHN1Qkd0empXdkVTeEpyNXFsRVFk?=
 =?utf-8?B?c01HbURMeTJXOUVMMEF6ZkloNXVqS3dyL0xKZVNhMEphdGlUOXVYYTVaVGhL?=
 =?utf-8?B?RFBuRjdrMWkxSWRDRHRkLzRkandHMU92Ykc1WXE2WDZvYXVTWnhoNXlabHE0?=
 =?utf-8?B?YjY4RVFKbk9ZYkJvelVKOE1vRTlGc1BjSUJmOTU2NGVTMG1yMTRXY0hXMGhv?=
 =?utf-8?B?TEhFUUZ3R3pJWFUra2dCV1lTaDBlcTEwcFZMbUVxeGlzWU15UWthV1VuZDNB?=
 =?utf-8?B?UExFZHZOaFlrOUdldGR5T0tZdzhXdTl3M0ZwV29lak9VK250Ni8yamRzbXJ5?=
 =?utf-8?B?THo1L1BlNmM5eXJkeGVBQ0kyUXNrMDg3Y0JOVFcrL0Y3aDFNVzBoUmlIajNC?=
 =?utf-8?B?WXV5ek1JQkcwNHg2aFlxVzV2UXlIYmYrdGlBU09YZDFVa2J1QTdrSGxiM3RN?=
 =?utf-8?B?SVA2UmtCNVg0bDEvWTJzWVcyaFcyZlVZeDB5NEs5VWVvSkRqMmpWVFk5VHpa?=
 =?utf-8?B?aW9Bb3JHWURZK0JxNGk2UWhka3Vhek1RS1lEQ0g1MGtvWUJWOXBWd0dTeWdF?=
 =?utf-8?B?Sm50a1pMcGtlWHBtU2ZOQzBtRGdibHFGcy9teU8yempva0VJamM4WGFiV2lR?=
 =?utf-8?B?OTl4MW4vMHF5WC9GamhNUzgxS3dZdG1xYVo3cTNYTk96ODdMRmVtOER6WW9N?=
 =?utf-8?B?Q0VTVDNCK2NFUlRPK0ZTMVZrRVNMNktiSFNjVHg4WXgzTk81cmdJanJGZmlp?=
 =?utf-8?B?a242SDZnUG16NXZEMzN4RlkvaCt6T3o0ZS96UmJQOGkvWXU1cmgzbFlHajQx?=
 =?utf-8?B?NXR0aHhtSGhMUjZuSVJ5Z2NWNjUwOHlhZnNJL0tVbW5mcEhHUXlQc3dMSk9h?=
 =?utf-8?B?SjJDdWloaHRCV3g0Z1gvMVFqdlpVa2VNa3MweVZWaXpGRXhzaE1jWUFJcWYx?=
 =?utf-8?B?UnNidUpkQWRUTlFEclRXd2xqVFVwbFY2VCt2ZUVjaVVPd2loZ2dJdWlNV0pi?=
 =?utf-8?B?LzRTU2xjaU5RN0NDdmNUdTJUQzdEME5aR0xXMWtONVRYdlVHOWZXS0c0QmZM?=
 =?utf-8?B?K25uRzZjV2xxUm9pNFZGbWY0czFQTnZqUHYyUk1FZlc5NzQwUTNvaUJ1TmRm?=
 =?utf-8?B?K2hYYk9TUHZqajI2U0RoK21IT293OUVMV0xyd1duQkVYR2RYeC83MC9leXkz?=
 =?utf-8?B?K2pXUWZnVVJJWWhzR2JQSlYxNktidFhOK0hyN1IvQVd2VnRwdmZiNnQ3Vlo0?=
 =?utf-8?B?TmttMjNaZ0J2MFA0b0RPejBVdW5IZSt0N0tmQlBsbFdNYlhaTlM5akRNVlpk?=
 =?utf-8?B?clMvMHdYWjZCaGRaMndPYTZSNk9JMkYrUkJKNVZHVVhyQUZRTkJ0b3pSenFJ?=
 =?utf-8?B?aDNpOWhKQW5vMlMvM09kRXZXdk1CdzJRMnlCcERQOWE2YXNtT0l0eXU1Wmho?=
 =?utf-8?B?TlRMY0lnNllML2hWMzY0WExrbUh1SUJrVDlYUlcvZjg5eGZpNFY4WE9PYkNP?=
 =?utf-8?B?RzBsa3c5dDMvbFEwTWpSZmNwNUpvZklHZHpGQUdUeWtZTUI2QVRrTmZvTEFR?=
 =?utf-8?B?dm9PRmNqZHRNdkl2dGhQandKTGRGeVBFSlRlNEdXcHpWbGRpa0h4QXJPMnhh?=
 =?utf-8?B?WVdVMnR1N0lIT2hET2l1NlhmbEdpcjdQVnc0Uk1JY1VTR1hkblZxL1BYdVJz?=
 =?utf-8?B?T280SE9yWkd5NjBQQU1KVGRvRmorWXcwV3ZTbldwOTB3NlVtTnVjaDV1QUV0?=
 =?utf-8?B?SkoyMEo0OWQzamhrTXFzREFrOVgweGh5cVQwR0ZtV1NWTXl5MHVvbGoyZXFV?=
 =?utf-8?B?WEdicFNHNWVPMDg1QVBtaXlqSVh1N2draW5mVmt6c1BKU01RRHVnaThZcTc3?=
 =?utf-8?B?ejA4ZXRreXdhZzcvdzlsSnk5TkdMQXlEV2d5QjVqRjVLQ1BGSHc3K3hFYjR4?=
 =?utf-8?B?V1IwaXRXZ1ZpZkZXZllnVE45L0p1aGlSQTJ3UnJYUmVMMC9wUkpBNEVCUlhh?=
 =?utf-8?B?M2JzTmJXVU1JRjB0VXlBL0dCemRFUS9EYnJXREIwTGVsSkVqUVVZUTNtWVNp?=
 =?utf-8?Q?5Av+qMKDxEYC2aoI=3D?=
X-Exchange-RoutingPolicyChecked: KlcgSmrvjcXjVbDvn/jYt+zBJJs1rvtv8GFBxs6Cs9ykpQr1WXGdwf/SUYJhRWL820jWe6VZjrEI05y1K10qkjU8e76DzNd6yPZnpuNB1BP69XxpDy/SK5nnsALwu47Qj5w1QUDCTL9dodQiP5lvW71rK5yO6AMhVkdfuoHHxW1PpoLR81qPnSI+F8JD2jNHtxE74vGeXakQ59BS9itkqUySjU3dFBiA30EQotehDAKEcnyK6LLEdufXLZD213Ep3g1d4u2V6s3tn8Ecw27ORxTcZyjtDXEnFnQhkmZYL5YtIhYUW6MSOnw5Ix7fSwwr2IKEL1+3HZHsWtztkHMzFg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 22cc1a23-34c2-4f1d-a6a7-08dee626f8db
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 06:20:19.5434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 50PiL4FfgomVggNYSSSo2jHBjVqwpCe/W4mI/XuB/xtX7FKMgvWuY3hHdfFJEFnXxhSZeLhIdpGLzmWQIqe6eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9835
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

Hi Karthik,

On 17-07-2026 09:47, Karthik Poosa wrote:
> Add xe_hwmon_fan_update_post_lb() to update fan info after late binding.
> Add param is_init into xe_hwmon_read_fan_control_info() to avoid
> resetting user pwm mode post-LB.
> Call init path with is_init=true from preregistration.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Assisted-by: Codex:gpt-5-3
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c        | 50 +++++++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_hwmon.h        |  2 ++
>   drivers/gpu/drm/xe/xe_late_bind_fw.c |  3 ++
>   3 files changed, 51 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 65f356c741f5..518ba4438de4 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -1848,7 +1848,7 @@ static const struct attribute_group hwmon_curve_attrgroup = {
>   	.is_visible = xe_hwmon_curve_attributes_visible,
>   };
>   
> -static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
> +static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon, bool is_init)
>   {
>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>   	int point;
> @@ -1901,8 +1901,13 @@ static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>   			       fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed);
>   		}
>   
> -		/* Set PWM enable mode to automatic i.e stock table in use. */
> -		fi->pwm_enable_mode = XE_FAN_PWM_AUTO_STOCK_TABLE;
> +		/*
> +		 * Set PWM enable mode to automatic i.e stock table in use, only during init.
> +		 * For late binding, the mode is already set by the user and should not be
> +		 * overridden.
> +		 */
> +		if (is_init)
> +			fi->pwm_enable_mode = XE_FAN_PWM_AUTO_STOCK_TABLE;
>   
>   		/* Read minimum fan PWM */
>   		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_FAN_MIN_PWM, fan,
> @@ -2737,7 +2742,7 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>   				xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>   
>   		/* Fan control tables initialization */
> -		if (xe_hwmon_read_fan_control_info(hwmon))
> +		if (xe_hwmon_read_fan_control_info(hwmon, true))
>   			xe_warn(hwmon->xe, "Fan control tables are not available\n");
>   	}
>   
> @@ -2918,4 +2923,41 @@ void xe_hwmon_resume(struct xe_device *xe)
>   	mutex_unlock(&hwmon->hwmon_lock);
>   }
>   
> +/**
> + * xe_hwmon_fan_update_post_lb - Update fan info after late binding
> + * @xe: xe device instance
> + *
> + * This function reads the number of fans and their stock table after late binding.
> + */
> +void xe_hwmon_fan_update_post_lb(struct xe_device *xe)
> +{
> +	struct xe_hwmon *hwmon = xe->hwmon;
> +	int fan;
> +	int num_fans;
Should this be  u32 / u8?
> +
> +	if (!hwmon || !xe->info.has_fan_control)
> +		return;
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	/* Read number of fans */
> +	if (xe_hwmon_get_num_fans(hwmon, &num_fans)) {
> +		xe_warn(hwmon->xe, "Failed to read number of fans after LB\n");
> +		goto unlock;
> +	}
> +	hwmon->num_fans = num_fans;
Check the types to avoid type mismatch.
> +	xe_dbg(hwmon->xe, "Number of fans detected after LB: %u\n", hwmon->num_fans);
> +
> +	/* Read stock table */
> +	for (fan = 0; fan < hwmon->num_fans; fan++) {
This loop seems redundant.  xe_hwmon_read_fan_control_info() already has 
this.
> +		if (xe_hwmon_read_fan_control_info(hwmon, false)) {
> +			xe_warn(hwmon->xe, "Failed to read fan %d stock table after LB\n", fan);
> +			continue;
> +		}
> +	}
> +
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +}
> +
>   MODULE_IMPORT_NS("INTEL_PMT_TELEMETRY");
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.h b/drivers/gpu/drm/xe/xe_hwmon.h
> index 6c6f30208508..7198d7a4a1be 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.h
> +++ b/drivers/gpu/drm/xe/xe_hwmon.h
> @@ -14,10 +14,12 @@ struct xe_device;
>   int xe_hwmon_register(struct xe_device *xe);
>   void xe_hwmon_suspend(struct xe_device *xe);
>   void xe_hwmon_resume(struct xe_device *xe);
> +void xe_hwmon_fan_update_post_lb(struct xe_device *xe);
>   #else
>   static inline int xe_hwmon_register(struct xe_device *xe) { return 0; };
>   static inline void xe_hwmon_suspend(struct xe_device *xe) {}
>   static inline void xe_hwmon_resume(struct xe_device *xe) {}
> +static inline void xe_hwmon_fan_update_post_lb(struct xe_device *xe) {}
>   #endif
>   
>   #endif /* _XE_HWMON_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 768442ca7da6..34295418ef50 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -13,6 +13,7 @@
>   #include <drm/drm_print.h>
>   
>   #include "xe_device.h"
> +#include "xe_hwmon.h"
>   #include "xe_late_bind_fw.h"
>   #include "xe_pcode.h"
>   #include "xe_pcode_api.h"
> @@ -252,6 +253,8 @@ static void xe_late_bind_work(struct work_struct *work)
>   	if (!ret) {
>   		drm_dbg(&xe->drm, "Load %s firmware successful\n",
>   			fw_id_to_name[lbfw->id]);
> +		if (fw_id_to_name[lbfw->id] == XE_LB_FW_FAN_CONTROL)
Comparing a 'const char *' to an enum (0). Should this be : if (lbfw->id 
== XE_LB_FW_FAN_CONTROL) ?

Thanks,
soham
> +			xe_hwmon_fan_update_post_lb(late_bind_to_xe(late_bind));
>   		goto out;
>   	}
>   
