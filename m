Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC61C43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 13:29:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8E410F80A;
	Fri,  3 Jul 2026 13:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NMmUDIQu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C03910F80A
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 13:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783085387; x=1814621387;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SOZxOZYNUckZWLw7whVMs8CzNcVLx2ptzbi6w/C5Xdw=;
 b=NMmUDIQuS8J4vXWkdsEhPEQLTCpdg7JT+37frRFeUHHKth6MRkKrTW2p
 rMqMnO7QSAyoHny3lwQ1u+NBOAX6lBBlB4zme3izIsAYaTX+zzTZzacVg
 zE+8RXrIcy0pD/QP8qzE0VSIxpiU4kbNUA3RZSwMDlAyQOfMBFg9ElQHK
 IanstDZfit1F0oGMRul6QkO85PykB+yhNIx4mOeZxr3L5P0zfwcrRrhQd
 HrF5HSD5JwvuuJs7CeJrj1PAowHWp7tMBqzNbBwRmoFPNGnI/pZYOxbLQ
 hYPSPJ01hloBXlyQzeYyzR3V0/zLIWhUM0lItyHOVDVFPV+XlXnTUgpHx g==;
X-CSE-ConnectionGUID: nyZVTN3lRYKUIkA4bHPv6g==
X-CSE-MsgGUID: 6BBDSa+dS5aw3tjzWkLPwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="82826499"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="82826499"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 06:29:45 -0700
X-CSE-ConnectionGUID: b0zg7SvHTPytw8W+MZa4+A==
X-CSE-MsgGUID: ZQpS3eg4T0iScMd/yKhrkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="251394882"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 06:29:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 06:29:44 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 06:29:44 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 06:29:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UR1j+YEFmxmAyGivhlmohtA5xi0ADKK6i2CDxxYwBpiZrfupGo5D3KLfEQjFYHs/siw+PJUSwjOgD9nbdmBraC6Ep9JwvuV7tnnKBQWXrvHXDZa6dt1iZq1vMeb5V71avqBlFRs367Tal6MEJWnyV8i246HC1BaV58+RaRj1pMwiPdh/BAY8jDYu5Enm5vzBgTs0Dayp2+Ul6rgEtzio2o18f/DQNUSrZeQnl3co2ZeXwx+55PkMg1Aj1aIRf6zVm/3AQYadTECDLMo0yKHrJaJXbeIAofT3qB2fN1zhJzefi7Ec0PGEE2hEW/rJ0V5WeW6MVgJpLxHnN5zJQqkCDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fQyJbLb/Bu7/V9MmGskcXvBCpWjp0+BSSg9wUNJBN0=;
 b=bpKysp2L1xEofHhU88a2Crsp/xQuh0Jg52YjTh6x/RPwTW/PeHKYXgL+5o+Rql/9NxLqzUuc/2PM47Ab3lf54nfbmGQKUeQiShkM3J/is0sM3MK8izCDpdt8rX2hUZ1jiDJ0Q/DvcVuzrbBFqCrvE7Gy/sYEKcSiopZEoltCOmcdtz/ScYFKjni+4OmNdpp9ovL/WJ1jL3vL1pe+oXF75li+klQxI9YOQrH6YXG6GW63y8JY0ALhzvDm4vlz2uhcpWMULpvzwtg93dkSaLrTFqzyeK4HMMoJqQrvfepKgAzbwvw4f03/Inm7u9+8q2WlIKBZv+rdAMDd+VcpFw/2Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13)
 by SA0PR11MB4685.namprd11.prod.outlook.com (2603:10b6:806:9e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 13:29:42 +0000
Received: from DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac]) by DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac%3]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 13:29:42 +0000
Date: Fri, 3 Jul 2026 15:29:38 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 04/13] drm/xe/guc: Add string KLV encoding helper
Message-ID: <ake4nA-cxhb1xsdB@nostramo>
References: <20260630132633.32804-1-michal.wajdeczko@intel.com>
 <20260630132633.32804-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630132633.32804-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR03CA0058.eurprd03.prod.outlook.com
 (2603:10a6:803:50::29) To DM4PR11MB8132.namprd11.prod.outlook.com
 (2603:10b6:8:17e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8132:EE_|SA0PR11MB4685:EE_
X-MS-Office365-Filtering-Correlation-Id: 310496d8-c606-4867-0391-08ded907239e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|3023799007|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: QljW2lg2h+N1OqT5ahnridoAQ65eAEh1AE8b7khDJQ2VjBgmb6l2aeUV+u+cWt/ROsfIu+hqMJXZRMGF8s3JU6ps0OIUfTMREbuff/KRrIXNMRCLC0B0unPwh/6Vsws268IX3w14419XZ4eeKPEERTQYSRFTCpM9WoB0B99MycfkLun+s3jOaYhGmDwHzAZFZRMNTDuUDU6XEsbAZfAuVDHSiqOQSamU7YI4SLwx3Y3O4Y3dAuWXE4uTIHoLd4AE4Ise9pIebcCsQ/EFyqk8+LxdMg+bT+s622hDZyQPnBhuPsUzQWgz6Uosub/ILVs542tdtZM8iOHib2gygfpw76r7SHANqn5XqB97BIoUAzpmVIhXjWCvbFnl02my33Bqc1HlJKXuuAavsX0dkqyA46lwrOrWQC17Qjn/ptPt1zo4/hSrxtJsCf2DYDghzZl1z7YLQsekVaHJHeYd4qtuUMQk7JprtviLWEgLR3WQvN1zPTt5M9FeCZICdR5N7Tjru40p1/Los/S4v4ejSHWCJ4Lxka41KO8CroL3Qucg8WK1CBDo+E+OXqzd5ggl6oecCNbsQhk3KQpucJ079WnkwHkh4n2H4yhJoLHAE7wuj6Knpde5T40sdqocHvxiC0C2ADvAdg0jpJvF1qAOLLlhwaGhx+ctBmBCZVY6UEWrk/w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(3023799007)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vmpic1BGZmVTYXFnelBkdWpMc01rSzJMT1NCZzVMYzlOREI0L1JQbFRGeW5j?=
 =?utf-8?B?QXZZMWNBUk1VSTZ2aGdrQXRCWkM0NVBYckNiOTJWeTVCYjVlQmdHQnFTbUNI?=
 =?utf-8?B?M3NqbUdSZDJwQVBVMTFrek82RHNISUp0dXdsdUlDdXhnYTFEZUhFQXhxZHQy?=
 =?utf-8?B?d0VPUURoY0VDeFNONXBBQTNnVUpPaDYzQUFjUzYvcXYrNnBKQ0RVRi9ZZnA1?=
 =?utf-8?B?d0lJYW9SMjJjaTc4Rk1FaFJ4aW93QjYrWWlLUzcrQW1CU3hpQnRRbGZDR0NE?=
 =?utf-8?B?dWx5TVp2R2hzdFZUNGMxUWdRVnRyUTdmb29vZ1pHRlY3cXYydjJyK0t4Rkd0?=
 =?utf-8?B?eUt1YmRBNk1lVHgwS2tCUlFBQitJeVFmVHB5WGhCQVluN3JzcFRneVMzNi9P?=
 =?utf-8?B?NHkwU282VklsalRCS2RIdjk0SEtWVFR4WGh2NjArb0d0cS9jVHh0RXVOeVNM?=
 =?utf-8?B?Vnl3VEs5emRIRlUvcThiL3dVa0VjN1V0OHB6bGFtbHpzZDQrZzQ0dTFUWEM5?=
 =?utf-8?B?d2xMUEJTUWM0M1RNeVZRZFFxSUM3bnlwVGZwc2F2dW9YRXRXbzRrSnFlcnB6?=
 =?utf-8?B?aXAzTFY5Q21BcGZHdGpMdDJwVTJXRDZESVBIQU82OXhKNmhiWld2OW0yb0Zl?=
 =?utf-8?B?d0NtZC9mVXVRUzY4cWFhb3dNU0JlaldoWWNHM3ZuS282NlN1eUFvYTVhSXJR?=
 =?utf-8?B?WUhNN3k0dUladFF1eWdETkZubG9OdkIrRGRheTIzbUtkbFJmdGVwdCtYTEpz?=
 =?utf-8?B?V2N2QVRZOUVoZGhyWjlsVmJtM3E5M0dtQURoRVZLbmVCZGEvWFVJTzlsUno1?=
 =?utf-8?B?RlNUMWZ0a1hTQWd6VmlpaGsxZ0Q4VmZybUxoekp5cWVhUnVzUS94eWhISEtY?=
 =?utf-8?B?QXNCU1ZDTnJRdFJVdmpTUmE5N21reEdKVWd5a3RGQ0d4OWVPOEU2NlhzV1BP?=
 =?utf-8?B?dHdWQ3VZcU1HbXNvUDhkUmFxT3VKMDhaWkZUa0REVy9Tai9TeFZ6UnlmMmNo?=
 =?utf-8?B?a2FIbmNIZUoxQ3VNd2RCTEVnZGVpR3NuWXZWU3NURytCenZSQlZQTExJa3M4?=
 =?utf-8?B?K0pQamZVT21adTdySkJkdzhDWFBDZVpod2lPRWpYMTUvSEc0enF2WnBkVEFn?=
 =?utf-8?B?TG11VHZNc09zN1dIdXRPOG4vQW9zWllRSW80aFFRN2Zra3FYNmlCaEVPaW5I?=
 =?utf-8?B?M3lzYk1XUXJWaXY1YWkwYlBaaFF6VmcxUjNXNVNZRUZVVXl4Y3FtNTRFL2dR?=
 =?utf-8?B?K0dHbE9ibFJHN2EweVJ3andyUmJYemJkSjd5aU1WYjBsOGIrclBERHJFb21T?=
 =?utf-8?B?WGlTTGdzaHRrM1RMUlFmTW9nWEI1dlN4VGVOZnJySVJIcjkySytmMUV6RkJO?=
 =?utf-8?B?RzFrbTBrd2FENU9OMUZDb1dwNE5SYU8rRjNBWnBJSFVZV211N3NLL0pzMWE5?=
 =?utf-8?B?K2xMVHdzdjVLWll2SzhyK1lpNEFTcTMydW1QRWNQdHc1UzhNVGZNZHgyKzJw?=
 =?utf-8?B?MHQ3YWFLbTByVjFZMjlOdkFUdzRFSkozUjNHUWFycXhZaHZNeEJOSVpybE11?=
 =?utf-8?B?YXBJbGwzcEJyRFQ3L0VwUmJ3MDlQaHFoNmJjMWRrNnVMYzEyTU1EenJlRUtH?=
 =?utf-8?B?QmZyc3dwWDhVQTRiUXdJM0JXcmxMYy9PSjdDamV3SDE3d3lWTnpkU1ZGeENZ?=
 =?utf-8?B?MWJEVkFiZjR1c0NCWERPU0pwMHhPd291elo2TUNENVYzY3BuSlhtNDJITHow?=
 =?utf-8?B?MGJnTld4RjlrYlh5TTlNaU9qb3RSZkJTUmg0NFBsSk4yZkc5alZyeEtTUUw4?=
 =?utf-8?B?TUhtRytCcE1DS3Fid1FmcWluT1JNT2Jhb3E0K3UxUS9XclZFYmhCd0dwT1Rv?=
 =?utf-8?B?UkdtNjdjclFCZW54TzFIMXZkWkg4K1loaVpRR0VVU1FJVHZTMkF2ZW1qWHgz?=
 =?utf-8?B?MWV1TnpYQldkMHYvSGx6WEdJNnIyVndLanI5NGE5TVBoUEhtRlJqYlMxMFAr?=
 =?utf-8?B?d2JHWnBROHY2MTc5dlgzTlVQYWRYOFhBWkIyQVN6T2kzdDJDcHFnbGkwZkFn?=
 =?utf-8?B?Y1dSWEJHZlVaSXg4cU1LVExZdi81Y3J1M0wwbHlSd3RLclNhdHZidTJJMzJ0?=
 =?utf-8?B?c3hEWDljV3F3TE5teFlpMkcvUnhnbkxicG5EV2lHVHpMcDVtZERYaUlxMnZw?=
 =?utf-8?B?VVp0QjVwUWhJZTZyRGpJdUtndVpiUTF2a1Q2NHpXWW01YmhJNk5DbkFFcjRQ?=
 =?utf-8?B?ZGozMTZQNFdEUlJwR25DazBrVEF6T2VGTngvOWIrRURFM2lYZDJMcS9VaXh0?=
 =?utf-8?B?M0FFYUVIVFJhSk9yMXM2eEFZSlR2WGIvNTA2NDZJa2E2bFh4cFhTcHdPTWZS?=
 =?utf-8?Q?618d26af1ugErvQs=3D?=
X-Exchange-RoutingPolicyChecked: E6YRwwxfhi1eLJ/Jx7uSrCWv5IlO3O/fHP4pa59+oT31/Yp3b5h8bxpAfvT/5MAW/oWUjgwid648w/KAXuMuGgV15wb4KxpcaGwkajNVjuC6/8BPqOdFrCnHgc35zU+quW+izyaHP+QCEk8qSREoorzFH1C49IXh/PZTARtgXYRlsduv+mGSBz5fDs+iGeCeyHpRd00ycy5KUXa68jdrfW7aRb6VMtvF7A90ejm/N2nztKElHmn5x3kNTcrX+QHPSqwWOgRNnqM2bBceJlWq7TVJbmA8Om2jjCP/N6j29mgKkicPX841W7sDcGR240MpCJn94aVD4He7EUusfFBy5Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 310496d8-c606-4867-0391-08ded907239e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 13:29:42.0875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ocoaWI0/uw7Y+w8pIMCm1JPM7rSnqKKoqPMYv0bBLpZtcn4NT8JKo9jzV5emED/j3mcqVI/QJWdl1rWjDhn5Kdx/itqvlBiGcrjYeQMLPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4685
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

On Tue, Jun 30, 2026 at 03:26:23PM +0200, Michal Wajdeczko wrote:
> We also plan to encode a text data as KLV. Add helper for that too.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 31 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  1 +
>  2 files changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> index e84d1f5f5c56..a5fcfc4a6c37 100644
> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> @@ -188,6 +188,11 @@ int xe_guc_klv_count(const u32 *klvs, u32 num_dwords)
>  	return num_dwords ? -ENODATA : num_klvs;
>  }
>  
> +static size_t to_num_bytes(u16 dwords)
> +{
> +	return dwords * sizeof(u32);
> +}
> +
>  static u16 to_num_dwords(size_t size)
>  {
>  	return round_up(size, sizeof(u32)) / sizeof(u32);
> @@ -243,3 +248,29 @@ u32 *xe_guc_klv_encode_u64(u32 *klvs, u32 avail, u16 key, u64 value)
>  	*klvs++ = upper_32_bits(value);
>  	return klvs;
>  }
> +
> +/**
> + * xe_guc_klv_encode_string() - Encode string as KLV.
> + * @klvs: the buffer where to place KLV
> + * @avail: number of dwords (u32) available in the buffer
> + * @key: key to be used
> + * @s: string to be encoded
> + *
> + * Return: pointer to the buffer location past the encoded KLV or
> + *         an ERR_PTR if there was no space to encode the KLV.
> + */
> +u32 *xe_guc_klv_encode_string(u32 *klvs, u32 avail, u16 key, const char *s)
> +{
> +	size_t size = strnlen(s, FIELD_MAX(GUC_KLV_0_LEN) - 1) + 1; /* \0 */

We're mixing up units (dwords / bytes) here.
Also - should we error out if the string would get truncated?

Thanks,
-Michał

> +	u16 len = to_num_dwords(size);
> +
> +	if (IS_ERR(klvs))
> +		return klvs;
> +
> +	if (avail < GUC_KLV_LEN_MIN + len)
> +		return ERR_PTR(-ENOSPC);
> +
> +	*klvs++ = PREP_GUC_KLV(key, len);
> +	strscpy_pad((void *)klvs, s, to_num_bytes(len));
> +	return klvs + len;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
> index 713ef7f7b9f2..1c576456efc5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
> @@ -19,6 +19,7 @@ int xe_guc_klv_count(const u32 *klvs, u32 num_dwords);
>  
>  u32 *xe_guc_klv_encode_u32(u32 *klvs, u32 avail, u16 key, u32 value);
>  u32 *xe_guc_klv_encode_u64(u32 *klvs, u32 avail, u16 key, u64 value);
> +u32 *xe_guc_klv_encode_string(u32 *klvs, u32 avail, u16 key, const char *s);
>  
>  /**
>   * PREP_GUC_KLV - Prepare KLV header value based on provided key and len.
> -- 
> 2.47.1
> 
