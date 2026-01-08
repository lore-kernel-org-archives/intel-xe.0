Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAD5D1D461
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 14:36:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C5310E754;
	Thu,  8 Jan 2026 14:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pb0rnn0q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E470F10E754
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 14:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767883019; x=1799419019;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lvj81Z8fL+sURpfB9aLYdfTEeptPeJ7t+YvPBUIY+Hs=;
 b=Pb0rnn0q6x2WiNU6hfibecYRo8QW46po8ahN/6OQpsoCji6B7GPlicl6
 UedWFirnzOeKB+9Xx8iSWtMwV4IFeU/YZt0a4b2vD1VAjT3ZjvbRHbxwZ
 lG65kgD9NseCy2sdt6er3eUbqnEtG6hQ1mHULVtLVNdB0+goh4kmsrIc1
 lTiX5FNQLkuKZuYTSmZQwlARO1rjEVNpjjd19iTZv0OuXjtyQZunztTrB
 13pGDNb2gM/5zjZ2019+UsvHvzLxVyW1j8Pp9NkodUgbFCqpwP/Iozfbm
 tbn+HL5hEvWCey+649M8d+NAAPyfik3JMgcnHU28tZWocXVE//hPQUlsH g==;
X-CSE-ConnectionGUID: ownPBL7lTieaHnQ11e26qg==
X-CSE-MsgGUID: YJc3pAM7SVqupg0AKzt15Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="79559975"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="79559975"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 06:36:57 -0800
X-CSE-ConnectionGUID: Eow97lNTQlCXExYbKZM78Q==
X-CSE-MsgGUID: +ia78i/XRvaBQODUMtEvcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="202994874"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 06:36:56 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 06:36:56 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 06:36:56 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.10) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 06:36:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m3oxoIR6/GoIQevjcoArQvRXOe0/AiuNlYms/5A9mVKTu7+Dl0j3k5Lt2yLyPjJzGx/eToF/MWimhYunJOsEIW97fs9qlYeGdbsBgDqcFBamt2d5ra2bar3VWq4NpqVUoGoUPddrJqBy6pnDSbf9tuJZVwhqEn0mxJQ6iAYl0Gq9SDxF2tRr436ZLeBqo7B3mY0TxbCrvwqIOfHkDO8drelbRfo+VKjmMfHHt955RdgFgT5Auqu7lZYC0IuoLTs+HDSDq+TMvJbmoKWJHLiy78MyeNCBUAlRMEs+qvXLCfrHI0adfIRQT2z4dK9uExLw9DZBIofmfaiXp7bZjJNQCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ykKXytyknADUaXaykrMongUthb7ehDT4uzyjMDpCg50=;
 b=Yz2YWyfDAsp7S+2KOPOKOauA/HQaTo5si9l+Wu3Uk2L90+BZLXBU4a1A4VqdWPDlIchT6aiooC65WrTT6CbBi2xQ7cm3JyyMzPbWOKe2s1qhmz5p0YpMYGW9IVZw9hDo9ywOOeI1n5WJVC9xN5+ULT0nioTTo3qJ/O/6/nL1ydRmiiLUj9cuFiNqwXMkFcRT4AMrrcO2re2AAjy2g+q5NXHLvcIFqGdPX/4k7PHdby94HJawVsdsv1Mm7K7Dq9I9z0DDCN0nSfOMfO5OFdOqBvGqi1NLLlhEn/bvCiOKGSBO9F9yPshlFS7+0+YM5wtj9L//hjtClLiLM5HJSoV/Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA3PR11MB8920.namprd11.prod.outlook.com (2603:10b6:208:578::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 14:36:54 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 14:36:54 +0000
Date: Thu, 8 Jan 2026 09:36:51 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Julia Filipchuk
 <julia.filipchuk@intel.com>
Subject: Re: [PATCH 0/3] Enable GSC loading and PXP for PTL
Message-ID: <aV_BA4BlDMgn2IUs@intel.com>
References: <20260108011340.2562349-5-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260108011340.2562349-5-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR13CA0098.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::13) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA3PR11MB8920:EE_
X-MS-Office365-Filtering-Correlation-Id: 426df82c-168c-4c3a-d64d-08de4ec35e5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sl3XNmQrB46Rc6W/h5ipMfJjEsFgcjfbgazZlyX+1RmMHoxg4Pg/v36uOcs5?=
 =?us-ascii?Q?z+YkeD4kUpGC8W64obJVoVNXEJcRxN8sSeIcB1XdT4eFzy3Da/SUljpB288c?=
 =?us-ascii?Q?0gMo2gUEUnaDAgrpxrQ6C8DG0goYNBbtVcJohRsN9/fSn/x3ZQz+ktF9Eu/l?=
 =?us-ascii?Q?/qhBav8Dar/5MKyo2Vz5ZTolvNBoTHT2t+y5ABmoNvSqoAx+q4Y+amDbsErB?=
 =?us-ascii?Q?vHxgeZbQzicfRu7a20mD4syvowJrMxeggH/Qg3H+Nuj6b1p0/wyMH4DEIjSr?=
 =?us-ascii?Q?IggC+Cv8Q+F00k96mgdby6vpYIGcTgxuNnfw0HqaboaW0DaLAPV50UvUROeH?=
 =?us-ascii?Q?+LcfqEO/rF1/J99/frAE5avQNPsdGzriWyWafF1FPWjWIKRKK69JK1Di1WY2?=
 =?us-ascii?Q?sZNFtnJ+AK4RVrdbqheV/1rTH8Uq0ajoAI058MsumwTx/+Lca9Y2i1P1AXGJ?=
 =?us-ascii?Q?vgXcrZwiBvgVGiHeQaDoStWUJinFHK05R6CFAxYOPXnL9xlvXFvEfmDe7w/K?=
 =?us-ascii?Q?5hTZM6PR/E9d62uGb3lfmv8EptSiJpv2AhNVTcUXSzhU80DhnYUGUm7koIl1?=
 =?us-ascii?Q?eP9dhXVmS/8OLtzmaJyjiuClBKPOHbaZ1dsLf5MiHq9vNItts8yPakWQJZdG?=
 =?us-ascii?Q?iz5+/gUrzgMhL8le3+GwYFII268sTbuCeLHoOnPyTslcCyS/ClBlu+s5wlNe?=
 =?us-ascii?Q?9oUwPw5y2TQ6KP2OiLGkB6T10jm1kUnhxZgU2P1RAAy1ZdODNTER/Yb410WQ?=
 =?us-ascii?Q?S3ZJNQNcL3Qk4cGvChtIh9BxUI3aCZK9x21itD3vXbND2M6IP5jF/WmnD6W0?=
 =?us-ascii?Q?1/EsL7YzXSVfMdzOwBiQWW1bxvk5ZMPPHKThghBvSPt01m6Df6Wx+MIXqHsP?=
 =?us-ascii?Q?vguYamfu5wAmDe3tStQi61eOFJjEoIVvs4nNgRcqP7T2UdiYxvDrzgZSVftD?=
 =?us-ascii?Q?If0/dV5I7nOxeA+hhh8X0Z8cGun/1mBPs6DQHSlZvrDKEiIfW5A7Z6SMubul?=
 =?us-ascii?Q?hCdeIuCWVAP45asnt3VMCryBQRmKks826fX4f5XSX4zCTQm19sNs6v5T3S9Q?=
 =?us-ascii?Q?Z2WE6SYfPS6//8UClLWaWFhjNcwJ2li/u7/SIOJcOPdyzK/vqNfFBDN5mpBE?=
 =?us-ascii?Q?2W3CJLKt0L2qZyrrHoMjIKWt7p449UM1+3aUxDNUfO60eAkqPKgLog7RG5mj?=
 =?us-ascii?Q?4gMFregCdxsfW9o1zDVoEFiBhg2VSvxb0OrBUqfiF9aZFx+XTvZZfdnoEOT8?=
 =?us-ascii?Q?rvT4yHrfDRlwWsMUe5bDxz8CkbmrJjjfOrFYPOUBsNxa+UHxn59NCDzWRueA?=
 =?us-ascii?Q?tKVnAK4+ZDHCXV9x+lNGl+lY9vfAKFutkGuTlCYWig/PTL3icMiEb/9yTzwm?=
 =?us-ascii?Q?XXAeuaNCVZrW9jCEcedCtK6zTOyxyE6nQJt2QwdCqttZALrSUOPU+rer6uY5?=
 =?us-ascii?Q?fGN9oAc5+BvWUrJNknQ0daZs7vJxkvBr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e8oH5udDw5liImUWiCCzDbK0rcTgDemeG/XQffprhoIxUHisXdSmFflV3klK?=
 =?us-ascii?Q?QE+8g/vC2Y3I2IC/6ljJv+klYdgXUeH7Z/7IfZlK+XHGDzfXxEHscYxeF7yv?=
 =?us-ascii?Q?cKXXp+X7CN1kAHzZqgnJEJsQ8PTp8V5MSO1H/wN3qRbnmXz2sZ/6klEcECxB?=
 =?us-ascii?Q?BIvMtsojCyqlCMlqIiZtnhdEoKQn05RFCG3VMdSxjYx/Lv2UMxYLtbKKf/1f?=
 =?us-ascii?Q?Rk3bvx7kiIaJt/hQIg9hbTy4rEpkgkgiGACC6T1PcXfevpX35LOcV+FyUqwg?=
 =?us-ascii?Q?V3oQHM4kT+w4dnhKLhT+cG0WR2eYe3SZyqxkgVdZNuJNI/F4Fs60b1VJcCPf?=
 =?us-ascii?Q?V94vb2BSx7/gTkbSMUxAwf5reiq+rPwowGsEo7dZpev4TPCw3K/oG41tISo8?=
 =?us-ascii?Q?YWxiJnZQ11g99lcLiLzji0dBdLaLKIIr9k63RixOZjcu1WluSIdXFPAoKonz?=
 =?us-ascii?Q?HopZQOZjKXWgvoy9kR6P0KdGhD8sfdtc/yTji6W4j59lr94FC+I4dEz7z7yh?=
 =?us-ascii?Q?UENv7oQFkKV9fRRDMggmX/gNTz0zJ2dnuWqgXCpxts00zVjn+cUwUYJjktSE?=
 =?us-ascii?Q?qevHClGJgOYxSlKbVBgROlVHsYCpAP+lA8/Q4SteD69v4PZ/iNl4ER8lHfqj?=
 =?us-ascii?Q?BQQxrXy0xnPX6rzg5lbsgfx3s+aTkMH9SEHOt8IkKmlmQTDykSHdfdfXaTUo?=
 =?us-ascii?Q?z65do0V8n6ygxJQiyyvbwtKPWq5YHeIMfJfGS3wncqZOq19J86Vdy/5NOIkA?=
 =?us-ascii?Q?vCjxZtOAsp3gN2VtoVbgfcumpBwFfjqTuDq8cgzrpXyPmdvg7NH0UsytOB9F?=
 =?us-ascii?Q?lq8fdFK0FHLzNnermOGWOeq2J4wfBimBxlRj6RJeKTzPOq9QR0RAfu87IO5g?=
 =?us-ascii?Q?Ql/t/bSYGFtv7FytGaGf3LhiMIGkurQIu82MCvpPEDSn7wUSaL4rQgELwJx+?=
 =?us-ascii?Q?sx19bHDWKi/OyOX9ak0WlQRqEHqvfXxsKEDt56zU1KSHHHWW+vL9O4zG2ZYV?=
 =?us-ascii?Q?a6rKxHt+kcHUK2bYBjjfHn8oKC2BSEWP5nAI/UisMEKbOOl7orlVGbOEcAUZ?=
 =?us-ascii?Q?NuQVIYaN/oLGvBr29rUSXiVEVfZ9JchHPZiegCXRsts8kbByZu76BJYsQNDU?=
 =?us-ascii?Q?Paihs3y5fTfhkJ+J9VLhUWDXSDshpMW1xQ2+eBLgPAwBBLQl7a7xbqDI4QNl?=
 =?us-ascii?Q?LA17kEAMurHaQ6W9wUjv14c7cfC2JCgYWfJQsPSIZrIKMyBE0OBlxJ1hY6Pq?=
 =?us-ascii?Q?LA7fPZ5FLhrZw2OMfHnjGc0tS8rgbkcdu1frLTj4tfr30ULLT9spUrvRzafJ?=
 =?us-ascii?Q?uD2xqrbA+DTlM2yLIThXzw7UYZIAF7pcRbYP6gS5Xvwe+er59ZYJa5m+Red7?=
 =?us-ascii?Q?MyvMRrtaMBt3yP0bVHxvnHjAlMe+H/wYtawFHysWwhkDi0swq+Kuwy39usrJ?=
 =?us-ascii?Q?adiyvt9g+7a1hjcl2UYyXChSHuGUSEVRx/Hnf+/F9PXxJJ2wqGTJKDsV1A+N?=
 =?us-ascii?Q?HkO2tL9RHPQt9o5YnRiq6bZ1Ao0P8LV/Fj5frnDOvZibGQK1KYv1aMFiZVlk?=
 =?us-ascii?Q?WwdcM/dZUHhfsjEg8uVZBuA1Uh4VJONzJ6JAmxbSMY1rHngRXg7cM8W2ECzC?=
 =?us-ascii?Q?fyju3aw1ojeuRTeOE1dN371bKGzWbiuwgmktZbg0Kvbl9pTMs/UoXV7WsxaV?=
 =?us-ascii?Q?M9hqt0rixX/l/qthN7mivD3oP3ny3nYdJWuw3ggM2SOWjY1vpQueisfFxXI+?=
 =?us-ascii?Q?nT1hQxJAmQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 426df82c-168c-4c3a-d64d-08de4ec35e5f
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 14:36:54.4038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: emfk17l0BLyjyiybMWgyjnQW97CbnEJVXY+brsTi3RbhdfCOYp6XLRyL7S6d4ZVxNJC03YhZ05EGI4qebfAvHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8920
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

On Wed, Jan 07, 2026 at 05:13:41PM -0800, Daniele Ceraolo Spurio wrote:
> GSC loading is required for content protection features (PXP, HDCP).
> 
> Since PTL force_probe was removed before we added the FW, the driver
> needs to keep working if the FW is not found. Therefore, the code has
> been modified to allow the GSC FW to be missing for BMG and newer HW
> (older HW platforms require GSC for power management, so on those we
> don't want to continue if the FW is missing).
> 
> Note that I haven't pushed the FW yet. This is on purpose, as I want to
> get CI with the FW missing to test that case. Once the patches have been
> reviewed and tested without the FW, I'll push the FW to intel-staging
> and re-trigger CI to make sure everything works with the FW as well.


Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

on both, the optional approach proposed by the first patch and on
the CI approach you took here.

> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Julia Filipchuk <julia.filipchuk@intel.com>
> 
> Daniele Ceraolo Spurio (3):
>   drm/xe/gsc: Make GSC FW load optional for newer platforms
>   drm/xe/ptl: Define GSC for PTL
>   drm/xe/ptl: Enable PXP for PTL
> 
>  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c |  2 +-
>  drivers/gpu/drm/xe/xe_gsc.c              | 13 +++++++------
>  drivers/gpu/drm/xe/xe_pci.c              |  1 +
>  drivers/gpu/drm/xe/xe_uc_fw.c            | 11 ++++++++---
>  4 files changed, 17 insertions(+), 10 deletions(-)
> 
> -- 
> 2.43.0
> 
