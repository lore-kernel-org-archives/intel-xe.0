Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439FBCA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 18:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF50210E664;
	Mon, 12 Oct 2026 18:42:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE03810E664
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 18:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791830517; x=1823366517;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eGYZ9cWzQYQ+W2V3w8qSuSXTBB62wwO5OpR6T1EWGIQ=;
 b=ERKnhuYPhvRpCbRSSPaEEXc4f+RSvboVrz6BNWvLF0XYQan8Ztik1Kdm
 v/Bx+9Odb3Nxub6ek9SrL5ds2S7abgz67LCuoUznJpO8dzyEWdQYp7+eY
 3mnYlBiyoW0FEsOJRVjiAlQnVQm00EUtXoD31Oqj58BCC7LSP8Byv76PF
 5+7CA1V8Jg4N+NLLMyf88DenYQPZhAbzOlEOq7RxfWwPzg2hizG/pOhZV
 P2MRpUbe7oaLpxyuwlo/CFmTg/BEUkww0UFWD448Fkjfgv/jpOcsutIk4
 IscAMZNslwOzBM2CX+RAb2PzHTGZd+8441AgUXpPwzTbSmkvIlu+a5Ra4 w==;
X-CSE-ConnectionGUID: cqnSf7MOTQGSHO9gmKeJCg==
X-CSE-MsgGUID: jhhLI9l0S3mMmlcF4F4pww==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="429930"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="429930"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 11:41:57 -0700
X-CSE-ConnectionGUID: Fnaj52FVQJ2y0aW3N+5YSg==
X-CSE-MsgGUID: tzR65CoPTSSNHxsFk3lJ4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="2809207"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 11:41:56 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 11:41:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 11:41:55 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.41)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 11:41:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0XMBo0QO2ox/Pkct0Ac3zWUTNbm9e/tgRDRwYImPda6ruewsCXiQfifHaNOsNN4ibkVb4cBahOHMyE/l9uY8HeixFgQFwoIZrPetkhm8cxcCl+Vo5oNJ2bRGyrREiX5qjZEiOGSVHQVhMDsAXoloHJZVd7Hutpfhy6JCJQjyrkIIzJVAslmufOfMs3dP/AYATHOpQK3tDHXG0+F53nzU5OjsiGdqTJCLAQ91skU73HR41j/2D52mKD1Ep1V1PuCCx5FrzLLfK7vUmIuj1L7QPbxDKyUeWVRb+rQcmROhlZN/sydX038+dFbleXMvQxjec9phlAgyMdbaL2vzYlP2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8quk7Sitf1WfxlJU9Nf4ozlL/Iy3PMRQrva1PK+V4o=;
 b=XtPDw2kzck16/FCPvhuFRFkUOSzup5S3iQlmez/o9N7jeNcwF2MfZzYUDFXg5F3jmeNboqrf7H+iWuSHgo9TmdYHeowzp8HNcLyOIu/VYHLOEYHoxY9EUvOyHD78jMPHFFZPZ8xOaxLbAdMKYUJ6vpSAJsUS0HlPdT6KKfKaZdLg8D1TTue8iTWyLCbjmvbJZK3Lv6whA8Tsrm0oPCJ4CuZ0rzkQUkMu6rwL6GweHt0Sy4shEee+g8hoUeOdIRBve6TIc7X8OgK1KeLQlnHIDO1SEd5DPxTo1h9OWeKgi7huvWbItE2pbgPzQkwFOfPXAqcfHXi8ldQwnAwUoVYx8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB4677.namprd11.prod.outlook.com (2603:10b6:208:24e::23)
 by BL3PR11MB6531.namprd11.prod.outlook.com (2603:10b6:208:38e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Mon, 12 Oct
 2026 18:41:53 +0000
Received: from MN2PR11MB4677.namprd11.prod.outlook.com
 ([fe80::5b69:f9a9:3a17:ceb9]) by MN2PR11MB4677.namprd11.prod.outlook.com
 ([fe80::5b69:f9a9:3a17:ceb9%4]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 18:41:53 +0000
Date: Mon, 12 Oct 2026 11:41:51 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: skip eviction of a BO with no resource
Message-ID: <as0p76CxfdoqN8Aw@nvishwa1-desk>
References: <20261010054041.1327217-4-niranjana.vishwanathapura@intel.com>
 <20261010054041.1327217-5-niranjana.vishwanathapura@intel.com>
 <DS0PR11MB87183BD13715E4AAF20D9E8A819F2@DS0PR11MB8718.namprd11.prod.outlook.com>
 <aszu9/68xztiPeUJ@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aszu9/68xztiPeUJ@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: SJ0PR05CA0106.namprd05.prod.outlook.com
 (2603:10b6:a03:334::21) To MN2PR11MB4677.namprd11.prod.outlook.com
 (2603:10b6:208:24e::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4677:EE_|BL3PR11MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b079020-0be8-4ee4-5752-08df28907c4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|22082099003|10067099003|261009223027099003|18002099003|4143699003|11063799006|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info: mm0k0jIeCxBm8q6frOX6mNGZsuQGfD6eXUH9RfImvX9tOR8ua59dYul0FJmN+8iW2RviFz+T0F+jHN/aR0MGxVYksh3z+4qWvocBnjVaHr/zT+TkOyx8NpClvIKeY5iygN+JpehFmiN2kjT6r+17TXOV2m9uuta94TohlnD/VSUNtCrSoy6YLG/I3zdt0mKaQWcDuB6rLXkcmmXlLTkMrJMO8l1ONuuo11ASnfx7K9FwNU4d6Bv2uRI6+riJpWyg7URu1uqVcwuOiZ+G+Gr0I743nH/3fJ2/Rw147kgyWN9vUY+SMYeFRvMAts1pzQMtunDbnSuagBVltDg/8MoBTxnFMyHCu6ne9Bgg6NFIeBQBBpRKgUn+zH05w+t6JAm2dxlxp5mMXjIlQmC2XW7vqczfUe2ve81CgaMzAgjKINVR1tudUtAsTjLK3kRfJfEr5fxYF2MhhE9qt7XYC6iv+mvQ1Sy5CqX+GRuIRsrG4rOfyGULbtk9N03N2WzdRtDO/NOBqoJkLGg/8ULC8KLyp0QLDhleCGi55oDQsE5KIekuZQfN2bypXif9zk7aES9rCUKJ7mqD0zJyugVvCoyvm0jo0iSq3kaXK4uD/djxV+BDnIb3M+TUFAOjccuMq122lFeaahjZkV9QRZZ48hkvbEq7SCupCiB2jN7DgZOe9+8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4677.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(10067099003)(261009223027099003)(18002099003)(4143699003)(11063799006)(56012099006)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T3b6zYEy7GqV0bRuM5zQ7TicpW+nOjspPK+tge8Git0XCy7hmYPMTq1KQ+gv?=
 =?us-ascii?Q?l9GMqYTXEtCf+8tSbjCs4Ysmpkv+6xsaNnggcyaWR4hQuA/b+R+dudnFlg4+?=
 =?us-ascii?Q?lSAyOYOvgt2GApzE7Wlfk2Xq3UJ2QQ8osDD3RqkbMG731kEDGtB3dTAlQ8us?=
 =?us-ascii?Q?7ceBAxKtV3JHMWcKddmOE2m0cnyiZgOli4udM4c/KhnynZ3XLHmhFxdme5Hy?=
 =?us-ascii?Q?r6z44/37m/z1NlYFZ+Dh2CESY9cwl5YsZOSXWjLDsjf4GkcpxownJKTQXb2s?=
 =?us-ascii?Q?27jV6x0kltat9qd218njBxpmNvmvw7x9Bm7GVBRfVaRP4IfqdMtS99/h2rH5?=
 =?us-ascii?Q?HgPzK3zKMj9ADbBiID9JSeR7qhZiDOL+ff8lWBkrDxxlXa/L3q13qiqSMQkc?=
 =?us-ascii?Q?+SnwCzjul5mRd+0Rd0m2vVSB5Y4ce4/7qQkwUEQMx/GSgBrf14Sa05vKlBsu?=
 =?us-ascii?Q?OK9+k0bmPPIXO3J8ih6rjOhtiNcLIK4B7zAcUryU9i8AMngbROo8cSLsIG4/?=
 =?us-ascii?Q?RFWfcUGR8BmYD4E9r83wXasneXqhuu22M7SVWUw1PWPoAjTzdkQ8YmVvhVC0?=
 =?us-ascii?Q?bHEc4EpynlrJEB66HGfb70xxeO6BtHxoed+b4tDqXW1hnKA6fQlDjFqoGVx5?=
 =?us-ascii?Q?8xGmMfvr3q3SBw0rp04Q2AcWzgBp00Hrf3535BUVZKH1jP+hUmCgHYt/2So6?=
 =?us-ascii?Q?khJFiJ1U1tVVuZ8rU6018tad+rO1C6+Wpc0n8SLf6pOJ+9K3GlF0mGfVQFOC?=
 =?us-ascii?Q?n4kj4/lVzx9kPNvX3mYizn51AQknp6ZNGpSjXGCFms+9rsrEkF24MoNFZZ+m?=
 =?us-ascii?Q?Bz3DMRZSLv7kccIdHHDGWqCRHlxX7ZWH7n4pHTnL27oOwh5cMwEQkI9YhSTk?=
 =?us-ascii?Q?Y5P8THDvF+K4Psfp+5K5mZrImNcGCD1H0lhdIQqM/DROwXczoGCJFQoMEmVK?=
 =?us-ascii?Q?c2dSDjzqyqTioY0/tjTTIcqEcnSdnwKIOXN+qNhDg6hU3LaJXLQWQU7d9A3R?=
 =?us-ascii?Q?extFSu398DOpvhGBKdq+BaUgvO0CDj40oNYtIV5d+QRhqd7H4Xp4f4f1sCZR?=
 =?us-ascii?Q?b1rZKGsEw5E5iiChKgKX0tezQRt+xCtNT9zz7SlsRipUJOQ4O5mDJf+tjlGc?=
 =?us-ascii?Q?xrUIPSTJxRIH5apuz4CbMT99/NJH6iFhhB1AB42WAM8OcCE1JOXdYXdcgHLr?=
 =?us-ascii?Q?ON33dSxSfaLhrcE1eiMRnhECs3iG60GndYCzPlyrSnqYO1m5/Rpl7NSpkfmE?=
 =?us-ascii?Q?etmTVYZCf2FWIYzhikS0YwHeyIHUh4xHlN3J5cQBrDGzHEJEkSNHmHSI8pxK?=
 =?us-ascii?Q?cXzr/LlRvu4tjFYTYFkneN6Qtg7zAXe0rAQvT36cVGUaGbIXCDbY2KApHiIu?=
 =?us-ascii?Q?EcanTSl70Yk5iL8Qpfpdhu2fBFN/gmXPompVs1F2wLqZtudFim2a1WMHmxbD?=
 =?us-ascii?Q?rVtpDYPnQtdYfnscCn7dGGFHU/DGfk7euAhOicrZkxaV7AEBAYZgh+wlgLoB?=
 =?us-ascii?Q?sAmOZba6oEAqGMxJy0879njlcyxPCw8m+wuf0+i4YKvfaUmUlOIFFqIMfhUw?=
 =?us-ascii?Q?LKoMlk0guzPaa6K6AhQQman5RnuHR54E8dpkU/Y/dToMIYVDduDvkstTdsOI?=
 =?us-ascii?Q?EaNTn5SF35tG8AhBTKGa1Bd/hpdw6+TbHXonsjidLOqleiY4whcq4x56v0As?=
 =?us-ascii?Q?5NALhf+5tIX9IT67of8YwWcroRlYB3yqUlNcckNSlY1/M46tkFBYa0Mc+wqm?=
 =?us-ascii?Q?QFoPfD6fhwi/TWD4Iexrb9B+2qTn8dEjZeLtpQ4VP+tUdTFkEsHn?=
X-Exchange-RoutingPolicyChecked: KLd4ksOXbKSN1ulWfQjnJoSgxqqyEc/LQuezC0bClE6cA6bhnHn3A0+lvKB8YDqKbnavqiruLIIv1xu85zH37Ip42UIlaLt0wQ1ReyG5LT24e8aVk+sXGh0GJJORsWgBO6MXPmzY0pggEfywmsOXemrZbBdgfMGQ96itzsZLbTfTU2lEv3Ffn6cdAaCUdBaMzcbN/TupraAYVs/h4ERLln7WE+98oVLJmUi5W3joibM9Fn2pdZpTD+gtZ+t5IaopaelblgKSsKukthYBjsyGRnzdLQsTo5hzaR4sfzxpNerYNsf91kuguMiaTHdD2OJ7M/ymfE5xtQ7/U6kLIenifQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b079020-0be8-4ee4-5752-08df28907c4b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 18:41:53.8005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9UcNw501lztKANgaEGzfKf+vbrOEs3+bnYSJ7An6QvUdseWFAYjGtj5F+S2KKy9i6OzTu6Vw5H5BfdgN5miuj/RbEmy/goUd8lmW8KC8UmVvttUUYpH6a5XOk0Agoiwq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6531
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

On Mon, Oct 12, 2026 at 07:30:15AM -0700, Matthew Brost wrote:
>On Mon, Oct 12, 2026 at 02:05:39PM +0000, Upadhyay, Tejas wrote:
>>
>>
>> > -----Original Message-----
>> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>> > Niranjana Vishwanathapura
>> > Sent: 10 October 2026 11:11
>> > To: intel-xe@lists.freedesktop.org
>> > Subject: [PATCH 1/2] drm/xe: skip eviction of a BO with no resource
>> >
>> > xe_evict_flags() switches on tbo->resource->mem_type to choose an eviction
>> > placement. An xe BO can reach eviction with no ttm.resource, e.g. an imported
>> > dma-buf BO whose resource was freed during teardown while its attachment
>> > is still live: the exporter then invalidates it via
>> > xe_dma_buf_move_notify() -> xe_bo_evict(), and the switch dereferences a
>> > NULL resource and faults.
>> >
>> > A BO with no resource has nothing placed or mapped, so there is nothing to
>> > evict. Return an empty placement (num_placement = 0), mirroring the
>> > handling already used for non-xe scatter-gather BOs just above;
>> > ttm_bo_validate() then takes the pipeline-gutting path and returns 0.
>> >
>> > Assisted-by: GitHub-Copilot:claude-opus-4.8
>
>Assisted-by: LLM
>
>This looks like a fixes. To unburden my mental tax, what does the
>current code do if !tbo->resource upon eviction? If it is anything bad
>or undesired, this is a fixes.
>

Yah, it is a NULL pointer deref issue in xe_evict_flags(). As it is a
timing issue during BO teardown between when the resource is released
and when it is detached from dma_buf, Kunit test is included in the
series to reliably check for it. Without the fix, the included kunit
test will fail as below.

[  +0.000234] BUG: kernel NULL pointer dereference, address: 0000000000000010
[  +0.002516] #PF: supervisor read access in kernel mode
[  +0.001021] #PF: error_code(0x0000) - not-present page
...
[  +0.003845] RIP: 0010:xe_evict_flags+0xf4/0x140 [xe]                                                                                                                                                                    
...
[  +0.002604] Call Trace:
[  +0.000934]  <TASK>
[  +0.000789]  xe_bo_evict+0x40/0xa0 [xe]
[  +0.001480]  ? ttm_bo_pipeline_gutting+0x71/0x180 [ttm]
[  +0.001889]  xe_test_dmabuf_move_notify_no_resource+0x182/0x440 [xe]
[  +0.002149]  xe_dma_buf_kunit+0x387/0x580 [xe]

I can include this stack in the commit message.

Looks like the issue is there from day one when this xe_evict_flags()
was added. So, I can add a Fixes tag pointing to below commit
"drm/xe: Introduce a new DRM driver for Intel GPUs".

Niranjana

>Matt
>
>> > Signed-off-by: Niranjana Vishwanathapura
>> > <niranjana.vishwanathapura@intel.com>
>> > ---
>> >  drivers/gpu/drm/xe/xe_bo.c | 6 ++++++
>> >  1 file changed, 6 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c index
>> > cc78283b702c..12e523c61c1f 100644
>> > --- a/drivers/gpu/drm/xe/xe_bo.c
>> > +++ b/drivers/gpu/drm/xe/xe_bo.c
>> > @@ -340,6 +340,12 @@ static void xe_evict_flags(struct ttm_buffer_object
>> > *tbo,
>> >  		return;
>> >  	}
>> >
>> > +	/* No resource: nothing is placed/mapped, so there is nothing to evict.
>> > */
>> > +	if (!tbo->resource) {
>> > +		placement->num_placement = 0;
>> > +		return;
>> > +	}
>> > +
>>
>> LGTM,
>> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>
>> Tejas
>> >  	bo = ttm_to_xe_bo(tbo);
>> >  	if (bo->flags & XE_BO_FLAG_CPU_ADDR_MIRROR) {
>> >  		*placement = sys_placement;
>> > --
>> > 2.43.0
>>
