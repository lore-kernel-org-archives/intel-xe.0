Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C06AEB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 20:48:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224FB10E685;
	Fri, 16 Jun 2023 20:48:38 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B6D10E685
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 20:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686948515; x=1718484515;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vYH1AH3gh2+mpilS5pDj22V/zTFju6WfItBK6S0+qVI=;
 b=ZZ0/dAnVsjDPSKuarSvgPYkJybZLU2UxWdqzTzPFYxmuy8ETUa4dJnWt
 tDgH8sBUWvPORfkN27y6J6rdzPpJj2spwHuNLNQ4PcZNoVuW5JXBx/FU0
 OKEaPjcqiqzngWHtE490KMLrDrQtpEHSj5ysbVrHTcB5mHq0MsxpfBz3p
 kKNE9esco5Wi5alyXbvCbEBzYWLmOFJF0h1nBtK4GD0niGbakloC7lrKE
 OSXskNCIrZlLNkIdn2cipoH1gqofBBCQp2uJkejN9pe7DZsfAyQ9FFoLL
 ZCfQXV+b44lz634Uu/R76qBC+O4fAfRuYTX8UqsspidA8eAB2Qg5Z/0Rz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="344047621"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; d="scan'208";a="344047621"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 13:48:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="742781300"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; d="scan'208";a="742781300"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 16 Jun 2023 13:48:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 13:48:34 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 13:48:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 16 Jun 2023 13:48:33 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 16 Jun 2023 13:48:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TI5dFmyy2MxnDG4kyw/qCJPDHYPbsLSnyIuziFeW3dI2lO0gK3jinCyvpxPAiDeGf4dFkSDU3pG4r7gDoR5HHaoUwVQ1qnhMVVEsyBtALsshYOxzOsqCgW15i4RpD+wr0QURgyfh/cFQZqSt+3CNxxoF2CRFlgxhKlt+K8N+akDBq6I7ZICTCwNMgT9fFzwHqgBQwU+AuCLUVdjf8uRcRb/Xe8C/ksC9mD/ch5HnBPQs2ehMXY7nebJl4JlvI4FWKxqMDkUNcBnZatROefow7nkUu/wD2RzSWyZw7OrDq3eQDYMIgdk+S+UTxSKsSWOnu/VrhkR/ev/xpAMTJ2Qd+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTcwo0P3f3ACFRixojtdPnKG7agEBJt8lRAMl/eq7k0=;
 b=aNdx/NbDhCfbH20J+oex6PeMJB3kv7MXNob9gZ1seCmjUDRFi35mHrsbCejh++jX85hWYqCy2DKhKpcVSajyDifgBCXJYsv5u9CZHuNI+W4LhXLm/CFMOIKJ8qWiBmtP6plWJG2t56O8E+hT+n9hZKdvBOTnxCe9h0+J+kP9CR/m1y6jCjRaj1U+nxn5t9EJ/eV4Cq0RvMMeALNKKuvy8PaHhBagyxwfpqrIYihTgRnrSX2B5FNc5pGPpHZzBw3sqnxlM6BhpbRuWPCMbETQuWGjjXRRsuntlSV8zPs0TMHSU9EW5+dOyNjkE9HOZSbesTpxlKz+iZupV7oHcE+urQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6848.namprd11.prod.outlook.com (2603:10b6:806:29c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 16 Jun
 2023 20:48:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 20:48:31 +0000
Date: Fri, 16 Jun 2023 20:47:56 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZIzKfNQjRmy5r30C@DUT025-TGLU.fm.intel.com>
References: <20230616095504.17084-1-thomas.hellstrom@linux.intel.com>
 <20230616095504.17084-6-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230616095504.17084-6-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0205.namprd05.prod.outlook.com
 (2603:10b6:a03:330::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b4cdd23-7bdb-454d-2740-08db6eab0b6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UkhEmLv966rwnNKjFNFbKgI1CZKAoiztz//4UEfhsr1M6vCAZMNc2Nb87hokDjpn/3aHDqWhNgT37RFnb/bs/n2jj1Ne6+rXCpjWhfJ6ksdEY13zsGr3131HFLzxyIJUFAvb4iRSsq0hbkxvr80a8PXE8bQaQOo5xshaweMq5RWkU+M5UrhpLTWe3vROzI7Hw4qKwsJjH2a2vLXWM6jzWf5BIaOP1pgLImDFwVzsxcrykUTKrK5yO6UkkqFHHoEPIMtrxcnvebPzBSnNo9PfyGHDz0wgJd0EmGiGWp5TEuGrybCslzjJ7WdGZahLA/q9lQBsXIgbQI/HmHm/+Ev6UbYEFx6gHnYL1ys6RnOOvcPaZDHo6K8ser3bq7QOKh74fYtVurC4Jj8h4gZWH2PBoloQCrD38TNGOWOhKq9a/q1VvrVuhE0TlQFbqldkABz/RDNs7Hmhphm7/RFlvQf3LH/O/xeqEyJfREe/J80Z0CnQgtvRSRmcoGIFbfWVl+r0wPeYXLGgIT4IPeE2ANqBI0fyrpcwVE3I/IX5tBVHHEWdf8t2fwd9A2dbeWiFRt6g
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199021)(41300700001)(8676002)(86362001)(66946007)(66476007)(66556008)(6666004)(6916009)(8936002)(6486002)(316002)(4326008)(478600001)(44832011)(6512007)(5660300002)(26005)(83380400001)(66574015)(6506007)(2906002)(186003)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/2RkdYI8hQyLkFMfehUzKLh/ptS+YgW8r5pPsa4aWDRAHU2Rf1UNYSf/wA?=
 =?iso-8859-1?Q?74nzfmbV+Rjs9+kNmhTJUa64adMk8GOiZvIJhmq03my7ZPZSXGf9p0zfj1?=
 =?iso-8859-1?Q?47XIXNwh5vykA1C1WzsLfDMzxyJYtDupBuJ6qcFIvi2VZGswcxjYX7J24t?=
 =?iso-8859-1?Q?2mfvFRT0nTG8+EuWyKvy3ZbcTczTw6ay72WEYZGQIEiaVSMqnU4aE3B8vA?=
 =?iso-8859-1?Q?LCowilPw+2l/prJvZl5MlDP03mIDcHsTIDpQ/dEtZE5omELU5Tjfq2FW+g?=
 =?iso-8859-1?Q?puwJ2/KUVSl67iCF8ml94BWa6s3wEMe4UagG8rYdMZDU8xqCXrnlKSexDU?=
 =?iso-8859-1?Q?qvHmllc7adC2THJLOpeC7IDqfi0mt90Z0HkZB0ryQ6EdXpufr3LIBWVuMj?=
 =?iso-8859-1?Q?MX6K1qWhtC23/WWkcOBNTGZFqr9mxQng+uiMCgXrZW/EN8uxbMTq2FNaXl?=
 =?iso-8859-1?Q?Zat0yKbuqmXB5Nzxm9crEMCfdPcZVHJIarS2dn1jTVEry7pDqCEM4tFste?=
 =?iso-8859-1?Q?5KdxpLuNJO3USQGdJwrmb0g1UyJ6BtGB+1ay5zIH+sAPqia0cSZ1OGBVQi?=
 =?iso-8859-1?Q?7pTiKsikxK31HtRJDhae2B69ieWv4q17hbr+h0XKHAvwUKnanRy1Rzp+Hf?=
 =?iso-8859-1?Q?pOQYI9bE7lBMsau5uuroLDnj23LgJcqEJleJUYcRk0o1X9vt2cH41zrCuu?=
 =?iso-8859-1?Q?/yX/tVXmIizPhlGlO6SQzZOPZSZoqOfu6dDpgxlXaDk/PtLJZE9p1DJFyK?=
 =?iso-8859-1?Q?rYSeb9XxWGxCYbvy6eyfWLya70QxKKMkCikysjnLzmZ0mdQWlnkwkKQLBO?=
 =?iso-8859-1?Q?6REKrwqPKaHDiPfO2YPyAYSlL5+kKzENIgtqWEgkqd5Hm/BvcQqLoXSikc?=
 =?iso-8859-1?Q?MUsa5zj1SnVaH6kx7R72FFvbaLhdyuOLgkvvFkfsfFxQGZWrhg8NKPPTU3?=
 =?iso-8859-1?Q?kSWf0HdiBp6ky4g2PmmrWgHSypZl6/ukut0zfd0XsW6JHgGlfIQgwDQ9Ju?=
 =?iso-8859-1?Q?X0AH73FPJpENAQjFEQFb6iTOLe7OwlGWKDGp3busTpWcYatQiSf/J9z7NN?=
 =?iso-8859-1?Q?f7IQJlcddBQSSTekpHJ5q16n65Mds+1VWpDEwQC0StqqbTLDuPjnZL+kve?=
 =?iso-8859-1?Q?nH7S19VFOcSG6wUJcPzj1EgGhUzCGVJTLlgXMoOhfPZ4dYTevRjSy/S8dR?=
 =?iso-8859-1?Q?j+wFmuWVr6mg4bj22437JcFsBC6uBsSqV32r/TGfoLMbyoy+gLUgJgpHL4?=
 =?iso-8859-1?Q?7e54/Egbob7gRi1dIZxW06gFYzgc1C4vEwSbMq2OpNgJ+uNmNprz/BoDlo?=
 =?iso-8859-1?Q?rwMJNXcqdBpXTLx94b1K4YF/IFyGJf9lWghrLeBI7/wyQyQm2R8jpY4vBY?=
 =?iso-8859-1?Q?JfgvrBDvecWmbEP/xOP9XCivn4Q6O78AoGGuVkgeObLxdQ5XycwGJn1yMx?=
 =?iso-8859-1?Q?ln0TKlO6XUZmgpNg6NvUrF3iM2KsD32eJsIF77ygg79N4wilPKP055TKaC?=
 =?iso-8859-1?Q?J/fIRJbBFIIq90q0L7V3tKjqHx+NYpj0sT92bDaODVIGr/WYVbbdl3RIPU?=
 =?iso-8859-1?Q?1CnQaAsJmauCqX3AGJrPQx3inmXz9gTKNU998o4oPIfKcy0L3XM3IsTri1?=
 =?iso-8859-1?Q?Y4soz6FNs7ykdtMcgZ66p8OcbgyKNwNqAC5SEugc7RfoTONicolHdnPw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b4cdd23-7bdb-454d-2740-08db6eab0b6e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 20:48:31.4533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 65HfRa+n001W36OACMz6+V5tSx/eUPyNoRQXfLItkYGqVX6IrpaHcTIG5bl3x19wCHDRAypF8J4bc+lDA/buiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6848
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/6] drm/xe/bo: Evict VRAM to TT rather than
 to system
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

On Fri, Jun 16, 2023 at 11:55:03AM +0200, Thomas Hellström wrote:
> The main difference is that we don't bounce and sync on eviction, allowing
> for pipelined eviction. Moving forward we also need to be careful with
> dma mappings which can be released in SYSTEM but may remain in TT.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 77d5c5710688..fd41114f2dfb 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -40,6 +40,20 @@ static struct ttm_placement sys_placement = {
>  	.busy_placement = &sys_placement_flags,
>  };
>  
> +static const struct ttm_place tt_placement_flags = {
> +	.fpfn = 0,
> +	.lpfn = 0,
> +	.mem_type = XE_PL_TT,
> +	.flags = 0,
> +};
> +
> +static struct ttm_placement tt_placement = {
> +	.num_placement = 1,
> +	.placement = &tt_placement_flags,
> +	.num_busy_placement = 1,
> +	.busy_placement = &sys_placement_flags,
> +};
> +
>  bool mem_type_is_vram(u32 mem_type)
>  {
>  	return mem_type >= XE_PL_VRAM0 && mem_type != XE_PL_STOLEN;
> @@ -225,6 +239,8 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
>  	case XE_PL_VRAM0:
>  	case XE_PL_VRAM1:
>  	case XE_PL_STOLEN:
> +		*placement = tt_placement;
> +		break;
>  	case XE_PL_TT:
>  	default:
>  		/* for now kick out to system */

NIT, you can probably delete this comment now.

Anyways:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> -- 
> 2.40.1
> 
