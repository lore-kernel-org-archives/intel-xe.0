Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F8ED39417
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 11:23:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62DA10E414;
	Thu,  2 Apr 2026 11:23:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hgKpzZ/C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D2F10E414
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 11:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775128994; x=1806664994;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nLzI3TjsoMcjyumssJ9uegS/MGNNz3iXtVl5gQKgtzo=;
 b=hgKpzZ/C9NWFuuuMlLpOtKZtefcNROrL6QYFe7+lqTH1kFyPQvp8mc+e
 22mHrEzkWMhd7DeSocGNnVH76iznGQ+ajuvtyg+5shglJn09gblCNS8lM
 OiGB1cMJLnYW6tahT4xrYaCDtz7/8axOnt8v0mGUJteTCq4vgbJHGMSWY
 vuRxv02qx8qHKIhS7iqQlLcoBcu+46Jpla9srNsNRNgRe91sNlZTAmoze
 ICzz95XQ4ptZeHmBtBmbrFCso46a6Y9G4UJDu5hqQOxLEj74N+MxfP1Xy
 KBFhhH4bcfP7Eq2SXc4h5BvTJMTKoqrkIOXtP7cqgRonBvfpItWSVHWxR w==;
X-CSE-ConnectionGUID: BSsZ9iuvT9CJLlouBUuw9w==
X-CSE-MsgGUID: zoIye4ObTcylEgcE48OSDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="63735959"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="63735959"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 04:23:13 -0700
X-CSE-ConnectionGUID: WqeIpinnToKWv0vEg8ahjA==
X-CSE-MsgGUID: mQRF+jOTRbGxboJOo/9Gbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="226927648"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 04:23:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 04:23:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 04:23:12 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 04:23:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ioEbDwdqN2wWzstbEVIHmd0cBJosgJdp4+rieCd9UP2lHCjbv2shAfv5jVg+YpjihWe+L7H7CVBc4CkunBfaMQ7Qf8Ajv76Vh7vcHSIdgC1CkWiG+OnNs9aXQ5LpvFNCP0JOjx7PuxXrb2wkZv0ZQ4MRfWIy9KzEcZZQ+2QsdkSemXvhxq/DCDcvVJCXrpNrWKHx3FxcziyWRK2Ed6lp/q7u8Og7iYbThWDXC/oOl9t/4dHHlERjCC+0HJmMxtogdiZ6Ooz4mH35RiwsBCYbDlMXo/mv8XJoeGUtIaRNzPN7hV8YwMUF+uJHYXSybNcgm5MHwdu109re57xKF6WH4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKK7HAd22RhNaMnOX8yNxfmmjq0qU/SORjZC4paPA7s=;
 b=I7nPVZ/yx5rl6HVywbDsp+J63HcU/WTdQARfHLDXftzJ8DXRU1aY42VQgKm/GiTcOGR/jn6GzSL46k1nnrNZ864HmeGOwPqsIlMu0txa3O4Gv3f4EVxeMEoJYam0/sB52Eg7ISgYpAqO4DtkVw+tAWqNQJTy4+FqCK4t+TNSwxsVQyeridV+JYVmbbFu8UJZ80AdHSngIriuAUtRdfPhldwQlZNJon/PmqNEVw+OGRsfs3JOcenShxRCmkiyeuMun6dP8PVRENWOG1UcrJ+hvpVm6F08kDUB+e+rt1S5pzytK7dB3hWZu5mplhzCK4S1nxnHfPyZv0wYXP/KCpK0LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by BL3PR11MB6361.namprd11.prod.outlook.com (2603:10b6:208:3b4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.10; Thu, 2 Apr
 2026 11:23:09 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%5]) with mapi id 15.20.9769.017; Thu, 2 Apr 2026
 11:23:09 +0000
Date: Thu, 2 Apr 2026 13:23:05 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 05/13] drm/xe/pf: Reprovision policy settings after GT
 reset
Message-ID: <20260402112305.iwt3al4nhe2histm@intel.com>
References: <20260330204046.567-1-michal.wajdeczko@intel.com>
 <20260330204046.567-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260330204046.567-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VE1PR08CA0001.eurprd08.prod.outlook.com
 (2603:10a6:803:104::14) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|BL3PR11MB6361:EE_
X-MS-Office365-Filtering-Correlation-Id: b8af8594-4b0d-4c5b-9898-08de90aa383e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: ivy+Kamm7NcG+/gbos1hG0u2xRX7o18GMPYUro3IdAKLvwgYse0q/x89GyJFHuwlzPUXKUqWyfgFUWg7EqW5RRe44/V9me7yYq5gJ0ryO32PWPbfaNhwok8KguTXdzIFy86+beRRkcRQNp+JMzXZKIerE7kYnltRvrpViptgUh8YdPOz/QxZbdNQpo+tZrtNddiR3aUx7KE0FSNgmmxyTTJcN4hIgNbq5XxVfTLlIo4p8zZ7WUV9QkZIo1eoqe8sIj5f2zfNXksgJE6/rCwOSHoilIUNeRF0DmDTMW+ew5pQiyy5vwLUMbOYRzqTjjH4GTQeyQnDoGN6t/aczHooBeUwuGfMoTUANDPqrarE+uXPW/mO8n5nUsmUSrZorwVA2u+3TgJmWwG802Ur3yJZbn9SwG3nyB0zFYLVcKfo5wKgqPfIGb3uM2Vu+fWUWGAuEY0OXFh+qFt0rg+9OrN0ipjZdK67QzaPWypMF2asMRfkRQddM7exkRgAB/WHVNU0TfzuLx2eUQq4oZ803LlznM+4qCiB+2fQGT9Hgpi7jl5cGWeoG94FuWza0u26wgJglw9lsp5BZskjHf74MshJ4K+Fg2YhqjEIFZ+ompGFL8/Yd/6zsWXEq4lOgtn/N3v2/LzO+I4qn1hRVId86U9dC8jlThaw2U6skIm1EcFsToc4bH3Dvbwf0V+osrKbpnPRFEZH8Iok2A9ix0mjLYh1wo66cD9Yv5XenBlW4EUwGGA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWRPU2c0aGl2TC9NUWwwckpKdjVhenA4dlp4QlBsWXBNNzF3L3BEK1cyY0RP?=
 =?utf-8?B?L0RzYnNzZDhVOWE5MHcyRE9oalIxT051T1YwaWVpZTNQZ2lDdGl3bmRNazVq?=
 =?utf-8?B?dUZyUkkzQ3NlZS8vaGRGZGUrV25KVzIvYWFweG5WLzBNYTV0OWEvMTJhOXFK?=
 =?utf-8?B?VVI3OVZaM0tpVzdqdzYyZzBZTFlxbjVmRy9OU2hZa0Y2eG1OeWtEWlc3cXRK?=
 =?utf-8?B?cTkxZzd3UVR3MDJ6Wi9JTnB5ZlREUzFFQkhaZFlhVWxmWE9ueTZxWDE2cmtT?=
 =?utf-8?B?NXQzcmVwTkRnZS9KQUR5SC9TK3FrMnd4TFN3M2RxbjB0VlZqSWVOd1JZR0dI?=
 =?utf-8?B?bnN2Ly9HSmh1T0xwMXBjSmlKenVmcWFhSGV4YzFpenFlcC9JdEFZTHlzSzh2?=
 =?utf-8?B?SXd5NVpsVVNRVmdobFRRMWVkUjNvNGVRMTBJVmpuREkrVTlFZmU3VERlREl6?=
 =?utf-8?B?REwzSWJpQzdKMGdTVXZQeFhrQVZjQ1NhSGt5TzF1OHY3cWZubnI2cUhUZUJ2?=
 =?utf-8?B?b3RVdHMrWGFYcGVBSDlVLzNkZVZNbVp5dkdrcyt6K1pWS2t3c2pGekxralZu?=
 =?utf-8?B?VzNuM0tlWC9RS01Ud1ZvU2NHVG8yUkUvT3d2dnBSUUt6VE5DOWo2R0N0K3BX?=
 =?utf-8?B?aEZlcGE0b3ZCUTNnb3BEWjNWcmR0SlN3bkdxd0kzSEtHNTVrZGlsSjJjYnpB?=
 =?utf-8?B?cy9OQmlmZTd6SGZEM3BrZGhXSFhLa3gvMFNPNnpvTTVueUo0bHVEcHY5U1RF?=
 =?utf-8?B?WEorOWN4anU5OFR2SHN1Z2NiSUd5dXViK0toV3VaemdMcE9Nb01Md3U4SVl4?=
 =?utf-8?B?UTR4VStmdnlMR3ZNNnllUHdtaFEyajhRRXp5NklOOVQyR3dIL1NNWU9nd0lU?=
 =?utf-8?B?TGdkTzNrM0I5dDZNM2o1bTN2dkNxWDZJNG9Ka29RcVF4R01zRWliQjBzdmV5?=
 =?utf-8?B?dzZYQTlMSzYvY0dMVWY5bDVZazN2eTFRSWFJYy9zM3ZYL3gwY0I3clFMZ2xR?=
 =?utf-8?B?ckpyZURuWURWRy9oQjRleEpsOXh5ZlRVcmY3cWgxb1BWVlVNa1MvNFB0L3Z3?=
 =?utf-8?B?cGk5d0pSYXY2azRadVpqOEpPaXFONTJnMG5ZeTBNRUZTMWpFZEhkWVBJakJv?=
 =?utf-8?B?ZktKcUtxa3hIVVd4Y2xDNEZoSmZVRzlIdmRTbDlTZGQ3ZFZrc1FGTDVrb3k2?=
 =?utf-8?B?Z3YwS2FuR2x4N2RWZXY2c1kwRTZ6S05wbEFOMWJEN3h2UWRyZVFyeG9BaEdz?=
 =?utf-8?B?bTRFV3U4Z1pPOXcrTUdJOWJBUTVoTG9CZmlZSEJhYnc4SGNoeklkNVl4OGtI?=
 =?utf-8?B?N0ZXbUVqajhLM1lDT1BZWGgrNnlEcVNTdDR6VFp1NFUvUjV3T3JXMWVOVEhs?=
 =?utf-8?B?QlVabmpUM1BZV2dUT1BVdFdWMGdWZ0R0TXBTa01NN2NWeE5uWkV0V0Z0UTBS?=
 =?utf-8?B?WnMwVU1yZXZMUE5seGZ6eEdVcWRhOTRUUlVJNFdSbU5yUE1ZMzV4Ty9lQWo4?=
 =?utf-8?B?TGErVEo3RmlEWGFpdVlOTnV1ZjdJa08zMm9hRWs1cWc5VUJsZEFPSGdlYWkv?=
 =?utf-8?B?YTlFSkdxV0dnWldpMFJjTHhrMlp5ZHh2SXE4RG1uajhtNndEWHVuZ3g4Smhu?=
 =?utf-8?B?NzV2VXdSWGNkRmw4ejgvTXhQOFJGS0QrSWYxMzZJZEJkbnhJU1RsWWNtc0N6?=
 =?utf-8?B?bEtNNFFjeTRXU1prTk1NV2FWV1hPTnFDV2hMa3B2WDBQekg0dW1VM2d0MjNF?=
 =?utf-8?B?dXRZK1JxNENPYW43NkNxUERzWWlKbVBwbUhLUmdXemVreERCcC9VNTVMUEVu?=
 =?utf-8?B?UVlWUlBBM3ZzWjMyeDBCZWxEK1lzclNlK09CZnhOWlpvMis0SjI2VWk0MW14?=
 =?utf-8?B?Z3RCV1NuOWp0d2g3RU93MXMyazBuc2RPamducm1MdkljazFMYTlSaXI3TXFu?=
 =?utf-8?B?ZEJVeWhWaE9OMzMzTnAzK3VFbkZWRXA0azVucVh3aStCb0RXQUpmTFZmWnBT?=
 =?utf-8?B?Rms3OFozOXdyVk1vMWt1TDJJVTR3SHY5K0dRSzJJcWFRcmk2VWpmbkExTHFx?=
 =?utf-8?B?Uk5MRE51TmZrdDlERkFHZ0FNWHRoV2ozdmxUNnhsRXJvenJQRnNyK1VYRVVR?=
 =?utf-8?B?L0tLdEJZVnE5VXVpMXlTSTloRno0WEhrRjU1RWxwN0dsd2poSGRRd25Mczdn?=
 =?utf-8?B?eVdnSUNJSGhHZC9VbUVESTZqUnBIQlh3enJLREhBdWI1U1QrR3ZyU1hEU1Q5?=
 =?utf-8?B?NFRJOVNSWlV5ZVV6YVlMOTRkcFVXRUZNUnpiS0FRT3dTMnNqWkRWZS8zR3hB?=
 =?utf-8?B?L0NhNWh3dWZ3VXFidk8xNG9zdG9kaXBhRXRXT1RYTGVyVGh5NndjY05EOGtV?=
 =?utf-8?Q?DtD9devOeIA558/4=3D?=
X-Exchange-RoutingPolicyChecked: fykJYbsLPmuQI3JzZ3w7jCPbGgEpcTS+WPgYTufnU4pGhEl7VUDrR2xP1+0hfwfo6h++xGzb2gZITLuyBjynXvKNq8eOy3JBcQtwhK5RAJ5XAwe19FiyemhPX6uOWnOzhWFaikCikr/mA581rd9roIOE2NZQC7wzZvKmBahcINIwtGRYlnRK+cbC91rLnyWLGL3TOeONe3pvaOjcp+OFRCASg9SiAA3ou4+k1VOk5OGGsIXn2yePa1K4SdgcklPo7fxcKuTgG1k2PsNyY9gHVx2Gh8PtG+Q/9pZRG9dgb9PRQHBn4pr1P4J7JJ4ZNZkIdy1VNLb8ba3mAzRjrWK7hg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b8af8594-4b0d-4c5b-9898-08de90aa383e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 11:23:09.6763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BvfElJL4OscAgNi509OeGZxJKV64hE4TL6xJnzwMCAfzpX4Lgh29nyHXy5bmRPvSMc1Kuk+5uzkMhu2fR/UrJX/Id68OsRMqmO3IWb/4QVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6361
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2026-mar-30 22:40:36 +0200]:
> In addition to the reprovisioning of individual VFs configurations,
> we should also reprovision GuC global policy settings. Note that we
> already had a draft function for that but we missed to call it once
> we started handling GT reset. Reuse it now but don't take extra RPM
> as this is now a caller responsibility and drop unused parameter.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c        |  1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c | 14 +++-----------
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h |  2 +-
>  3 files changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> index fb5c9101e275..7868056841b3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> @@ -219,6 +219,7 @@ static void pf_restart(struct xe_gt *gt)
>  
>  	xe_gt_assert(gt, !xe_pm_runtime_suspended(xe));
>  
> +	xe_gt_sriov_pf_policy_restart(gt);
>  	xe_gt_sriov_pf_config_restart(gt);
>  	xe_gt_sriov_pf_control_restart(gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> index c88c4e6a9b61..aa80b4abd42f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> @@ -17,7 +17,6 @@
>  #include "xe_guc_ct.h"
>  #include "xe_guc_klv_helpers.h"
>  #include "xe_guc_submit.h"
> -#include "xe_pm.h"
>  
>  /*
>   * Return: number of KLVs that were successfully parsed and saved,
> @@ -692,30 +691,23 @@ void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt)
>  }
>  
>  /**
> - * xe_gt_sriov_pf_policy_reprovision - Reprovision (and optionally reset) policy settings.
> + * xe_gt_sriov_pf_policy_restart() - Reprovision policy settings.
>   * @gt: the &xe_gt
> - * @reset: if true will reprovision using default values instead of latest
>   *
>   * This function can only be called on PF.
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset)
> +int xe_gt_sriov_pf_policy_restart(struct xe_gt *gt)
>  {
>  	int err = 0;
>  
> -	xe_pm_runtime_get_noresume(gt_to_xe(gt));
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
>  
> -	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> -	if (reset)
> -		pf_sanitize_guc_policies(gt);
>  	err |= pf_reprovision_sched_if_idle(gt);
>  	err |= pf_reprovision_reset_engine(gt);
>  	err |= pf_reprovision_sample_period(gt);
>  	err |= pf_reprovision_sched_groups(gt);
> -	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> -
> -	xe_pm_runtime_put(gt_to_xe(gt));
>  
>  	return err ? -ENXIO : 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> index bd73aa58f9ca..c9d4c4aaaf5d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> @@ -29,7 +29,7 @@ bool xe_gt_sriov_pf_policy_sched_groups_enabled(struct xe_gt *gt);
>  
>  void xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
>  void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
> -int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset);
> +int xe_gt_sriov_pf_policy_restart(struct xe_gt *gt);
>  int xe_gt_sriov_pf_policy_print(struct xe_gt *gt, struct drm_printer *p);
>  
>  #endif

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.47.1
> 

-- 
