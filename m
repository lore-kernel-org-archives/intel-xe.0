Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5194BC77B7C
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 05:46:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D4810E61B;
	Fri, 12 May 2023 05:46:12 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409E710E61B
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 05:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683870370; x=1715406370;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lEGSDlFLFcNI4C3gk0q3+hpiykasn9vyLbmZjpur7FE=;
 b=HukIehR/j7uTNIzC7GZFajx0WaczeKGtNfXDkQiu5b8JK+MaTueXuSa+
 JLNAYP/i7ysmWyTE8ZvxWxxqBGOuuzA7zqap83MULouF0XUwX6XmO22IY
 EVofzciOQiMAdEnL5pjwfvXulx3GdE0bXLIwnWHtmIPXiAdpAwHuxPJZ8
 mMunyZwgHmYf59MzWQboL/roP9i/8t+r+lO8hT6yI0WcqUB+qD2PErafH
 dpcgV73XKpAU2WnCX+NURVGFqvhx2lGsnVUId2hNcIw2uLrIMHqOy+jFP
 vefggYKzQZmi3UHlSW3AmQerDDGuA7OkT/6oau4fyZwOWEXNw2kktkGnq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="340018011"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="340018011"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 22:46:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="765037709"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="765037709"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 11 May 2023 22:46:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 22:46:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 22:46:08 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 22:46:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/H//nDfadBSki22ieIC25SHKK8GaErvLGmdPX6VfYN1e0CrqfqISrsbfHdhmwoj4oOmpf6zHY9KC8jLnk5qVHrYZ+M4FLr7EKP7RUtFabB36zF3B+hs1LG1Vw3MQ8mV8TRYnJF656/V5ZfZeLLpGavNXcnBWdanGhePuzLs685Ja2gshv0FBRM04RIaFP4OOf65KFVzd4DK7MIvU+VYhEeki4mYP0OjQ3sv1aZ8NPGPgczy13zijQiCSU/hYX1oihmEVwCyLPWxdaBBqJkXWU8C993TUctgBuKcu4h71/UanfALyrDQIRFfNseF/HWrck+U4ZmmABbMlLcC0wQqpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bbg1copfiz8a7lk86AIhAMA7T91DRe6FGSAM9jGaSe4=;
 b=MO5J/ouWHg1Gs1Dke649GFNJFp09obYFfjQD8rNToJlHchUmOn+spF9XbzROKWvU6V8HAfcFToY+631gsU38GfoLKiHPC24BGS0jWG9IZTKt/Twbx+yjzXPC/EgJNIvMHGMgqc2BF4+eCdqaDlxyPK7ce0FU9qVRxD+PrQNF9RuiM+56EsjgJ1Kxe6ID05HoS/bRe1BGkN2rjPMMQimYZQu6+Ls/QI0/NSgNaKyGTQtoKLc3YTe+RX67PchjZYlZyQJTHUT9yBfIuseuSE2sPw51XWOMvZAh6uaidAgjwWg7dtfWlGaB1QRGvgchJN0FiivlhkoQ9x9H2ybDy/tdeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by MW4PR11MB6716.namprd11.prod.outlook.com (2603:10b6:303:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21; Fri, 12 May
 2023 05:46:05 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::4921:b87b:297:f312]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::4921:b87b:297:f312%6]) with mapi id 15.20.6387.022; Fri, 12 May 2023
 05:46:05 +0000
Message-ID: <7d2e05ca-ca40-d793-e77d-80c316035cb7@intel.com>
Date: Fri, 12 May 2023 11:15:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.1
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-3-matthew.d.roper@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230511034722.1929038-3-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0185.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::12) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|MW4PR11MB6716:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fdf04d9-61e5-4530-5e58-08db52ac2d65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2H6GH0N5pPdBQdQJzmvl3gPyCS3YTr0UW+902H+/AdjcEW0g4BkrGO90xTxLTyzrv9K/4c8ewbmPLC7EKVVMSJWg0Ac7vaYHGwNjvGeifmLSLqlUnO/Vijx/GaoMNDy51RJBW9f61JEU7oL1VthMsKcuGZvgIQ3d76G3E6FCth/jyng8/M+OvmPMyOO4qSaNTF0qM4fapCnY263VnImMAHD9v4Quk5tQkDW9DhesdV5y7c4Jxb6wrWkFMXKaUmlb800SwAZiVNTthn1ZnnPVZ4fCS6ahUtjLppY14+AC+lvHunPunHT/dbFMavwWfjywz7ooyPhLWbvSQARPM2Q62K0DehQ3tq9kmaLb1DJduO/6wT5PXCow5xr+8oklKbFqfft2fIXtY4/pYjCmB6Tzm+L1AlBN3kE83JMvjEnCYFG4dNRGTUwu7nmYiPdcnKiyuxJn6WrOBych5u7khX6hFXBKZof6BO8r67nFN4ArTkl0zRu3xBy+3hN0fLZeDSQuL1wpY0eWeYqBWK9zqigC+mHYzq19gvYmdcPkBWw8T7vzHhNAwzjyfo8FpoMwz/LX22FIgXEB4FTggraGdyj4BYu5aAKbzre093hFXAr6WkFatQRa2m/chxRx8NeOf+g8EvxvA8GQoLiRAnnQZXqwIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(346002)(366004)(396003)(39860400002)(451199021)(8676002)(53546011)(2906002)(83380400001)(316002)(2616005)(186003)(66476007)(66946007)(6666004)(41300700001)(66556008)(478600001)(5660300002)(6486002)(26005)(6506007)(8936002)(6512007)(82960400001)(38100700002)(36756003)(86362001)(31696002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekhZRkNIQmppUnZpRDh3SjlucUZCaC8xaVBJbW8zMzRoZGR3aU9WUGZEeVcr?=
 =?utf-8?B?bUY0a2c3ZEw3eWFHc0d1cllid25rS09ZRTVnY3dnb0RkYVZraCs5bllhWm9J?=
 =?utf-8?B?ZENEMmVsMGlUZWs5ZTltU0JqcDYxN0U0RHpWY0V0RitmejB1dE9CaHNONU5L?=
 =?utf-8?B?aTNqREFtVDd0cGxJL3JsQ0c3aWNHUlFPaGdpbkJJaDhrc1NuTW5HZ05TUndX?=
 =?utf-8?B?WDZ4RGh6MmpOcERybzhCL2hGdUpsYjlQV1F5M0dDTWRhcXNOUENpbmZ5aGZ2?=
 =?utf-8?B?b0h6TFJCc01NcHdlR2VTbWoxUzBGUzJDdWtEdDdUWHBSMzFiOXMwNDNURUI5?=
 =?utf-8?B?Ujh3bDliRE9lMEZ0Rk9EQkNLSUZmMlhST3JlRTFKNVRydS80VlZTNGh5UUNu?=
 =?utf-8?B?WnM2cG5iV2pBTC9ERG5vbU1WLysrdENCSXNHZkZVbEFSTnFpVzAwakN4UEQw?=
 =?utf-8?B?WEZubVZiazVyMkJjUXRpaHV6akFMREVqVWZ5VVpNZTZGMjRkRmgvc1FXR0Ir?=
 =?utf-8?B?TXFrNlVTYlpxTGRLWEtDbFU3bno0NW84ajlYN1V0bVVaaUdsaGRLN3FsY2lY?=
 =?utf-8?B?NnBFbUpYVUJ5TDFEMjlMQzd3SUFUZklCUndOZGVZT2w2T3NZaWEvRUREZitV?=
 =?utf-8?B?NkhCKzgrR0QyRnArUUx1eGlFRURiM2RncXFnNDAyQ3lDeXFTaXFkVU11WTlO?=
 =?utf-8?B?dEZzaVNzOVZsS0dLOFVrQ2Urd0VyOXZYYm9DQzh0YUVoK0cvWUVOb01VenJu?=
 =?utf-8?B?ZUhSVmw4Q25XWXl2MXg1dHdOam9kYXBhUURSb1lFVFMwaTl2WE1iVWxrODFY?=
 =?utf-8?B?dmZ4WUxBMmxPZFVtblVXc29uMGJQS2MxTlFaMnhCbWcrdW8yOFdndGc2c2Q4?=
 =?utf-8?B?Q3JRamFnNjdreVNaaW4vcjNOdnlvSU5xR3dvUyszMnJNV2t2TnhTZW5IN0ly?=
 =?utf-8?B?RExLbW9MdUtKd0MwVmRCeTkzZnZPR210QWlRZUM4bWQ4bVBGVnc1YnJDS0JK?=
 =?utf-8?B?TWIzbHdyR2Njc2pHUHpVQ2ozVHBqNnduQ3ZWL1lsbEdSRU56aUJqMXNqMGtt?=
 =?utf-8?B?aS9tNll2S2JCc3NRQnByVG1OUm5vQ0J2Q0tYTDFBZHd4TkNYa2NCa292eEtB?=
 =?utf-8?B?L3RnWllwckp0anhTdGVlblpqQXp5eUFLZndZMmh6N04vVTByOWt0dGlCVStz?=
 =?utf-8?B?cFphWFJlbHlXSUE1eVlRSUN1TWFUK0lmejUxRG1uRlVhT0hybnJESE1Yd0lY?=
 =?utf-8?B?WXBkc1RhRzNMZjFDL3Z4cWltZFdIck42eGdtOXJZZmRzWHBXV0duMHNudUhJ?=
 =?utf-8?B?QjJ1b05pZVZyZXZvQVNPTHFOOGNKcUtJSzJpTndzdHhxVHIrWkVZdHU5eXpS?=
 =?utf-8?B?SGU2K2d2SXU1TEw2RW5Vditmd3ZhVjJnOUhJeFBubFZuNWEwTTdGOFFvOTIx?=
 =?utf-8?B?VTdvVFlpYW55ZnBqM2piWlpNY3d6QXBMS25TcjQxT2FCN0F6VjVGRENBSjZz?=
 =?utf-8?B?WnVlL0dYWlRZdFpDZHlSRnZET1hmYnlFQzZKKzl1cDY0YzRkRjJwYUVwMnRh?=
 =?utf-8?B?Z3NxdWVGeUM1dWhSZk9tRzdxem1ud3pvdE9CYVF4TWpvOW9ha0ZmakRsc2po?=
 =?utf-8?B?ODQzbHI1VE42ekI0cXFxQUd4SjQ4NTNyVG1jUWRUS0Z1Z0pDdzJ0c2dXT3dt?=
 =?utf-8?B?cHozdTRFeEQwQ3dHQUxzNDczYUNyNGp6Y3dIUWQ1NHIzaGlhT080V3VJYzZ5?=
 =?utf-8?B?TklaaXNEelQ1cnBISUpyT0psVGVMS0YyYzBYeTZLNVZtaXJhQWJxZ0VqbGZ3?=
 =?utf-8?B?U1VCSVVBWENQUVRyc0VCblJWZGk2cjgwSUU5WFJ1VStDWElBZS9HMnZpWDA4?=
 =?utf-8?B?bXJDY0V4ZWt0OExiU2l5SzBtWUpIZXIvbm1uS1RKRXJvbndDOUxBajk0WDlu?=
 =?utf-8?B?WUZvZE5LRHdZWUJmVXJ3cDFvTXJ5U004bVNMQ0xQQzFyNlUyMHpyL3hGKzI0?=
 =?utf-8?B?TjhySDBqM0ZFdFlTTWlCZ3BPVjJoUG14RGpFSWRkYVpaZkRqcGp1LzV1WjFC?=
 =?utf-8?B?Rm9tN3d4RW5lT2RUK09sTFBzRThwVUN4bk9kajJQdm94MUpVTHpCTjFBWVhI?=
 =?utf-8?B?L0F6ckVBZmx0ZGpxV3E5MFU1Ym5HczZYYlRLNkg5Z3ExNXNVUzlKQUZjbVNi?=
 =?utf-8?B?cGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fdf04d9-61e5-4530-5e58-08db52ac2d65
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 05:46:05.6058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S9vE3d/Kdr+xRFpZvq93pIzKeIAXWcXHaAikt5u5os1ACc6Flg2rD9/hmvP56eXDMdFRkkD+YuUtMpvwiCwNqGe9cFsCiyer3A2q6tyecd0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6716
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 02/26] drm/xe: Introduce xe_tile
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



On 11-05-2023 09:16, Matt Roper wrote:
> Create a new xe_tile structure to begin separating the concept of "tile"
> from "GT."  A tile is effectively a complete GPU, and a GT is just one
> part of that.  On platforms like MTL, there's only a single full GPU
> (tile) which has its IP blocks provided by two GTs.  In contrast, a
> "multi-tile" platform like PVC is basically multiple complete GPUs
> packed behind a single PCI device.
> 
> For now, just create xe_tile as a simple wrapper around xe_gt.  The
> items in xe_gt that are truly tied to the tile rather than the GT will
> be moved in future patches.  Support for multiple GTs per tile (i.e.,
> the MTL standalone media case) will also be re-introduced in a future
> patch.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.h       | 11 +++++---
>  drivers/gpu/drm/xe/xe_device_types.h | 40 +++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_gt_types.h     | 15 +++++++----
>  drivers/gpu/drm/xe/xe_mmio.c         | 13 ++++-----
>  drivers/gpu/drm/xe/xe_pci.c          |  5 +++-
>  drivers/gpu/drm/xe/xe_vm.c           |  2 +-
>  drivers/gpu/drm/xe/xe_vm_types.h     |  8 +++---
>  7 files changed, 71 insertions(+), 23 deletions(-)
> 
> 

<snip>
> +struct xe_tile {
> +	/** @xe: Backpointer to tile's PCI device */
> +	struct xe_device *xe;
> +
> +	/** @id: ID of the tile */
> +	u8 id;
> +
> +	/**
> +	 * @primary_gt: Primary GT
> +	 */
> +	struct xe_gt primary_gt;

can we have an array of GTs with primary always located at 0 and others
stored as per ID, that way we could properly retrieve a GT from a tile
using GT_ID assuming we keep GT id local to tile.

Thanks,
Aravind.
> +
> +	/* TODO: Add media GT here */
> +};
> +
