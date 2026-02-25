Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB79EEFD20B
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 09:04:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7161110E72C;
	Wed, 25 Feb 2026 09:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HoPtS2lu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9DB410E733
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 09:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772010254; x=1803546254;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eAR1sMQmpGbYDCs3gewtplXYy1unvn618abriY7vQZ0=;
 b=HoPtS2luDTrkbU7TvM8wWawM8YTGo/8uSd4T3WaBHLiCqZ8g8QPoeLFC
 xBckz0xPJnddDtsxTOjujNWbKjPGYbivSI5WrvLgn0Om9FypiRhVdxVs6
 ZcK8F0uuRAJLD39LB9nN2o09ex0jkcwvvBRKTGsyMp49C3N+TlTC5n+dT
 cisWcQCEeCkjoJDstCZnjZ8jFDRlJBXJ1VXmFIN8cZovKf6Z+UT2oSgt8
 p4M1TOLi1DuJeZyezAaxuhkcivWg7YPJlT0EJTOaTpRmLOmEZAIDA41l+
 3ESrjraaEFueFSCSBAlldmvUbjy7Ou/GciJkp7/JSawfGCeAEkm0mIwb0 w==;
X-CSE-ConnectionGUID: 6YpvIAd6Tmy6I1ERflcpkg==
X-CSE-MsgGUID: /ToSPilDQ6CHQhA4hH8a+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="83668546"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="83668546"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 01:04:13 -0800
X-CSE-ConnectionGUID: oJUJZsoeTZKbb/VhvOlJEg==
X-CSE-MsgGUID: 3u6OHqMSQNaV9uEYtoIeqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="216057675"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 01:04:13 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 01:04:12 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 25 Feb 2026 01:04:12 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.15) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 01:04:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KrcosJsnqj5dBsKY90kZXFok1v0vR02xKmzLiqa1dGRiDC7/tOBdKWLgI+jUzUkzty3Pg2r5CEJIB4kWDMw/7S7VpxTUgCN2+gRzODgeAC9ElUDxmBUnGgdpw2FqhGv/BENeTybtvT5SVz+SLKNvYEsOoRPeit9P/PuqnEugGDCjMLigrnI2pBlbxnLjb6CPoWCYLxinq/0pW1U+PA+l0pJXFNdZ3fkxLYsbVrPdR9kkP3RFcEwsZNXGiM7ObUxKCOh+WDhYGpXQGr9TisFmgp4zJA8ZbIp5XRlG4EX2fbkFSuKlaPiCi9Knk3pGAi77X/LBovOXqwPB7CQeh+7Zdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaNXdk0QWxnD+LWuTJmwxOaJb9OH+GiRrjawCWTMs9g=;
 b=raV3tDIbQOsMV87dvMWeVfGEOJ3K+qnsBUNlGRYomJNUGBC4laYcvkkBJTFvP5PrEda9sI6hwe/TAy9/Tl7F0UsRXuTK15nF9Nmdus/Z9GuhmweTFcfcLY+43Sbm0bmFxE0sNF38pfuuS4mM94SP9fTtvVeq2pyLqD3DU+IRkWWqc3B1pHeeYYjw1DwcITYgVWdWWumHPkLe+xGZ5P7agOhHU6pwbhxxRngjzhSLQjRFyX21/3KjuV87M5ctDHhIrZ7UUTsk6ASpxun7JlEI7H8i7jQ59jE+kUBUbAtENV8oJPMtDMOAI0aJiPVO4IlRDS19sneZ/NHOpToMDzMrhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 09:04:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 09:04:04 +0000
Date: Wed, 25 Feb 2026 01:04:02 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: "Yadav, Arvind" <arvind.yadav@intel.com>,
 <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <pallavi.mishra@intel.com>
Subject: Re: [PATCH v5 6/9] drm/xe/madvise: Implement per-VMA purgeable state
 tracking
Message-ID: <aZ67AoEmxHz9rkly@lstrano-desk.jf.intel.com>
References: <20260211152644.1661165-1-arvind.yadav@intel.com>
 <20260211152644.1661165-7-arvind.yadav@intel.com>
 <823a16af4733d5b82470b6ed6da203de09644caa.camel@linux.intel.com>
 <5aaab739-2291-441e-937b-746495ce7d58@intel.com>
 <aZ3TpuSFKzY4y9sg@lstrano-desk.jf.intel.com>
 <14753c79-df95-4c14-b78b-cbee2670dac4@intel.com>
 <de396c52e6ca7377cd9f6e58b172b2232da4de4c.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de396c52e6ca7377cd9f6e58b172b2232da4de4c.camel@linux.intel.com>
X-ClientProxiedBy: MW4P221CA0016.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB8283:EE_
X-MS-Office365-Filtering-Correlation-Id: c45f7968-4775-4ea7-fd72-08de744cd364
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: HuN0MUOq87JJmqgnXYRnI4doVozJTiqVIJTZjjmmPmtMZk+JpegjCjvZSFKmNhQb9T/620zCukH/8awdUd7F6xYtFEkk5XE/iQREnRRghPv7+HAh4TM+VBWNfu00Lo2XctadfD+GRZxsyqx6rzA1HWOjVwdzUEpD5LzuNWDABfg5GedsYw6ep22zDTaGku8ulOBCQR+qkqyqubcuYNpRX+lfWnxpSlUG0eeC6DFrEH0z0K9v4clViWQlZmurPscHHRHxDNm8iLD9F/eqj/bkYDvCdiPRDZyQZLr3TWqstUCQYNHE+MWFSFpXDEuZ3ciZd9xLjM3y6IAIsv7ZeZF39OYCOMUUCEBTiMxpbLedU2lFToR8ffuqWawqifamtVB/acAXPNIpluSjEh/sUi2bHGJEPrzPN6vW3ZPzWszV0nL1l3XPl159AKSQgMoTwzpcrBWo25D10lgem6aJww+ERpiki4MDpekjQzPJMyakUZ3D5H5kiYQWDPVprOwhOOogEX1CqqHO7EO0z0Qf5KZttEov6UVY/4NBHTy6oQwwPnADKiEksAYNDjFIxPdt6802Dqm1j3r8cu7wbucgsWrkc68ArDSoQMpWLsnaETPGzu2rC2NkZbiCvOVIgxv4TImnZ+PvpAThuxJZ/rBUmqKTFxa5WHh7SoIMZpT8wc0pX+9anwhst/PA6/SbxH8rhM2c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YktWeEtPOTc2WHF5anJ0emtNTDB0L1p6cS8xUFlGT0hQdnlwem9WcnEyRHJt?=
 =?utf-8?B?cHlpOGdyUjY2K1Avb21oaWdwcTg0QjZGVVRvT1p0UDFoRTdMNU1Pc3JuRG8w?=
 =?utf-8?B?VzhaRmphNGwwcU5HRlpQZGl2YVg1SHM5UUZUblNuS2xYWHZaQmcyYXlOc0Rk?=
 =?utf-8?B?TEhncnJhZFk3b0lzVnJXVTdnSzB4VVN6YS93dXVxVjBhcFYwL3dnRG14NFpL?=
 =?utf-8?B?cFAvaUxBcjl1a3lYeWMwcFp0U3k4QmkrTVliVGJERndlTEZGSnlLZkNnNW5y?=
 =?utf-8?B?OXRmSi9nL0lCZ3N1WVNkQ3h3aUFQY0pDVkVIdEFrSVpoVUV0RVI4emdFTVJR?=
 =?utf-8?B?bmt5MHdaRVpqZEdXeUFWcjQxNVZZbGhJUzVSTlZjbWc1eVdCeVZZVjNqaS9T?=
 =?utf-8?B?a211N1p6UDZobSs2S3VSVXU0QjNTNVVwMU9YY1h1SUFmR2RRcGpxUFlhTjlB?=
 =?utf-8?B?NDBrbklZejQ2Y2c1WUpnSjJUNHVHdWEzNy9HcUk3bXE2dUIydnhjV2tobUtW?=
 =?utf-8?B?MzdYUEZjSkpKVjFLclZGdUtnNlkwWHBpbDRVSjY2b0VqUnRsenEzeURkSlZm?=
 =?utf-8?B?MW41MGl0Q0xFTzh6UU51bklJUWFoU2FRSHZ5WDFpdnRLTTYybHlmR2dzckY2?=
 =?utf-8?B?ZVphcGo0V3NhSTJYcEVPcFVZc3dsSjNzWUV0aGZLVy9zTjRWWmxrZGdyaklO?=
 =?utf-8?B?U01SVlQ4VWpOL01iY0tPRUQweTA1L1pCeWZVaFpPV2tiaFRGcm84SENaOEJm?=
 =?utf-8?B?RmpUYWhsVG1VQlIvcDl2WkIzTDBZa2N1anZHSGQvMTdnMWE2T20vUnY0a0NN?=
 =?utf-8?B?Y09OdnA3aUxDOUNoNTdPeDJiVUV1L3I2bmtSYzBzT1hBQitHb0NnU1M0dEZ6?=
 =?utf-8?B?NzhxL3VoT1F2VHZ4K0RZMnk4aEN0cm9aTUlzQTdzend3UWhtaHIrNGxxYUhM?=
 =?utf-8?B?dmx1Y0lIVklUTGlsL0h1VE5ZVFFLSm0rV2M3eXFucWs4Qjk2Z29uNlZuSUZC?=
 =?utf-8?B?ZjJQYUJUYjdNTGZiRmhTM2JIMmVnNFF3d0dLUVNOUjFNbm1iV0hJcTJiQ2xt?=
 =?utf-8?B?MlppY2hrSXA1OGN6anpqYXlabFJMazgvRjBweElia0owQnR4amt3RE8zSVBO?=
 =?utf-8?B?ektiSmpPSkV4blRpNmpmb2J6cU5uOTZnTU42UEFTS0wzNWZRSW51bkkzbWV5?=
 =?utf-8?B?NTBSSGNrWFVqcldlRWt3emNFeEpJSWRhcnNpaTlVQ0FJUk1kU2hTdVRIb3pN?=
 =?utf-8?B?RzhVZ1VzN3RRZEdKbHpWZFkxRW9vT3c2cXZOWkV5WmFQR05WSnJNcVphZ3BT?=
 =?utf-8?B?VTVlamlOaEhpWXpIaW12cGF6TVN5cW0zWlU2Mk1IMnJ4d2hiK2hRQ0tta0Qr?=
 =?utf-8?B?eVhXUEU3MDdQMk91bWVXTE5HOHlEdWg2czRORmxFcDJnTFp2VHc4WGdWQ3A0?=
 =?utf-8?B?ZFlPOXZ3ZkVYZ0FiaVZBV1FyK1BabDBRUmdMTVUxVU5hQkp0RzJ4Tm90N1Y4?=
 =?utf-8?B?dEp5UVRwRWxrWDlOWktrbWhoc0ExRkloNFJseU9HNnU3UytFMXBCNlAwMERt?=
 =?utf-8?B?cHJrSVJlemExamdFQmVzaWlVL3JhZURETmUyOHY5YlpGVTQ5VkdRZ2FuUlVW?=
 =?utf-8?B?dnZZZzlwcWl5KzBPUmNjNCtqZ3FnVkFVREdkNVZnaXNHMHhXY3MveGlqc1ZK?=
 =?utf-8?B?bjM2M2c2a1Fld3NjWDYya2xHZUpYRGY5d0VjYjJ0dHFRRGdtQzVhVWdlWkVa?=
 =?utf-8?B?eHRXY0VhYk5lK2FKdFZKSC9PV2pjZHUyTFlNQ3gySldUU0pVS0xSUHRtTkZa?=
 =?utf-8?B?OXduaWUySU9qa1l5OTN0aEt5YkJFOVpHYzJML0lxaUg0bVNEcGVWREdlejFZ?=
 =?utf-8?B?NTJrbTE5SE1BY2loSGFzQzVWOVBlZlBnK2lkVkxoT1R2RmYvT0thMllDdkdT?=
 =?utf-8?B?ODN5Q2hjZVlsdnNxUEVoNnNsSkZrdGNFMnJYM3RIaHNoeElIRnRtZGxqK0Nt?=
 =?utf-8?B?NFhab1EwMU9jaE5WU2FybGhNQ25VdXFydHNQTVhIUDB1WkNlZFp6dGpjbnlH?=
 =?utf-8?B?TWFHWG9JODJVZ04xMkxZZTZLS1Z0MWhBOHNzeU5hMGx1NEw4RjJKZnJ4Tjd4?=
 =?utf-8?B?ODFPeHhOQ2FXTVlSdE5XK1UwV0FYZ0R3SkNpQzRDNEJsQm5tSU9mVEF1K2Ft?=
 =?utf-8?B?YVowczJJQmVDOE9uTXFKMDRZUVNiRjFGOHI5ejZoNENZajlraWZMK3Jrclp1?=
 =?utf-8?B?KzdxOWp0ZktMWFpqUjV0MlpORnA2WTlUKzR2UlJ0Vk16VXg0NFQ4VXNlaklI?=
 =?utf-8?B?dVdNNm1vRXNhUVU3aUFJUWczQmhYWkNUL2xCdkxmd0tWQ294dTR6eGw4aS9X?=
 =?utf-8?Q?7UDvdJ7c+9KxwRus=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c45f7968-4775-4ea7-fd72-08de744cd364
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 09:04:04.7604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xw+eeW8mZcyxC8aI5tne3+eMb/gC/yH6gIRcrqzQyAxbAsvVAAXBWli4eUnM1Yb1xKKuVrxNUOweGu8zXdaB6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8283
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

On Wed, Feb 25, 2026 at 09:21:10AM +0100, Thomas Hellström wrote:
> On Wed, 2026-02-25 at 11:05 +0530, Yadav, Arvind wrote:
> > 
> > On 24-02-2026 22:06, Matthew Brost wrote:
> > > On Tue, Feb 24, 2026 at 08:37:44PM +0530, Yadav, Arvind wrote:
> > > > On 24-02-2026 18:18, Thomas Hellström wrote:
> > > > > On Wed, 2026-02-11 at 20:56 +0530, Arvind Yadav wrote:
> > > > > > Track purgeable state per-VMA instead of using a coarse
> > > > > > shared
> > > > > > BO check. This prevents purging shared BOs until all VMAs
> > > > > > across
> > > > > > all VMs are marked DONTNEED.
> > > > > > 
> > > > > > Add xe_bo_all_vmas_dontneed() to check all VMAs before
> > > > > > marking
> > > > > > a BO purgeable. Add xe_bo_recheck_purgeable_on_vma_unbind()
> > > > > > to
> > > > > > handle state transitions when VMAs are destroyed - if all
> > > > > > remaining VMAs are DONTNEED the BO can become purgeable, or
> > > > > > if
> > > > > > no VMAs remain it transitions to WILLNEED.
> > > > > > 
> > > > > > The per-VMA purgeable_state field stores the madvise hint for
> > > > > > each mapping. Shared BOs can only be purged when all VMAs
> > > > > > unanimously indicate DONTNEED.
> > > > > > 
> > > > > > One thing to note: when the last VMA goes away, we default
> > > > > > back to
> > > > > > WILLNEED. DONTNEED is a per-mapping hint, and without any
> > > > > > mappings
> > > > > > there is no remaining madvise state to justify purging. This
> > > > > > prevents
> > > > > > BOs from becoming purgeable solely due to being temporarily
> > > > > > unmapped.
> > > > > > 
> > > > > > v3:
> > > > > >     - This addresses Thomas Hellström's feedback: "loop over
> > > > > > all vmas
> > > > > >       attached to the bo and check that they all say
> > > > > > WONTNEED. This
> > > > > > will
> > > > > >       also need a check at VMA unbinding"
> > > > > > 
> > > > > > v4:
> > > > > >     - @madv_purgeable atomic_t → u32 change across all
> > > > > > relevant
> > > > > >       patches (Matt)
> > > > > > 
> > > > > > v5:
> > > > > >     - Call xe_bo_recheck_purgeable_on_vma_unbind() from
> > > > > > xe_vma_destroy()
> > > > > >       right after drm_gpuva_unlink() where we already hold
> > > > > > the BO lock,
> > > > > >       drop the trylock-based late destroy path (Matt)
> > > > > >     - Move purgeable_state into xe_vma_mem_attr with the
> > > > > > other madvise
> > > > > >       attributes (Matt)
> > > > > >     - Drop READ_ONCE since the BO lock already protects us
> > > > > > (Matt)
> > > > > >     - Keep returning false when there are no VMAs - otherwise
> > > > > > we'd mark
> > > > > >       BOs purgeable without any user hint (Matt)
> > > > > >     - Use xe_bo_set_purgeable_state() instead of direct
> > > > > > initialization(Matt)
> > > > > >     - use xe_assert instead of drm_war (Thomas)
> > > > > Typo.
> > > > 
> > > > Noted,
> > > > 
> > > > > There were also a couple of review issues in my reply here:
> > > > > 
> > > > > https://patchwork.freedesktop.org/patch/699451/?series=156651&rev=5
> > > > > 
> > > > > that were never addressed or at least commented upon.
> > > > > 
> > > > > The comment there on retaining purgeable state after the last
> > > > > vma is
> > > > > unmapped could be discussed, though.
> > > > > 
> > > > > Let's say we unmap a vma marking a bo purgeable. It then
> > > > > becomes either
> > > > > purged or non-purgeable.
> > > > > 
> > > > > Then an app tries to access it either using a new vma or CPU
> > > > > map. Then
> > > > > it will typically succeed, or might occasionally fail if the bo
> > > > > happened to be purged in between.
> > > > > 
> > > > > How do we handle new vma map requests and cpu-faults to a bo in
> > > > > purgeable state? Do we block those?
> > > > 
> > > > @Thomas,
> > > > 
> > > > The implementation already blocks new access to purged BOs:
> > > >   1. New VMA mappings (Patch 0005): vma_lock_and_validate()
> > > > rejects MAP
> > > > operations to purged BOs with -EINVAL via the check_purged flag.
> > > >   2. CPU faults (Patch 0004): Both xe_bo_cpu_prep() and
> > > > xe_gem_mmap_offset()
> > > > return errors (-EFAULT / VM_FAULT_SIGBUS) when accessing purged
> > > > BOs.
> > > >   3 . "Once purged, always purged": Even when the last VMA is
> > > > unmapped,
> > > > xe_bo_recompute_purgeable_state() preserves the PURGED state - it
> > > > never
> > > > transitions back to WILLNEED or DONTNEED (see early return at the
> > > > top of the
> > > > function).
> > > > 
> > > > The only way forward for the application is to destroy the purged
> > > > BO and
> > > > create a new one.
> > > > 
> > > > Regarding the 'no VMAs → WILLNEED' logic: this only applies to
> > > > non-purged
> > > > BOs that happen to be temporarily unmapped. Purged BOs remain
> > > > permanently
> > > > invalid.
> > > So I think xe_bo_all_vmas_dontneed() isn't 100% correct...
> > > 
> > > I think should return an enum...
> > > 
> > > enum xe_bo_vmas_purge_state {	/* Maybe a better name? */
> > > 	XE_BO_VMAS_STATE_DONTNEED = 0,
> > > 	XE_BO_VMAS_STATE_WILLNEED = 1,
> > > 	XE_BO_VMAS_STATE_NO_VMAS = 2,
> > > };
> > > 
> > > 
> > > Then in xe_bo_recompute_purgeable_state() something like this:
> > > 
> > > void xe_bo_recompute_purgeable_state(struct xe_bo *bo)
> > > {
> > > 	enum xe_bo_vma_purge_state state;
> > > 
> > > 	if (!bo)
> > > 		return;
> > > 
> > > 	xe_bo_assert_held(bo);
> > > 
> > > 	/*
> > > 	 * Once purged, always purged. Cannot transition back to
> > > WILLNEED.
> > > 	 * This matches i915 semantics where purged BOs are
> > > permanently invalid.
> > > 	 */
> > > 	if (bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED)
> > > 		return;
> > > 
> > > 	state = xe_bo_all_vmas_dontneed(bo);
> > > 	if (state == XE_BO_VMAS_STATE_DONTNEED) {
> > > 		/* All VMAs are DONTNEED - mark BO purgeable */
> > > 		if (bo->madv_purgeable !=
> > > XE_MADV_PURGEABLE_DONTNEED)
> > > 			xe_bo_set_purgeable_state(bo,
> > > XE_MADV_PURGEABLE_DONTNEED);
> > > 	} else if (state == XE_BO_VMAS_STATE_WILLNEED) {
> > > 		/* At least one VMA is WILLNEED - BO must not be
> > > purgeable */
> > > 		if (bo->madv_purgeable !=
> > > XE_MADV_PURGEABLE_WILLNEED)
> > > 			xe_bo_set_purgeable_state(bo,
> > > XE_MADV_PURGEABLE_WILLNEED);
> > > 	}
> > > }
> > > 
> > > I think would avoid the last unbind unintentionally flipping from
> > > DONTNEED -> WILLNEED.
> > > 
> > > What do you both of you (Thomas, Arvind) think?
> > 
> > 
> > @Matt,
> > 
> > Good catch—I missed that transition. You’re right: when the last VMA
> > is 
> > unmapped from a DONTNEED BO, the current logic can flip it back to 
> > WILLNEED, which discards the user’s hint. That’s wrong.
> > 
> >    I like the enum approach to distinguish:
> >      -  *_DONTNEED: all VMAs are DONTNEED
> >      - *_WILLNEED: at least one VMA is WILLNEED
> >      - *_NO_VMAS: no VMAs present
> > 
> > With that, xe_bo_recompute_purgeable_state() can avoid changing state
> > on 
> > NO_VMAS and preserve "once purged, always purged," matching i915 
> > semantics. This also addresses Thomas's earlier question about new 
> > VMA/CPU access to purgeable BOs—the enum makes it clear we only 
> > transition on explicit VMA state, not on absence of VMAs.
> > 
> > I'll rework xe_bo_all_vmas_dontneed() to return the enum and update
> > the 
> > recompute path accordingly.
> > 
> > 
> > @Thomas,
> > 
> > Does this direction look good to you? If yes, I will send updated
> > patch.
> 
> Yes, but I'm also as mentioned concerned about whether we can add new
> vmas, cpu faults and exports in the WONTNEED state. If we can do that,
> it might succeed most of the time making a well-behave appearance in
> user-space, but if on occation the bo gets purged, the app would
> seeming unexpectedly fail.
> 
> So do we block new vmas cpu-faults and exports in the WONTNEED state?
> 

I’ve thought about the same thing. The new vmas semantics are a bit odd,
because if you unbind the BO in WONTNEED and disallow creating new VMAs,
the BO can never be used again—madvise requires a VMA to operate thus
you can't move a BO out of WONTNEED. Maybe that’s acceptable or even
desirable, but it would need to be documented, and ultimately we’d need
a UMD ack for those semantics.

CPU faults or exports in WONTNEED also seem like they should be
disallowed with less odd sematics, but again, this should be documented
and require UMD ack.

Matt

> /Thomas
> 
> 
> > 
> > Thanks,
> > Arvind
> > 
> > 
> > > 
> > > Matt
> > > 
> > > > Thanks,
> > > > Arvind
> > > > > Thanks,
> > > > > Thomas
> > > > > 
> > > > > 
> > > > > 
> > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > > > > Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> > > > > > ---
> > > > > >    drivers/gpu/drm/xe/xe_svm.c        |  1 +
> > > > > >    drivers/gpu/drm/xe/xe_vm.c         |  9 ++-
> > > > > >    drivers/gpu/drm/xe/xe_vm_madvise.c | 98
> > > > > > ++++++++++++++++++++++++++++--
> > > > > >    drivers/gpu/drm/xe/xe_vm_madvise.h |  3 +
> > > > > >    drivers/gpu/drm/xe/xe_vm_types.h   | 11 ++++
> > > > > >    5 files changed, 116 insertions(+), 6 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > > > > > b/drivers/gpu/drm/xe/xe_svm.c
> > > > > > index cda3bf7e2418..329c77aa5c20 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > > > > @@ -318,6 +318,7 @@ static void
> > > > > > xe_vma_set_default_attributes(struct
> > > > > > xe_vma *vma)
> > > > > >    		.preferred_loc.migration_policy =
> > > > > > DRM_XE_MIGRATE_ALL_PAGES,
> > > > > >    		.pat_index = vma->attr.default_pat_index,
> > > > > >    		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
> > > > > > +		.purgeable_state =
> > > > > > XE_MADV_PURGEABLE_WILLNEED,
> > > > > >    	};
> > > > > >    	xe_vma_mem_attr_copy(&vma->attr, &default_attr);
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > > > > b/drivers/gpu/drm/xe/xe_vm.c
> > > > > > index 71cf3ce6c62b..e84b9e7cb5eb 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > > > @@ -39,6 +39,7 @@
> > > > > >    #include "xe_tile.h"
> > > > > >    #include "xe_tlb_inval.h"
> > > > > >    #include "xe_trace_bo.h"
> > > > > > +#include "xe_vm_madvise.h"
> > > > > >    #include "xe_wa.h"
> > > > > >    static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
> > > > > > @@ -1085,6 +1086,7 @@ static struct xe_vma
> > > > > > *xe_vma_create(struct
> > > > > > xe_vm *vm,
> > > > > >    static void xe_vma_destroy_late(struct xe_vma *vma)
> > > > > >    {
> > > > > >    	struct xe_vm *vm = xe_vma_vm(vma);
> > > > > > +	struct xe_bo *bo = xe_vma_bo(vma);
> > > > > >    	if (vma->ufence) {
> > > > > >    		xe_sync_ufence_put(vma->ufence);
> > > > > > @@ -1099,7 +1101,7 @@ static void xe_vma_destroy_late(struct
> > > > > > xe_vma
> > > > > > *vma)
> > > > > >    	} else if (xe_vma_is_null(vma) ||
> > > > > > xe_vma_is_cpu_addr_mirror(vma)) {
> > > > > >    		xe_vm_put(vm);
> > > > > >    	} else {
> > > > > > -		xe_bo_put(xe_vma_bo(vma));
> > > > > > +		xe_bo_put(bo);
> > > > > >    	}
> > > > > >    	xe_vma_free(vma);
> > > > > > @@ -1125,6 +1127,7 @@ static void vma_destroy_cb(struct
> > > > > > dma_fence
> > > > > > *fence,
> > > > > >    static void xe_vma_destroy(struct xe_vma *vma, struct
> > > > > > dma_fence
> > > > > > *fence)
> > > > > >    {
> > > > > >    	struct xe_vm *vm = xe_vma_vm(vma);
> > > > > > +	struct xe_bo *bo = xe_vma_bo(vma);
> > > > > >    	lockdep_assert_held_write(&vm->lock);
> > > > > >    	xe_assert(vm->xe, list_empty(&vma-
> > > > > > >combined_links.destroy));
> > > > > > @@ -1133,9 +1136,10 @@ static void xe_vma_destroy(struct
> > > > > > xe_vma *vma,
> > > > > > struct dma_fence *fence)
> > > > > >    		xe_assert(vm->xe, vma->gpuva.flags &
> > > > > > XE_VMA_DESTROYED);
> > > > > >    		xe_userptr_destroy(to_userptr_vma(vma));
> > > > > >    	} else if (!xe_vma_is_null(vma) &&
> > > > > > !xe_vma_is_cpu_addr_mirror(vma)) {
> > > > > > -		xe_bo_assert_held(xe_vma_bo(vma));
> > > > > > +		xe_bo_assert_held(bo);
> > > > > >    		drm_gpuva_unlink(&vma->gpuva);
> > > > > > +		xe_bo_recompute_purgeable_state(bo);
> > > > > >    	}
> > > > > >    	xe_vm_assert_held(vm);
> > > > > > @@ -2681,6 +2685,7 @@ static int
> > > > > > vm_bind_ioctl_ops_parse(struct xe_vm
> > > > > > *vm, struct drm_gpuva_ops *ops,
> > > > > >    				.atomic_access =
> > > > > > DRM_XE_ATOMIC_UNDEFINED,
> > > > > >    				.default_pat_index = op-
> > > > > > > map.pat_index,
> > > > > >    				.pat_index = op-
> > > > > > >map.pat_index,
> > > > > > +				.purgeable_state =
> > > > > > XE_MADV_PURGEABLE_WILLNEED,
> > > > > >    			};
> > > > > >    			flags |= op->map.vma_flags &
> > > > > > XE_VMA_CREATE_MASK;
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > > > b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > > > index d9cfba7bfe0b..c184426546a2 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > > > @@ -12,6 +12,7 @@
> > > > > >    #include "xe_pat.h"
> > > > > >    #include "xe_pt.h"
> > > > > >    #include "xe_svm.h"
> > > > > > +#include "xe_vm.h"
> > > > > >    struct xe_vmas_in_madvise_range {
> > > > > >    	u64 addr;
> > > > > > @@ -183,6 +184,89 @@ static void madvise_pat_index(struct
> > > > > > xe_device
> > > > > > *xe, struct xe_vm *vm,
> > > > > >    	}
> > > > > >    }
> > > > > > +/**
> > > > > > + * xe_bo_all_vmas_dontneed() - Check if all VMAs of a BO are
> > > > > > marked
> > > > > > DONTNEED
> > > > > > + * @bo: Buffer object
> > > > > > + *
> > > > > > + * Check all VMAs across all VMs to determine if BO can be
> > > > > > purged.
> > > > > > + * Shared BOs require unanimous DONTNEED state from all
> > > > > > mappings.
> > > > > > + *
> > > > > > + * Caller must hold BO dma-resv lock.
> > > > > > + *
> > > > > > + * Return: true if all VMAs are DONTNEED, false otherwise
> > > > > > + */
> > > > > > +static bool xe_bo_all_vmas_dontneed(struct xe_bo *bo)
> > > > > > +{
> > > > > > +	struct drm_gpuvm_bo *vm_bo;
> > > > > > +	struct drm_gpuva *gpuva;
> > > > > > +	struct drm_gem_object *obj = &bo->ttm.base;
> > > > > > +	bool has_vmas = false;
> > > > > > +
> > > > > > +	xe_bo_assert_held(bo);
> > > > > > +
> > > > > > +	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
> > > > > > +		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
> > > > > > +			struct xe_vma *vma =
> > > > > > gpuva_to_vma(gpuva);
> > > > > > +
> > > > > > +			has_vmas = true;
> > > > > > +
> > > > > > +			/* Any non-DONTNEED VMA prevents
> > > > > > purging */
> > > > > > +			if (vma->attr.purgeable_state !=
> > > > > > XE_MADV_PURGEABLE_DONTNEED)
> > > > > > +				return false;
> > > > > > +		}
> > > > > > +	}
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * No VMAs => no mapping-level DONTNEED hint.
> > > > > > +	 * Default to WILLNEED to avoid making BOs purgeable
> > > > > > without
> > > > > > +	 * explicit user intent.
> > > > > > +	 */
> > > > > > +	if (!has_vmas)
> > > > > > +		return false;
> > > > > > +
> > > > > > +	return true;
> > > > > > +}
> > > > > > +
> > > > > > +/**
> > > > > > + * xe_bo_recompute_purgeable_state() - Recompute BO
> > > > > > purgeable state
> > > > > > from VMAs
> > > > > > + * @bo: Buffer object
> > > > > > + *
> > > > > > + * Walk all VMAs to determine if BO should be purgeable or
> > > > > > not.
> > > > > > + * Shared BOs require unanimous DONTNEED state from all
> > > > > > mappings.
> > > > > > + *
> > > > > > + * Locking: Caller must hold BO dma-resv lock. When
> > > > > > iterating GPUVM
> > > > > > lists,
> > > > > > + * VM lock must also be held (write) to prevent concurrent
> > > > > > VMA
> > > > > > modifications.
> > > > > > + * This is satisfied at both call sites:
> > > > > > + * - xe_vma_destroy(): holds vm->lock write
> > > > > > + * - madvise_purgeable(): holds vm->lock write (from madvise
> > > > > > ioctl
> > > > > > path)
> > > > > > + *
> > > > > > + * Return: nothing
> > > > > > + */
> > > > > > +void xe_bo_recompute_purgeable_state(struct xe_bo *bo)
> > > > > > +{
> > > > > > +	if (!bo)
> > > > > > +		return;
> > > > > > +
> > > > > > +	xe_bo_assert_held(bo);
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * Once purged, always purged. Cannot transition
> > > > > > back to
> > > > > > WILLNEED.
> > > > > > +	 * This matches i915 semantics where purged BOs are
> > > > > > permanently invalid.
> > > > > > +	 */
> > > > > > +	if (bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED)
> > > > > > +		return;
> > > > > > +
> > > > > > +	if (xe_bo_all_vmas_dontneed(bo)) {
> > > > > > +		/* All VMAs are DONTNEED - mark BO purgeable
> > > > > > */
> > > > > > +		if (bo->madv_purgeable !=
> > > > > > XE_MADV_PURGEABLE_DONTNEED)
> > > > > > +			xe_bo_set_purgeable_state(bo,
> > > > > > XE_MADV_PURGEABLE_DONTNEED);
> > > > > > +	} else {
> > > > > > +		/* At least one VMA is WILLNEED - BO must
> > > > > > not be
> > > > > > purgeable */
> > > > > > +		if (bo->madv_purgeable !=
> > > > > > XE_MADV_PURGEABLE_WILLNEED)
> > > > > > +			xe_bo_set_purgeable_state(bo,
> > > > > > XE_MADV_PURGEABLE_WILLNEED);
> > > > > > +	}
> > > > > > +}
> > > > > > +
> > > > > >    /**
> > > > > >     * madvise_purgeable - Handle purgeable buffer object
> > > > > > advice
> > > > > >     * @xe: XE device
> > > > > > @@ -231,14 +315,20 @@ static void __maybe_unused
> > > > > > madvise_purgeable(struct xe_device *xe,
> > > > > >    		switch (op->purge_state_val.val) {
> > > > > >    		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
> > > > > > -			xe_bo_set_purgeable_state(bo,
> > > > > > XE_MADV_PURGEABLE_WILLNEED);
> > > > > > +			vmas[i]->attr.purgeable_state =
> > > > > > XE_MADV_PURGEABLE_WILLNEED;
> > > > > > +
> > > > > > +			/* Update BO purgeable state */
> > > > > > +			xe_bo_recompute_purgeable_state(bo);
> > > > > >    			break;
> > > > > >    		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
> > > > > > -			xe_bo_set_purgeable_state(bo,
> > > > > > XE_MADV_PURGEABLE_DONTNEED);
> > > > > > +			vmas[i]->attr.purgeable_state =
> > > > > > XE_MADV_PURGEABLE_DONTNEED;
> > > > > > +
> > > > > > +			/* Update BO purgeable state */
> > > > > > +			xe_bo_recompute_purgeable_state(bo);
> > > > > >    			break;
> > > > > >    		default:
> > > > > > -			drm_warn(&vm->xe->drm, "Invalid
> > > > > > madvice
> > > > > > value = %d\n",
> > > > > > -				 op->purge_state_val.val);
> > > > > > +			/* Should never hit - values
> > > > > > validated in
> > > > > > madvise_args_are_sane() */
> > > > > > +			xe_assert(vm->xe, 0);
> > > > > >    			return;
> > > > > >    		}
> > > > > >    	}
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h
> > > > > > b/drivers/gpu/drm/xe/xe_vm_madvise.h
> > > > > > index b0e1fc445f23..39acd2689ca0 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_vm_madvise.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
> > > > > > @@ -8,8 +8,11 @@
> > > > > >    struct drm_device;
> > > > > >    struct drm_file;
> > > > > > +struct xe_bo;
> > > > > >    int xe_vm_madvise_ioctl(struct drm_device *dev, void
> > > > > > *data,
> > > > > >    			struct drm_file *file);
> > > > > > +void xe_bo_recompute_purgeable_state(struct xe_bo *bo);
> > > > > > +
> > > > > >    #endif
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > > index 43203e90ee3e..fd563039e8f4 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > > @@ -94,6 +94,17 @@ struct xe_vma_mem_attr {
> > > > > >    	 * same as default_pat_index unless overwritten by
> > > > > > madvise.
> > > > > >    	 */
> > > > > >    	u16 pat_index;
> > > > > > +
> > > > > > +	/**
> > > > > > +	 * @purgeable_state: Purgeable hint for this VMA
> > > > > > mapping
> > > > > > +	 *
> > > > > > +	 * Per-VMA purgeable state from madvise. Valid
> > > > > > states are
> > > > > > WILLNEED (0)
> > > > > > +	 * or DONTNEED (1). Shared BOs require all VMAs to
> > > > > > be
> > > > > > DONTNEED before
> > > > > > +	 * the BO can be purged. PURGED state exists only at
> > > > > > BO
> > > > > > level.
> > > > > > +	 *
> > > > > > +	 * Protected by BO dma-resv lock. Set via
> > > > > > DRM_IOCTL_XE_MADVISE.
> > > > > > +	 */
> > > > > > +	u32 purgeable_state;
> > > > > >    };
> > > > > >    struct xe_vma {
