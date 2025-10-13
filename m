Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483DECCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 17:14:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E1610E0A2;
	Mon, 13 Oct 2025 17:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PmI/pnAU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C9010E0A2
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 17:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760375692; x=1791911692;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zPVUINhb2tLCvPMbXHfRi+4N4ES/yInZoM6FEVFFOmg=;
 b=PmI/pnAUyELgSuiAKwPl8rGJBnS8YlLlrEagmIYDtXQiPOwYIQEFFl68
 Tut7dBEkoA/TVWnn/TehmdZfOFb5wZK9rLEVre2jAdLDo9rln7vH+Rprn
 XRL+oMmGVebenoAZxtzAPXd5AKsQ+21eI6OU3FTf5+GeQebDSqadmnn29
 SwBF9/3gNgnyTa4b7tvSAel5WFPBsWB1q28sW4O2IaH7DLpNgQyyvJ4je
 7ShLqWhxlxKhECatM++P/1yjsr5WnwH0k3LNl7AMDzR7SgOxGqSJvVHgN
 sBaJaf2sLUIjOhlMoUTxIn/Q4sZMqN3LHBa0hOhwmTLn0cpOf5gWDjesp w==;
X-CSE-ConnectionGUID: Kyq+FgyzS6Kl5ivOcMtWmg==
X-CSE-MsgGUID: rTqWtKTrTciKo7V/qNgqng==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66345304"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66345304"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 10:14:51 -0700
X-CSE-ConnectionGUID: nY6/I5uYT0qm+mBzFKNpsQ==
X-CSE-MsgGUID: QcI9TziXRTOpCjcvXPAZDg==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 10:14:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 10:14:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 10:14:50 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.59) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 10:14:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zHe4RYfkPCWCJHGgTr4b9nVwEDVJKD6zrrbaM852AupIcNxeWv49Sbkdny2dpXH8LxSqqqzm8U5X3M87uEBxw0feK0G1Vv1M6gITiCD/mJ5sBKIKzuxT7YUPv8UR+WKpAF9cc7Rz1x3w3jMpjm7TyTCpKg3Sj6yzR5s8r7MmbG+N3tBfAFOCloUwcrJojjZ0YoBWWugQe7Eb+Q1Fb6iTuAqmlwC6d4hxlPP6Af0K3qSpKstb/lOf98LpUYebO/v1RoHQ4Mq4k2ea6DQx/9AwW4kYxpHhCMK4AbaL2H5MpY1HN0ch3ju1RMd8La12lCiVl9RbQpmzIn7JIuyzbGtpMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zm7wetoGjl/8tDyXBLTYvZRrIlPte6eN9iCwbjCulIc=;
 b=gwu5mUwt3PllnRGrkQ23G9RTiL9STdUVXY8u0FPGIS9tbMu8K+yGr7PKy5q368WFffYAnqqjBY3XM2TDWiV8V9S0UYuqyy186T4EyfpU+vCvSemFZ1KNesNhToIv56cF0mWROq7TIYdD6ROWA5IPRTI4s5wSeP8pFoBkllg6wfFT24zH4tc7cHdiQQuQeYe40Y8BLOktj1jg2G44JE0T6jGOydRk7li6Boob1w9YCWu2elgHprhLfY4K9YIw8ctGRFvj2nBhE7l+OPziFgb3YA7mx61g9zz6w0mNwKwSeLIawxlORmDCKd+aqh8DL5tGR4+6H4V7qD/TLo2WY1VtYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ1PR11MB6081.namprd11.prod.outlook.com (2603:10b6:a03:48c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Mon, 13 Oct
 2025 17:14:47 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 17:14:47 +0000
Date: Mon, 13 Oct 2025 10:14:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "simon.richter@hogyros.de" <simon.richter@hogyros.de>, "Auld, Matthew"
 <matthew.auld@intel.com>
Subject: Re: [PATCH v5 2/2] drm/xe: Enable 2M pages in xe_migrate_vram
Message-ID: <aO0zhM9xAMlnUDea@lstrano-desk.jf.intel.com>
References: <20251013034555.4121168-1-matthew.brost@intel.com>
 <20251013034555.4121168-3-matthew.brost@intel.com>
 <a435a2a974b8627c945471e75c4dc21b835e9d22.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a435a2a974b8627c945471e75c4dc21b835e9d22.camel@intel.com>
X-ClientProxiedBy: MW4PR04CA0161.namprd04.prod.outlook.com
 (2603:10b6:303:85::16) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ1PR11MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: 83dcd586-fe89-40e1-7a9b-08de0a7c02f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?GcTEZaHYg4g9hV5DBn//3Ce8D9DfjZClx07CheE3We1kmMDWvaEIKcqbpC?=
 =?iso-8859-1?Q?o26ZwPZd6PHgJePZf53Z8emonxq9QCAIAUGRmmjnAaBXUVhE+GZxLkI2Er?=
 =?iso-8859-1?Q?Z6kxVaDizksCACDun5hCYyQUDHo9oJQin0/wHoeJSkFzdyDPUkZgb9zSuq?=
 =?iso-8859-1?Q?hZC0aiBlEswUfZoQa8T8Hm6eL5XXJZDnCg7MvdFC3NdKJo1YtQRxVWSyuh?=
 =?iso-8859-1?Q?Bhtf5gdEnZ9H80f1VuBm6idNzcpfOYbazMCGkrwctEQZXZMUC1IBxb79hq?=
 =?iso-8859-1?Q?ZKtl+GjjQsrcS5YJtFlC7rSJxWKxt3wsD3pMaBmdOa8swejGwJnqiPbz7N?=
 =?iso-8859-1?Q?5UnWybocCWmfzxzzsPK7cph2OomIb8qMWRS/BB+UuGF40JgWCOLnQMxr+H?=
 =?iso-8859-1?Q?m1tDZZmRe3r2dsU2sj3UJwOzqMgF7FObTRbh1XAhXVw+9L9oSidZNn8j6y?=
 =?iso-8859-1?Q?v3wEECq6OVtiwpcWFyNLSvOWi9ala39e5K3FZNRLvkdrQBysiKZtgrvjUe?=
 =?iso-8859-1?Q?BU+AGPQDSbsjTRR+mWwCnZ7jNfeBllGNmWGhvoocnohShp0Gjy8QjcRxhK?=
 =?iso-8859-1?Q?jaGNX/8nq3ZCmKDDz080i8AJ9qMdtvdq0dDeiw5gaUj8aRXAep8fTJqeEw?=
 =?iso-8859-1?Q?CCsLbqeZXj59oCemgMbFG2s6cJuMCSx0e1UvGZAOrt+VeIqaHYNBUI+yCK?=
 =?iso-8859-1?Q?8rDjMSysqvGbHdH4I2p0Zer96chmMOCGEXRPRm8paoPFwiHn8QbaAagc6Z?=
 =?iso-8859-1?Q?TTtM9tcB3ptHdtgdUP73gwFvqUkp951a8qtE+SHVyp8XwBidUUox8KbSiF?=
 =?iso-8859-1?Q?Pg5R3DMp1AxRM0zOhCbUmrFe1HvtL6sC4fRnoeDQSITIyyXW5Ad2ZKaLAR?=
 =?iso-8859-1?Q?SDosGu8ReP7ITVqgWAGQCdZP1AK3za4OyOnbIaelqQ7oak9iFFU+4Dteqq?=
 =?iso-8859-1?Q?jMuJGsG5/2Rp//7Sl/JWCgvK9vQt6LHxLRmtEOgAsIyN9XS1hfpr4N7cY/?=
 =?iso-8859-1?Q?YQ5qZPryF25EfJGJ+ygHPcuzSaBIbrTOg0ajZEE36o6hNm6r09EQHrialx?=
 =?iso-8859-1?Q?r4P9JHtD45omz2zHwvRhKOal/32txtBr7kbUPHnQl+0ilMoOD+aZTg89Zt?=
 =?iso-8859-1?Q?yeXZ4Kxj/tuqOM+4g4JrWFIamy8jHxlEY/lBm941T+pkt2OyRtYGL0FBJ1?=
 =?iso-8859-1?Q?ZVUnhkd6M82jhylIphI9yEW2Sdin79TVpYUHapwoZzrDoIt7qIqUdPd5cD?=
 =?iso-8859-1?Q?mnhr5n2usSLJGdrqZJuipPpEmqOfotuydHTKeLa5TvqMnEs3SKtluIvROt?=
 =?iso-8859-1?Q?IZ+zi53w197QpZizomsGNlBihTH2fovb6ZkdcJ0byU5Ye91fm7PVb5YJXB?=
 =?iso-8859-1?Q?GTxQquoLBdLes86QwliAKkvI96gqcXG0PJIU1hLEMGn3ZsMZUXgkyyxpLt?=
 =?iso-8859-1?Q?ntmS+pKVZ7m9dwli2MxssALxvmvGXBOcnrAmpL1Ey/Nmpm3CJj6ToTNC0t?=
 =?iso-8859-1?Q?m5YdLViVg5ZFQXduXVaFAz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mnsHKBEfXgxeoYNyyeRuWUGWmx1UkY4eretpAaitH893nV1xiOOZAfGWhZ?=
 =?iso-8859-1?Q?LzHVGAEuDafDLUBZ3VavTrRuw9BJaxGqE78CxRObWyjtSfeh+T5LvOH8+T?=
 =?iso-8859-1?Q?rM/7PN6gd13ew+y9o0KCG/9taGpAHu/EdJyTpB3/ABXt7Xd6+TfJZcwkwP?=
 =?iso-8859-1?Q?wmAn2kSrixv1e3kF1LZnVLySjbMiP8D+ONLHh5PBhrNLpyv5N6LT/KcfxN?=
 =?iso-8859-1?Q?YtFAoHuH8CaPHxO03fgR7Blrtwd8Vr7H2x5USYCsAm0SmibTDpCCeuOJzk?=
 =?iso-8859-1?Q?G5NmgshPUW2ZxQxIFjEwQ5vYi6z4zfesWE1Fihq+ZvH/VcOnIEu4lccqF3?=
 =?iso-8859-1?Q?fEpKmdCYPddA/s+ZOZVHTqt0GpOWmNAQXWMeXoyTNd3zw6WmeJ8uEIfPK3?=
 =?iso-8859-1?Q?XK5pVzf7IRFCGEZE2Cf71cgJd93rLpiMVBYhvRPEtCZQ9BwG8cAeVo+6+2?=
 =?iso-8859-1?Q?v8zl0vaemsYqW29eKsnVfTVh6WMOcdusw7e837aPH1FbKLDBu9dhBUMO3K?=
 =?iso-8859-1?Q?6cJPWl9h5k9P22FClaFK3Gvj5csV9ttOv3vTqE3tzqyCWzw5IpZWH3PWNt?=
 =?iso-8859-1?Q?HIKKsx06gC3CH+/+32DMojXUZO/NydQu7pDmr8qZ5AGtwu1YIJuQXY1QYL?=
 =?iso-8859-1?Q?kR6tAnSpEhjSw3g/LmWwFr318urWbVCpFOeMvHXZfWDXEkEoWBWNOFASAH?=
 =?iso-8859-1?Q?kq0ygaZ9c8b8XEK7gFQaQBryHRd3+62LMgXtM1SC7o9ko/XliyCYPeVRso?=
 =?iso-8859-1?Q?fwiVKoGoBd2BJxV2kiFcZTWVZORoZzRCQVWWATC3z8zMTRJTiuAn4FRx/H?=
 =?iso-8859-1?Q?b5qeyuOtlf7ddPDxrRQA7wNMlM12XqMST9n6TQvAP/A+uIhSgok9F1TeCm?=
 =?iso-8859-1?Q?S/wfIFCwl/PL87wumfKz0k5RC3Wo4ZSs4/0sAEfRl6KpXq/Iq9l+J6jvOu?=
 =?iso-8859-1?Q?XbLfbSeapYLYCshqSliNdWIzdVGy9FdCZfYoYSQLfzVC/xyFTCc7iNaeN6?=
 =?iso-8859-1?Q?5WOLB6XwuXe5blUGZWuD98cjmqnRLo+mz3OwI/hwemWnU2PAFPZ7nPcDwc?=
 =?iso-8859-1?Q?HEQc/MtHVrmhf+F2ymbHYQxr4c8WTBvXvi/kgsPXgFzznrE7TMAm5CKtyY?=
 =?iso-8859-1?Q?X+ZSPsEkPAqItSgvCjZErMSPmU/Jm1K/ymcBVa5AXedgCDQvVIdIpvtEtm?=
 =?iso-8859-1?Q?DpMA9p8Ka5dLmJ5RBczsE8S842JV1+GuoxW5RekUACEBgdHdqgoKh7kWJ+?=
 =?iso-8859-1?Q?kQc4yc3zHamuqUlrrhp/q3iE0rmmmrdVy/eQ/XIdOwAqTGlKB+6mV01+Qi?=
 =?iso-8859-1?Q?Lfb0LhCY6dyy3SUc67kZSjqB1EUjQXVZY29PBNcXDLcvaFQnQgfuMOja8Z?=
 =?iso-8859-1?Q?eZFmYdyPOzboynUQkePjh0F0N5kl8mGlVZdVjjYAZFzx2cb9OBeHFegxnB?=
 =?iso-8859-1?Q?gNvXOD8bgHdznr9HZcdZ6HRAiI+Vc8xIw0+7TuiOV5WX9wP0VDm8dkvLBW?=
 =?iso-8859-1?Q?ocAcznuIw/ocV82HeeSAcmMnkMNph2c5/8WmDqVpLCekdWeyw0+5Kx3GPc?=
 =?iso-8859-1?Q?wyX09EF42ISm+IMZ5Cd5OK0JvxU9SYX2DDbxBUkPzqg9e12uK/8/ECCZ3h?=
 =?iso-8859-1?Q?V3+houl9EHHfnYeYYyt6VQTZuTpRpEf8i/ZyEvY/N4w1sgDd423TlOQw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83dcd586-fe89-40e1-7a9b-08de0a7c02f3
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 17:14:47.7555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fBtoRfaEp+Rg5aUTA2hrtnRk5ZRbfm8q9P0aZMKtwAgHu9m3NuU46HPc3oBi78LHIL/U/PtA2eekW0Ra7q2Uwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6081
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

On Mon, Oct 13, 2025 at 11:08:03AM -0600, Summers, Stuart wrote:
> On Sun, 2025-10-12 at 20:45 -0700, Matthew Brost wrote:
> > Using 2M pages in xe_migrate_vram has two benefits: we issue fewer
> > instructions per 2M copy (1 vs. 512), and the cache hit rate should
> > be
> > higher. This results in increased copy engine bandwidth, as shown by
> > benchmark IGTs.
> > 
> > Enable 2M pages by reserving PDEs in the migrate VM and using 2M
> > pages
> > in xe_migrate_vram if the DMA address order matches 2M.
> > 
> > v2:
> >  - Reuse build_pt_update_batch_sram (Stuart)
> >  - Fix build_pt_update_batch_sram for PAGE_SIZE > 4K
> > v3:
> >  - More fixes for PAGE_SIZE > 4K, align chunk, decrement chunk as
> > needed
> >  - Use stack incr var in xe_migrate_vram_use_pde (Stuart)
> > v4:
> >  - Split PAGE_SIZE > 4K fix out in different patch (Stuart)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_migrate.c | 53 ++++++++++++++++++++++++++++---
> > --
> >  1 file changed, 45 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > b/drivers/gpu/drm/xe/xe_migrate.c
> > index 216fc0ec2bb7..4ca48dd1cfd8 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -57,6 +57,13 @@ struct xe_migrate {
> >         u64 usm_batch_base_ofs;
> >         /** @cleared_mem_ofs: VM offset of @cleared_bo. */
> >         u64 cleared_mem_ofs;
> > +       /** @large_page_copy_ofs: VM offset of 2M pages used for
> > large copies */
> > +       u64 large_page_copy_ofs;
> > +       /**
> > +        * @large_page_copy_pdes: BO offset to writeout 2M pages
> > (PDEs) used for
> > +        * large copies
> > +        */
> > +       u64 large_page_copy_pdes;
> >         /**
> >          * @fence: dma-fence representing the last migration job
> > batch.
> >          * Protected by @job_mutex.
> > @@ -288,6 +295,12 @@ static int xe_migrate_prepare_vm(struct xe_tile
> > *tile, struct xe_migrate *m,
> >                           (i + 1) * 8, u64, entry);
> >         }
> >  
> > +       /* Reserve 2M PDEs */
> > +       level = 1;
> > +       m->large_page_copy_ofs = NUM_PT_SLOTS << xe_pt_shift(level);
> > +       m->large_page_copy_pdes = map_ofs + XE_PAGE_SIZE * level +
> > +               NUM_PT_SLOTS * 8;
> > +
> >         /* Set up a 1GiB NULL mapping at 255GiB offset. */
> >         level = 2;
> >         xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE * level + 255
> > * 8, u64,
> > @@ -1778,10 +1791,10 @@ static u32 pte_update_cmd_size(u64 size)
> >  static void build_pt_update_batch_sram(struct xe_migrate *m,
> >                                        struct xe_bb *bb, u32
> > pt_offset,
> >                                        struct drm_pagemap_addr
> > *sram_addr,
> > -                                      u32 size)
> > +                                      u32 size, int level)
> >  {
> >         u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
> > -       u64 gpu_page_size = 0x1ull << xe_pt_shift(0);
> > +       u64 gpu_page_size = 0x1ull << xe_pt_shift(level);
> >         u32 ptes;
> >         int i = 0;
> >  
> > @@ -1808,7 +1821,7 @@ static void build_pt_update_batch_sram(struct
> > xe_migrate *m,
> >  again:
> >                         pte = m->q->vm->pt_ops->pte_encode_addr(m-
> > >tile->xe,
> >                                                                 addr,
> > pat_index,
> > -                                                               0,
> > false, 0);
> > +                                                               level
> > , false, 0);
> >                         bb->cs[bb->len++] = lower_32_bits(pte);
> >                         bb->cs[bb->len++] = upper_32_bits(pte);
> >  
> > @@ -1826,6 +1839,19 @@ static void build_pt_update_batch_sram(struct
> > xe_migrate *m,
> >         }
> >  }
> >  
> > +static bool xe_migrate_vram_use_pde(struct drm_pagemap_addr
> > *sram_addr,
> > +                                   unsigned long size)
> > +{
> > +       u32 large_size = (0x1 << xe_pt_shift(1));
> > +       unsigned long i, incr = large_size / PAGE_SIZE;
> > +
> > +       for (i = 0; i < DIV_ROUND_UP(size, PAGE_SIZE); i += incr)
> > +               if (PAGE_SIZE << sram_addr[i].order != large_size)
> > +                       return false;
> > +
> > +       return true;
> > +}
> > +
> >  enum xe_migrate_copy_dir {
> >         XE_MIGRATE_COPY_TO_VRAM,
> >         XE_MIGRATE_COPY_TO_SRAM,
> > @@ -1855,6 +1881,7 @@ static struct dma_fence *xe_migrate_vram(struct
> > xe_migrate *m,
> >                 PAGE_SIZE : 4;
> >         int err;
> >         unsigned long i, j;
> > +       bool use_pde = xe_migrate_vram_use_pde(sram_addr, len +
> > sram_offset);
> >  
> >         if (drm_WARN_ON(&xe->drm, (len & XE_CACHELINE_MASK) ||
> >                         (sram_offset | vram_addr) &
> > XE_CACHELINE_MASK))
> > @@ -1879,7 +1906,7 @@ static struct dma_fence *xe_migrate_vram(struct
> > xe_migrate *m,
> >          * struct drm_pagemap_addr. Ensure this is the case even with
> > higher
> >          * orders.
> >          */
> > -       for (i = 0; i < npages;) {
> > +       for (i = 0; !use_pde && i < npages;) {
> 
> What if the CPU page size is larger than 2M? Don't we still want this?
> 

I'm not handling this but I believe CPU pages are at most 64k on ARM,
power, or longsoon. I could add an assert I suppose to make sure this
unhandled case never occurs.

Matt

> Thanks,
> Stuart
> 
> >                 unsigned int order = sram_addr[i].order;
> >  
> >                 for (j = 1; j < NR_PAGES(order) && i + j < npages;
> > j++)
> > @@ -1889,16 +1916,26 @@ static struct dma_fence
> > *xe_migrate_vram(struct xe_migrate *m,
> >                 i += NR_PAGES(order);
> >         }
> >  
> > -       build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
> > -                                  sram_addr, len + sram_offset);
> > +       if (use_pde)
> > +               build_pt_update_batch_sram(m, bb, m-
> > >large_page_copy_pdes,
> > +                                          sram_addr, len +
> > sram_offset, 1);
> > +       else
> > +               build_pt_update_batch_sram(m, bb, pt_slot *
> > XE_PAGE_SIZE,
> > +                                          sram_addr, len +
> > sram_offset, 0);
> >  
> >         if (dir == XE_MIGRATE_COPY_TO_VRAM) {
> > -               src_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) +
> > sram_offset;
> > +               if (use_pde)
> > +                       src_L0_ofs = m->large_page_copy_ofs +
> > sram_offset;
> > +               else
> > +                       src_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) +
> > sram_offset;
> >                 dst_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr,
> > false);
> >  
> >         } else {
> >                 src_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr,
> > false);
> > -               dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) +
> > sram_offset;
> > +               if (use_pde)
> > +                       dst_L0_ofs = m->large_page_copy_ofs +
> > sram_offset;
> > +               else
> > +                       dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) +
> > sram_offset;
> >         }
> >  
> >         bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> 
