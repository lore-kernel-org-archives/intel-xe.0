Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18979104891E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 22:17:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B513A10EC4B;
	Fri, 27 Feb 2026 22:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cBf9DHK8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8BB10EC4B
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 22:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772230630; x=1803766630;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GmI5Vr0j/r8/xG7EGwm6n+ie6Vouxm3Z8o5CV8ELjL4=;
 b=cBf9DHK8bGMgkp2ecaZvMl/ZtPRjkIJxM6f2lNR43dokxyUsvmRb6xgl
 +XSKGlFtjpfaRf6adCdGVjpfNgefpftUJD1+xP+/t71TF7/LLvYsd/q2d
 ACE6mVfv0lcXxFhUoSNA22EfGonXiutAKBQ4gURma4vRq2NDOqnRjNCBq
 gg7QKclKb8IdVziN0+vIW41ZNMlN6141EChtqrnrIckfjOUV4vEi7PADn
 vu3uVsQssEIyY3K7gefKzEUjHJB6ClRjT6vd7DJenP1C96egpJavKolHR
 SqCx+vTCHUMliAV+09EeDpvUgOM+xlFx60J1wAriZ6530cFObjVbxTntI A==;
X-CSE-ConnectionGUID: LLkKaU2yRm+yI4eqP4ntrw==
X-CSE-MsgGUID: Crm9oagzQPeK9an5kFFvEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="98790818"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="98790818"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 14:17:10 -0800
X-CSE-ConnectionGUID: lMPMDiXDSfmz4FvGVk1ENQ==
X-CSE-MsgGUID: vKWKXr4pRImyh5YS9vrWtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="221527852"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 14:17:10 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 14:17:09 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 14:17:09 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.28) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 14:17:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C1YxFixG5qj4vanIvPMnzAv/9UZbUdUHNGeE77OsgEFivcwvJHNtT67m7V+1JLC2fIAkx5xOvAjcJhpyo/pSK17+ZpUKnGx5nRYBaYmnbxEJtz3Dnrj+EyWnekpC8HabAEnWLfiPjzsMQqKmLpVxB6oSORPHzR3aoJjtpzJHGIPqi8CTRNyS7Xyt5c6YFXAVsbiRzmx6H6rkKJshlHZfngFvP6oSpZd3bn1Ji8Y3rodmbfSGRi/l/M6KV3+7Cl78s3W3FP1Ju1cvyxeuUZqslpVnANqoU6L7lcoEnRnyQ33ThhSAcfhl6xkoTtcrbPS8o57Wu/qAuxEfeQJ47lYhxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UaNcfc8hs3clu9swPdcvD1CXXcQfKBm7s9FAWMAq/s4=;
 b=dgEpb3q+dUuTdDHauLwSJwy4XDpLlAZIEomA/4Q3kb9t07CW80+9ZZtL1oI+qOulJZrMgw1QWyeFkJXQGtjRUFEPCGB/1Ip0Ny6pRm37FM9rhxvUMDEuOIuOtePP5c3YFexYPngLDwgKQkjNcAjNHd7Jw6httfrRfJ6kCJqEKL9UCZw73kRFXp8+uwxl/q3KaZ9Gzc2t7sdB4tseEM9zh5jDwyXGPOEfsVpix4U0HaRtU7fSTXa8ZlRC5fZeNGhENcXsZ2z2E31xrQgCP/0tVYn7SE33yvTj6qtWdVt/Um1FDsjJUhz+CzI5t6kUBkZWnEkK/sRHVyX6MT3P6p50cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA2PR11MB4939.namprd11.prod.outlook.com (2603:10b6:806:115::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 22:17:06 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 22:17:06 +0000
Date: Fri, 27 Feb 2026 14:17:03 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [v2] drm/xe: Allow per queue programming of
 COMMON_SLICE_CHICKEN3 bit13
Message-ID: <20260227221703.GR52346@mdroper-desk1.amr.corp.intel.com>
References: <20260217083436.1101287-1-lionel.g.landwerlin@intel.com>
 <20260217235140.GT4694@mdroper-desk1.amr.corp.intel.com>
 <5be3aeea-9822-49bc-a9f8-e28c64a1db80@intel.com>
 <20260227221231.GQ52346@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260227221231.GQ52346@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR11CA0069.namprd11.prod.outlook.com
 (2603:10b6:a03:80::46) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA2PR11MB4939:EE_
X-MS-Office365-Filtering-Correlation-Id: bb26c10e-aa29-472a-b813-08de764df0e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: AWXN30yDih13jBEeuA9CMjanCyXoSqDuh+0IJXGHr9XExufygnRYBQN5Bf8k68meYcJ5Alqlhxutf6S0vBrBIgdldKa1perHxZ79wGd38OzKasfQ++W+TmgOXOyeoT3Hp7Se0R2W2eEONwhVuXhVUy428qumX2a/H06+2jExCJTewSIYN1Q1o4nBwBI2mX8Pn+uq/H79Bd+jyDJ76ESmTiuS72OV+1RpQ5pd+eOLRyKV8O0vlYlrHDFaASFbe5zdKS7JDSi+KqTJsFn99QHjUWdabDrghsnNBGri1119xC4/zYFRHoW8yhlo7uT5++dRCmEoTpyKgLVsvZwsmvOLKUKXwFONlPsN4AJ0F4TrlWgz4gG8nDXQe5u1hvoy4UNUFPpanrv5E5CHoY+pNKAv8UkLbBUpmS9JD1Qq5zUqHF48ksmVQT/TmAnJNR/A0VDsj3dsd+80+62weXe+v2doA4qHYLPAxWYzbIhEVNI8Iz+0IAd9UTOI7s9egcoUrqBGmbJMDcxNtIj1IB1du2jHmjNftEAxehGYnyeI1MhRIeJ2zmCWzMlXQRFK8gLYNWn4pIzWyRO2+6CO2aB54LDMX7IACKZCkmeEOiKnRERS8JkG4heBC7zHZX48R5wn6ZJc57Soerip9W4ZYmUtW/a1X/N3v4ztPzD6Aznk4ic5drBrWkWQtg0SYOUrYMpNW3VZjQrbO4ZJ541Xnq4aYjFRuPW1hCqYuhjOx9BkFv0eGJA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUl1RTB1czYwM3BGbTcvNkwwMkVZQWdXY2tteS9hRjlwdzhUai9qbDNSRUF0?=
 =?utf-8?B?c29lL1FxNWpwSlhGa0g4eFlnQlMzQmM5OEY0bSsybmNpcEs2ZGFMMDhhdTlj?=
 =?utf-8?B?Smdua25nNHVXQ3BSUmNHdTIyekZuU3dlTmhCK1EvcFVndStJV0xFTTZleHJW?=
 =?utf-8?B?dDI4SURkbmpaQzhKc0syVmtHTXZKcHJUckJ0dW0wbXhxQWp0bDlTendNNzBx?=
 =?utf-8?B?azEvdU9PYlpCMm1MbzU0a1B1VVJvVFRSRWJoeUFIdUtNNFl3YjB0NHVtS1By?=
 =?utf-8?B?QXV2U29iaDFZVmxtc3dzajEzWTV1N3h0L3lDcmhaZGtzODRDYmJBWjltZ0ZJ?=
 =?utf-8?B?OEFTeFVFbDdnVGVGb1ZUVmxnWHNmMk91bE1BYldhUkkxNFJlOU85NGk5RnhB?=
 =?utf-8?B?M0RhcTE1SklibnBMN2E5aWZub0hUVlFSWWNuS2g1a2hJT1ZmT2swWkhsaVlM?=
 =?utf-8?B?RXpsN0IycFJVTzNielcrcEx3Y2FKeU5lMUxHZGl3TEdCcnBsZFJTWmtGNllS?=
 =?utf-8?B?YkpheXBkL1UycmcvdkVaY1VGVDR2anltdXk3dTg2c09valdiek83YTRqLzU1?=
 =?utf-8?B?eEtxRTQrWXhJWm9qWkx4TGY4SlMrUENuKzlaS05WMmRSUnhLUW9qMFdLQzhM?=
 =?utf-8?B?QzFNeGp3Y0p3T24rSkNQYXpSa0E4UEJKZVJqVGlxakpHMVdEVGlqcWVzUzUr?=
 =?utf-8?B?Q1JDU0hHS3FZcVpEWjM0dWFzdytnR21FNlNVWG8xaTVLWWRCdWxBWnV3QnVm?=
 =?utf-8?B?ekVBR3F5SytCTlpSSzJ5VG9hZi9ta0lQUjM5TDZqYVlwa2xuZ3hXQTVKdS9Y?=
 =?utf-8?B?d2hBbHRpcDlCQjlhUXgrR0Q1eEkzL1Y3WlZBM0NlMWNSWkxtR09JTStOQmcv?=
 =?utf-8?B?c3ZrTmdidUlYQzFPazdoNjg5ejVqSEpXbDZ6NmwzY0VSc3JWUG1tZnRNb2pU?=
 =?utf-8?B?TW9LKzVaWnhzVUt1UFJUV1g5bFFMOHlqYjlsNXNPeVVYY09EUVFvaFMwNlVw?=
 =?utf-8?B?dXF3V2ptMml6M1RNSkg2SExQeUNLL000Zm8xUXllUFYvcVYzT1d4ZGpPYWdo?=
 =?utf-8?B?Y2ZiOVJwK0ZiSktTSENlTlpwSEZuM05XQ05MWkFOMHRpL2F2VkJSQjN6aUtN?=
 =?utf-8?B?N1FWOGIxbGR2NUlIcVRsajRUb2VJQllnL0NMM0VXUWxtbDBPSldKWnM0MWpy?=
 =?utf-8?B?bTRRODRHblRBbDdjOVBVZ2xUR2s0djhjc3BTcHIrZE5GTy85aVordGVvbzhL?=
 =?utf-8?B?RXVOc0s4cVVoNXpTcnNBTlJxNzg0YWRNbFZrMThWYzR3ZWMva0tNdDBPZ2Vt?=
 =?utf-8?B?ZjJYSnFDcjBEaWpQYTlFSGJhdVJINW1RM3BFNHlZNEt5U1R1MGlIeUNmOC94?=
 =?utf-8?B?YXl4aG9VTDY0THFXR0grT09yVGtwcDByZHExMXovNGtYb0ZzTS9rT2d3eUFl?=
 =?utf-8?B?V01aSmUvMnp4bzdSWUFiT3diTkwzNEhpUUp0d1BtTWEydDllYldRY3F2WGFY?=
 =?utf-8?B?RisrclNWUmNkQUpJbm44bXFMZTVRN3hQWjhxTzEyZ3ptb0c2VzlRbDU4cTdS?=
 =?utf-8?B?ODF2YTNTNVZEUVBtN2EzNmpwcngzRlB5SXFUUlk1ZC9pTmRsbW9HSmN2c2JW?=
 =?utf-8?B?K0szWndVeWdINjNiNWxReERHVWJqOFA2U3crN3Jlall6VGdlSXJJTGNmZVZL?=
 =?utf-8?B?NWZNZWRaSXl2MTJFbHpVa0xsWkJrcXBoK1B4dHZCOUtaQnZOandBNjdXaEI3?=
 =?utf-8?B?YlJ5NUZFVVUvUmJNTkhoRkxUR1lOMysrUEhpVTNWTDFvQWR5QTFha3FNbzhr?=
 =?utf-8?B?Q0F2WVpiR3JvZm1oUXNpZW8xUms4emQ4N2EvcXUxREkrREdpbVJPMm5xdFpF?=
 =?utf-8?B?STlaZlk2a2pEQklLWGU4SDR3YnRWZWRabVZzSmFoa2R2UWN1WERkN0NrdFps?=
 =?utf-8?B?bm5XemdtdmFhdGo5ZTkzbXhrT3lBUlYvMVYybzdXYUZjTklIZVJqZGxoUXZ3?=
 =?utf-8?B?ZlFTR1hzcWR1R09PdVlwQmlLOFl2Y1NKS25YUEE4U1lxMEk3RHZ0UTRjV1h4?=
 =?utf-8?B?cXBTY3ZOUUhCWm9zRjhoeEFtUkFzM1BIR2RMZ1BMUXJZbXorNk9Yc01UMnhi?=
 =?utf-8?B?djBBeTU1VU1HVStQTmpqUFNmeDBRc3NPTDhadytBVzNDNHd5eWZEQWFlSU1Q?=
 =?utf-8?B?R3RkK3dmTlJ3M3o3d096bEMzNUdCRzVnczJHRVBQKytmdlYvbDlhdnlSUHgx?=
 =?utf-8?B?aFFMcmM0bFdWSXBTQmJrMEtBbEY1QmkyVlJhd2l4dkNiT2hBYzF0LzJaWjE5?=
 =?utf-8?B?TlB5WkpmUFFYMTRweUZNTDk3UUluRG9uYTVMRDZLOG1BZ2F2ZDh0TWJrT1My?=
 =?utf-8?Q?Kp0uwcZYiEyiDCPc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb26c10e-aa29-472a-b813-08de764df0e9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 22:17:06.2216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQbDJWtJWtSlwA13Ua6L0nJea4YiXhRqHlOEDnPlS0fAEay+sRAKihN9EJPqOAdu6dg8juJ9S4PoesFVIvSqTJEfeygVh6PifWDT6ePJJDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4939
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

On Fri, Feb 27, 2026 at 02:12:34PM -0800, Matt Roper wrote:
> On Fri, Feb 27, 2026 at 10:42:41AM +0200, Lionel Landwerlin wrote:
> > On 18/02/2026 01:51, Matt Roper wrote:
> > > On Tue, Feb 17, 2026 at 10:34:28AM +0200, Lionel Landwerlin wrote:
> > > > Similar to i915's commit cebc13de7e704b1355bea208a9f9cdb042c74588
> > > > ("drm/i915: Whitelist COMMON_SLICE_CHICKEN3 for UMD access"), except
> > > > people have decided to not rely on putting the register on the
> > > > allowlist for UMD to program and instead have context/queue creation
> > > > flag.
> > > > 
> > > > This is a recommended tuning setting for both gen12 and Xe_HP
> > > > platforms.
> > > > 
> > > > If a render queue is created with
> > > > DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX, COMMON_SLICE_CHICKEN3 will
> > > > be programmed at initialization to enable the render color cache to
> > > > key with BTP+BTI (binding table pool + binding table entry) instead of
> > > > just BTI (binding table entry). This enables the UMD to avoid emitting
> > > > render-target-cache-flush + stall-at-pixel-scoreboard every time a
> > > > binding table entry pointing to a render target is changed.
> > > > 
> > > > Bspec: 73993, 73994, 72161, 31870, 68331
> > > > Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  1 +
> > > >   drivers/gpu/drm/xe/xe_exec_queue.c       | 18 +++++++++++++++++-
> > > >   drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
> > > >   drivers/gpu/drm/xe/xe_lrc.c              |  9 +++++++++
> > > >   drivers/gpu/drm/xe/xe_lrc.h              |  1 +
> > > >   drivers/gpu/drm/xe/xe_query.c            |  2 ++
> > > >   include/uapi/drm/xe_drm.h                |  8 ++++++++
> > > >   7 files changed, 40 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > > index a375ffd666ba2..80a438e51419f 100644
> > > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > > @@ -178,6 +178,7 @@
> > > >   #define COMMON_SLICE_CHICKEN3				XE_REG(0x7304, XE_REG_OPTION_MASKED)
> > > >   #define XEHP_COMMON_SLICE_CHICKEN3			XE_REG_MCR(0x7304, XE_REG_OPTION_MASKED)
> > > > +#define   STATE_CACHE_PERF_FIX_DISABLED			REG_BIT(13)
> > > >   #define   DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN	REG_BIT(12)
> > > >   #define   XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE		REG_BIT(12)
> > > >   #define   BLEND_EMB_FIX_DISABLE_IN_RCC			REG_BIT(11)
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > index 66d0e10ee2c4a..d3168353fcaaf 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > @@ -292,6 +292,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
> > > >   	if (!(exec_queue_flags & EXEC_QUEUE_FLAG_KERNEL))
> > > >   		flags |= XE_LRC_CREATE_USER_CTX;
> > > > +	if (q->flags & EXEC_QUEUE_FLAG_STATE_CACHE_PERF_FIX)
> > > > +		flags |= XE_LRC_STATE_CACHE_PERF_FIX;
> > > > +
> > > >   	err = q->ops->init(q);
> > > >   	if (err)
> > > >   		return err;
> > > > @@ -850,6 +853,17 @@ static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_e
> > > >   	return q->ops->set_multi_queue_priority(q, value);
> > > >   }
> > > > +static int exec_queue_set_state_cache_perf_fix(struct xe_device *xe, struct xe_exec_queue *q,
> > > > +					       u64 value)
> > > > +{
> > > > +	if (XE_IOCTL_DBG(xe, q->class != XE_ENGINE_CLASS_RENDER))
> > > > +		return -EOPNOTSUPP;
> > > > +
> > > > +	q->flags |= value != 0 ? EXEC_QUEUE_FLAG_STATE_CACHE_PERF_FIX : 0;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > >   typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
> > > >   					     struct xe_exec_queue *q,
> > > >   					     u64 value);
> > > > @@ -862,6 +876,7 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
> > > >   	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
> > > >   	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY] =
> > > >   							exec_queue_set_multi_queue_priority,
> > > > +	[DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX] = exec_queue_set_state_cache_perf_fix,
> > > >   };
> > > >   int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
> > > > @@ -946,7 +961,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
> > > >   			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
> > > >   			 ext.property != DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE &&
> > > >   			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP &&
> > > > -			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
> > > > +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY &&
> > > > +			 ext.property != DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX))
> > > >   		return -EINVAL;
> > > >   	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > index 3791fed34ffa5..f4f72d01eb8c8 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > @@ -134,6 +134,8 @@ struct xe_exec_queue {
> > > >   #define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
> > > >   /* for migration (kernel copy, clear, bind) jobs */
> > > >   #define EXEC_QUEUE_FLAG_MIGRATE			BIT(6)
> > > > +/* for programming COMMON_SLICE_CHICKEN2 on first submission */
> > > > +#define EXEC_QUEUE_FLAG_STATE_CACHE_PERF_FIX	BIT(7)
> > > >   	/**
> > > >   	 * @flags: flags for this exec queue, should statically setup aside from ban
> > > > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > > > index 38f648b98868d..a962ac2bb7ca2 100644
> > > > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > > > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > > > @@ -14,6 +14,7 @@
> > > >   #include "instructions/xe_gfxpipe_commands.h"
> > > >   #include "instructions/xe_gfx_state_commands.h"
> > > >   #include "regs/xe_engine_regs.h"
> > > > +#include "regs/xe_gt_regs.h"
> > > >   #include "regs/xe_lrc_layout.h"
> > > >   #include "xe_bb.h"
> > > >   #include "xe_bo.h"
> > > > @@ -1447,6 +1448,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> > > >   	struct xe_device *xe = gt_to_xe(gt);
> > > >   	struct iosys_map map;
> > > >   	u32 arb_enable;
> > > > +	u32 state_cache_perf_fix[3];
> > > >   	u32 bo_flags;
> > > >   	int err;
> > > > @@ -1579,6 +1581,13 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> > > >   	arb_enable = MI_ARB_ON_OFF | MI_ARB_ENABLE;
> > > >   	xe_lrc_write_ring(lrc, &arb_enable, sizeof(arb_enable));
> > > > +	if (init_flags & XE_LRC_STATE_CACHE_PERF_FIX) {
> > > > +		state_cache_perf_fix[0] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
> > > > +		state_cache_perf_fix[1] = COMMON_SLICE_CHICKEN3.addr;
> > > > +		state_cache_perf_fix[2] = _MASKED_BIT_ENABLE(STATE_CACHE_PERF_FIX_DISABLED);
> > > > +		xe_lrc_write_ring(lrc, state_cache_perf_fix, sizeof(state_cache_perf_fix));
> > > > +	}
> > > This will put instructions in the LRC's ring to update the register.  So
> > > when this context starts running, the context switch will load the
> > > default value of COMMON_SLICE_CHICKEN3 from the LRC's main MI_LRI
> > > instruction, then these commands will run to update the value, and
> > > eventually when we context switch away, the modified value will be
> > > written out to the LRC's main MI_LRI instruction so.
> > > 
> > > That should work, but wouldn't it be more straightforward (and more
> > > consistent with our other LRC initialization) to use
> > > xe_lrc_write_ctx_reg() to put the value we want into the LRC even before
> > > it runs for the first time?  That's how we poke several other register
> > > values into the in-memory LRC during init.  There's a
> > > xe_lrc_read_ctx_reg() you can use to get the current value for
> > > read-modify-write purposes (see the handling of the RUNALONE flag for an
> > > example).
> > > 
> > > The only quirk of using xe_lrc_read_ctx_reg() instead of
> > > xe_lrc_write_ring() is that we'll need to add a #define for the dword
> > > offset of COMMON_SLICE_CHICKEN3 within the LRC since we don't have that
> > > defined yet.
> > 
> > 
> > I'm not sure how you make this work.
> > 
> > The current register you place like this from the host, their location in
> > the image is know and doesn't change.
> > 
> > I can't say this is the case for COMMON_SLICE_CHICKEN3.
> 
> You'd find it by looking at bspec 65182, although it's a bit annoying
> since you have to manually count up the values in the "# of DW" column
> to find the proper offset.

Now that I think about it, we could probably do something on the KMD
side to make it easier to find these offsets for people who have access
to the platform in question --- we could add a running offset to
to /sys/kernel/debug/dri/0/gt0/default_lrc_rcs and such.  I'll add that
to my todo list, since it may come in useful in the future.


Matt

> 
> Anyway, it's not a big deal.  We can always switch over later on as a
> follow-up patch if we decide we want to.
> 
> 
> Matt
> 
> > 
> > 
> > -Lionel
> > 
> > 
> > > 
> > > > +
> > > >   	map = __xe_lrc_seqno_map(lrc);
> > > >   	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
> > > > diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> > > > index c307a3fd9ea28..083a2167aeef8 100644
> > > > --- a/drivers/gpu/drm/xe/xe_lrc.h
> > > > +++ b/drivers/gpu/drm/xe/xe_lrc.h
> > > > @@ -49,6 +49,7 @@ struct xe_lrc_snapshot {
> > > >   #define XE_LRC_CREATE_RUNALONE		BIT(0)
> > > >   #define XE_LRC_CREATE_PXP		BIT(1)
> > > >   #define XE_LRC_CREATE_USER_CTX		BIT(2)
> > > > +#define XE_LRC_STATE_CACHE_PERF_FIX	BIT(3)
> > > >   struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
> > > >   			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
> > > > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > > > index 34db266b723fa..5927eaf792efe 100644
> > > > --- a/drivers/gpu/drm/xe/xe_query.c
> > > > +++ b/drivers/gpu/drm/xe/xe_query.c
> > > > @@ -340,6 +340,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
> > > >   			DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT;
> > > >   	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> > > >   			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
> > > > +	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> > > > +		DRM_XE_QUERY_CONFIG_FLAG_HAS_STATE_CACHE_PERF_FIX;
> > > >   	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
> > > >   		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
> > > >   	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
> > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > > index c9e70f78e7238..856838fcadd89 100644
> > > > --- a/include/uapi/drm/xe_drm.h
> > > > +++ b/include/uapi/drm/xe_drm.h
> > > > @@ -406,6 +406,9 @@ struct drm_xe_query_mem_regions {
> > > >    *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT - Flag is set if the
> > > >    *      device supports the userspace hint %DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION.
> > > >    *      This is exposed only on Xe2+.
> > > > + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_STATE_CACHE_PERF_FIX - Flag is set
> > > > + *      if a queue can be creaed with
> > > > + *      %DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX
> > > >    *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
> > > >    *    required by this device, typically SZ_4K or SZ_64K
> > > >    *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
> > > > @@ -425,6 +428,7 @@ struct drm_xe_query_config {
> > > >   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
> > > >   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 2)
> > > >   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT (1 << 3)
> > > > +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_STATE_CACHE_PERF_FIX	(1 << 4)
> > > >   #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
> > > >   #define DRM_XE_QUERY_CONFIG_VA_BITS			3
> > > >   #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> > > > @@ -1279,6 +1283,9 @@ struct drm_xe_vm_bind {
> > > >    *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
> > > >    *    priority within the multi-queue group. Current valid priority values are 0–2
> > > >    *    (default is 1), with higher values indicating higher priority.
> > > > + *  - %DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX - Set the queue to
> > > > + *    enable render color cache keying on BTP+BTI instead of just BTI
> > > > + *    (only valid for render queues).
> > > I'm not sure if this is the best name.  The bspec indicates that
> > > 0x7304[13] effectively *disables* "state cache perf fix" which was only
> > > intended for DX11 scenarios and shouldn't be used elsewhere.  So it
> > > seems like the name here should either mention "disable" or should be a
> > > more descriptive explanation of what actually happens when we set this
> > > flag (e.g., "xxx_USE_BTP_AND_BTI" rather than using the vague "PERF_FIX"
> > > terminology).  The maintainers may have thoughts on what they want to
> > > see.
> > > 
> > > 
> > > Matt
> > > 
> > > >    *
> > > >    * The example below shows how to use @drm_xe_exec_queue_create to create
> > > >    * a simple exec_queue (no parallel submission) of class
> > > > @@ -1323,6 +1330,7 @@ struct drm_xe_exec_queue_create {
> > > >   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		4
> > > >   #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
> > > >   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	5
> > > > +#define   DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX		6
> > > >   	/** @extensions: Pointer to the first extension struct, if any */
> > > >   	__u64 extensions;
> > > > -- 
> > > > 2.43.0
> > > > 
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
