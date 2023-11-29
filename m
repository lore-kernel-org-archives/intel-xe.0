Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F89C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 16:26:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286F610E634;
	Wed, 29 Nov 2023 16:26:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAAE910E634
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 16:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701275211; x=1732811211;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Qdw72r8IZrBCnhSbjBITkNjwWLPnFs1AsbsEGhLb+y8=;
 b=LmFWR73iLok6qm/q3NAjOQiGdRpSv4qQa9Mjg685mu55dNAiwSfaeHSM
 1ihIZs0lZ03djfs+ctopvxmv+ZQxgU1TnxrLv3UZp1USjWNtGLmBq5kZp
 pOU9Xa/c2VtAIw1DH31BRjqAyDcsxysIiVDfHdfDd1+ZBrHri5Fx65GFZ
 g+F8ekd6NMailYMe8/sKWXiLlHdYmPkIihXAkOi2cmmfnT6Sg0tuBYdK7
 DinfyRjVe120SGT15mW0hTa82DVnPumgRPZUHGlk/oGkWJnWnEaggMWnA
 xTRmxLG/8GU2A1+h06Wy1m/PwnwSGtrc2mwPSq7pIn1YRvlEE3weu48+p Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="392054877"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="392054877"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 08:26:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="1016321021"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="1016321021"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 08:26:51 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 08:26:50 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 08:26:50 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 08:26:50 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 08:26:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLo+NNLM0XLkpjjH1rI75XShJPC6wCb8XClqAknWABMos8s5cgCRYrGh0TQRYrAR5cSe00U509MN22k/7GhLvDRpBpQ+WOBoocnlMeViaqVKKE5x4fHQKClma6tIokQMVttMA6tiOJ7kgMYBvJfe0Rklq2btoyzQHGDBzQT0YUzSgsCUg1tUgIuXh5rjpwhxla7GRawNc7bk+muGIZlA5jvJj7bvxYRh7v+YeE0MgzsS00fLUdqDHkuObOw+MR5Vktl5ciliO4YM/zk6drltnsSC/AcxfAhNWgT6tawKmA7Ue+dOlts3FLuk2qdVKHVJ6TWN5PKx0bdCAgUr5yBb4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dCmKqAfnj3aAEiJs0VzV/5CVrs5LPq6wQ3KW35o9Ks=;
 b=TwjDqnN3HHUbbFIhbJXVVtl67niQ0f/hc3xBFrDXeY+RLiz8Ks4zNUueS4M0Oi5w4xxmgYRIYk7cLKC4+SReUzi9l7arnjefegY7gLGAhTlpMuoPBmf++RYGcTdgI//zTN8r+1zHQMWJ64NlihNCcbTNt4XBcEsq9+KcUsG3IvpQkZXejKAJz6vxCEDZ3GKgbATRO0uVlY/sNzaJlvxUvmEd6vdiuwgnZm6s1KabKWiY5Bt86QUR/rvJpeyQUnz9VIUYsYi5rrg7v/6J3O4pxGS7es48DJ7tw/cJ9YyQGrWGg0BtXETbqIB612vYK+4c59av7Ph9ZyYtwbG63nynlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8139.namprd11.prod.outlook.com (2603:10b6:610:157::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Wed, 29 Nov
 2023 16:26:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 16:26:47 +0000
Date: Wed, 29 Nov 2023 09:25:11 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <ZWcDd28sOXpx+5mM@DUT025-TGLU.fm.intel.com>
References: <20231128203203.1147-1-michal.wajdeczko@intel.com>
 <20231128203203.1147-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231128203203.1147-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0019.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8139:EE_
X-MS-Office365-Filtering-Correlation-Id: aae869d4-9985-4c66-09c9-08dbf0f7fbda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W+gkaHgMwIr44LyMIvN2NkWhVX2TSPHDW5DhgPAy8rlbkFn4TYRvT+3nQUAfF/qvg49hRIlVzdX4Xs0Yw8G+o+z+nrfYUCqpyvo5GtkPzcpVd3oGAmKnmbeZ8cx4JHQA/S+xKxb9MCWwV3EjWhFTQ1DU/kVcKYOYXCrdKdXo6p4OMf/NvpCVk6hnryR4KgJpUJPh+NhEgS8BeyjUg79UHwuQFjEzgA9EhoWDSA34IAqKDGYzo1rXq/5NsbP2KOUEvmChf4aohhq1R0gBdV5YC3HG1jrCpRmSoRs2Fmw5po4tDcKVAJy1DJExItmIRiTG6tR/und0qbG75PUC2tAd55OgwLyU7QoDR91gv83e6m/9SvEyeUbV+ebhiFk1pHSGva9UdmG2GUomR3gT4Cf+yhbCYyqnjeSS2oDLdPtunTo3zmz1Vd3bSlTMMFmx5nC8GkU+YzWUp+1ycVMyf3Xl1QfGGNJZoFreY5DQ2Nu75uZk+bNe7A+/7DdJUBMlZtERypljiR4oVF5uoUj6z8rFcUVRnCRmosYGvWL7+GPgKZr/TkfMol0z0gcRoc1X/1Zmj8uA3eNogvxk4/SDYodI/vzyVwf4oDOYq+Uf12DRUvM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(478600001)(26005)(6486002)(6666004)(6512007)(6506007)(82960400001)(38100700002)(86362001)(44832011)(5660300002)(66946007)(66556008)(66476007)(6636002)(41300700001)(2906002)(83380400001)(8936002)(8676002)(6862004)(4326008)(316002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gMvy6/0VY/9A0N/2mnuxLBX87SRyeUHJiqlUsLLLM7R8f4dd/lJOZe8iNuxa?=
 =?us-ascii?Q?YAdIgO8N4g95TmI8NgeNBXzv+fFoKVIc+Wybgn82H8As3tNl5ADtRteU7268?=
 =?us-ascii?Q?r5xlgx54jq+HJNPPhrBTy8bj5w0Urh62jzZhB1DTdYkN3KP7930nVmsY/+Va?=
 =?us-ascii?Q?TGeWcCcATCtIfB7fFNCqnKauMM3Cz655NGoGiBYFTtJgUVG5rnvOfjRv4+Tm?=
 =?us-ascii?Q?MmaMd1pt82JXYp+ANTg/vm9BRiMn0WVT4hu+RHnlsDF64W57ptBTDeNYBZAr?=
 =?us-ascii?Q?MW3DH7IL7JZrNwVwzjTRB09eMQ1I8L1ntHmIjhUy8JbGBCeXFHkFXKm7MomI?=
 =?us-ascii?Q?XYpxATikzLAGXKkZ64qfTu+m9cZSmbad+JTtM5htEMf11nij5lMFmVVjHMgJ?=
 =?us-ascii?Q?f21ySLOV7HoQ/W1kVvYTQ964E3DdusSyq5oM3yxVunarn2TkmBK/jyje+Kw9?=
 =?us-ascii?Q?Mx/qw9FU3HTCGtVJc8JjTT0a4DhJScaa8dOzMB5PQ8ixf4o72M+0OvphbRhZ?=
 =?us-ascii?Q?K9LLYe4bb8PwQtvPVjWhn/po6wh7FAG0uUhrzRx/XONBHZDBSTpr/DsqvsXx?=
 =?us-ascii?Q?GKfBmODOfeEPjox4NQBu06N0mFuls784Ja7j0fJKpVw8S4biONjJ6I5/25YR?=
 =?us-ascii?Q?cBajZLaDkyob2ZXxbSm8UVVTPoBh7WMpLRjOyO8ladcQ12ESBihk3pjrVyae?=
 =?us-ascii?Q?cQU3WCxKV6K1E1vGkshgm2Ufp5+pjCP/Y8yth3ce2cgnC7LZ6h22Kp2yuzgs?=
 =?us-ascii?Q?yZrqKWeXiG965SypK0/FLojraQ6FGT9okCI/a9BnRoaal9InVxLdKBqec3XP?=
 =?us-ascii?Q?A5ta5K1rnLX6ozVXZSxmeRpecxTtvab4oaBrERf1JGns6UkSyPIqvowA32t+?=
 =?us-ascii?Q?iUgY0Up75eOA/ykF2puugspt/gAgVldHKlnxkSOh1hFO6g6SRDavKLTeQXZQ?=
 =?us-ascii?Q?D7G5dPE1+14P7Ay90EgumLYfM0l2p5obH7bp6AWPTW0KZoL89djvwrxVU8vS?=
 =?us-ascii?Q?1aKmNfDoPJjPHPBMVnaBwLiBDjd28Z4qIDU2sm2Tl2Vkg2/sJoFgl4uiMRWp?=
 =?us-ascii?Q?9gZ/9Wsa4ONm6ffZO8R91wswZ8VQc0FQ8eAZ0dWGBQQK4rSfuqFGxHS0OTot?=
 =?us-ascii?Q?f3b4TtvrOIG4teNHfwdEPyZtZuSuZFa5u783TknLg2ZOARWULfjTHiXoPZYg?=
 =?us-ascii?Q?nFiofWJl40loEqUE4e9ts4LHwcZcMrHgnEhq75Qn55LdX/rGsL4aa5DhZ9W9?=
 =?us-ascii?Q?jVRany2dz7jaEzC//5mErKEPk76NNbcqjuKl0nyPbpORYlt65JuMsrFt2v31?=
 =?us-ascii?Q?l4Ngt91+aBYZDnrM1Dx/g4xYNHXw9OjdgFLZaAAboUMKCKE3FhX3ySwyQOFW?=
 =?us-ascii?Q?JBtDO7bx6oUFeeTRkBt93DoGcUo6kLeaL480WimZT9a9zsYptFEphb1eg/bi?=
 =?us-ascii?Q?lDpa2XcET2Q9lsZf0Qr17Ogj5tsV+jYLGhxzLltuVVAVPFA1429zV786DwXd?=
 =?us-ascii?Q?TPyB5fmgC13W0T+v6bYULkI80VTzLIFgNKg7Vndw23hj6Qm/5n/OmdHrAok4?=
 =?us-ascii?Q?5VpEXyV7lxMmJu9RQlSF2Ryf5s6B/H/mRyZlkMW51/phzx0FNm4jYAsLoy9U?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aae869d4-9985-4c66-09c9-08dbf0f7fbda
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 16:26:47.7196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9KhXzn1CBjYXkBgQU742YcOvox0IKwmpzomhipfCILG+6U/AUSBkRJ+EknwiEgbryKa3TNjxZiRj7KwVt+CcPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8139
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe/guc: Remove obsolete GuC CTB
 documentation
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 28, 2023 at 09:32:02PM +0100, Michal Wajdeczko wrote:
> Refer to already described CTB Descriptor and CTB HXG Message.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  .../drm/xe/abi/guc_communication_ctb_abi.h    | 45 +------------------
>  1 file changed, 2 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
> index d34f91002789..3b83f907ece4 100644
> --- a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
> @@ -120,49 +120,8 @@ static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
>   * is based on u32 data stream written to the shared buffer. One buffer can
>   * be used to transmit data only in one direction (one-directional channel).
>   *
> - * Current status of the each buffer is stored in the buffer descriptor.
> - * Buffer descriptor holds tail and head fields that represents active data
> - * stream. The tail field is updated by the data producer (sender), and head
> - * field is updated by the data consumer (receiver)::
> - *
> - *      +------------+
> - *      | DESCRIPTOR |          +=================+============+========+
> - *      +============+          |                 | MESSAGE(s) |        |
> - *      | address    |--------->+=================+============+========+
> - *      +------------+
> - *      | head       |          ^-----head--------^
> - *      +------------+
> - *      | tail       |          ^---------tail-----------------^
> - *      +------------+
> - *      | size       |          ^---------------size--------------------^
> - *      +------------+
> - *
> - * Each message in data stream starts with the single u32 treated as a header,
> - * followed by optional set of u32 data that makes message specific payload::
> - *
> - *      +------------+---------+---------+---------+
> - *      |         MESSAGE                          |
> - *      +------------+---------+---------+---------+
> - *      |   msg[0]   |   [1]   |   ...   |  [n-1]  |
> - *      +------------+---------+---------+---------+
> - *      |   MESSAGE  |       MESSAGE PAYLOAD       |
> - *      +   HEADER   +---------+---------+---------+
> - *      |            |    0    |   ...   |    n    |
> - *      +======+=====+=========+=========+=========+
> - *      | 31:16| code|         |         |         |
> - *      +------+-----+         |         |         |
> - *      |  15:5|flags|         |         |         |
> - *      +------+-----+         |         |         |
> - *      |   4:0|  len|         |         |         |
> - *      +------+-----+---------+---------+---------+
> - *
> - *                   ^-------------len-------------^
> - *
> - * The message header consists of:
> - *
> - * - **len**, indicates length of the message payload (in u32)
> - * - **code**, indicates message code
> - * - **flags**, holds various bits to control message handling
> + * Current status of the each buffer is maintained in the `CTB Descriptor`_.
> + * Each message in data stream is encoded as `CTB HXG Message`_.
>   */
>  
>  #endif
> -- 
> 2.25.1
> 
