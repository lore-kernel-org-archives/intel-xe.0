Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E7DEB64DC
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jul 2023 18:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9045410E2A6;
	Mon, 17 Jul 2023 18:51:11 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 244E110E2A6
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jul 2023 18:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689619870; x=1721155870;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=E+RNZOTUxZlIDA3spIhaPFCwWyW2ueEDevjVB6HFFj4=;
 b=e832zBoeQ6mruw8/2MMr7UkG4b/kQMGdaJLXrfSQCTPKKr2fSeOZzrh4
 9VY+Z3IfHL3s+VpNppL8xlvQqce1SEJZRlSad17m7T8nQ/yJXTqtHeEOL
 yfUq7CV1I2PAQcNzJlhDskLJ1+9C2GGQU3BV8oXde2QqBW1f0JCiReVAr
 R2t+BDOz+lUgqXmZJljRbIC+njXehe7Ll3pgHVmAamJ9rEwev4mEEmXJN
 sk8OQhWTPfapKZmQNtq7B03Q6DlWQ0a1KcqXD5is660v88w+KMDjoIVQi
 Wz3T89BoH+Xv7HeypVXbZ7eoqo1ralMAE6+YqfzZFX2std3xd1wBG9dVY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="429773299"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="429773299"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 11:51:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="847407795"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="847407795"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 17 Jul 2023 11:51:06 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 11:51:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 17 Jul 2023 11:51:05 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 17 Jul 2023 11:51:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWA0fjzJTmhzElzf/ZiB6FPEsI+8+0pRK5J/Hl77bYiCvAhBxBKMNtdFFG6R2BWla7fVJULBywhrLxmDjKSxiXjQvh8lFQuAwnkkY4HVHuHejqI2X7bxykkOAlSDHzdyT9jk18TennhbVW1J7792uJTpAqGeM0pQRwtzxRUX1XFk5Tiwz9Jx/OS7xYWW3GZME+brxROuqNEddYsa+nRkKkgRtOU0yzSpDNrt0D3MaZnD1UHCVMlceyJPK2JwixdV+WyNS3fGwJPZZQmkzMd+671zaJbzwihzXKqmc6zFYsOT4pSQwXEfuFW0abidBxtZyszIcghzv09Dfj48hwlWqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2gDMng/Q8vTcRDahDCYcsbyz8ur3JJQf+t/OZFPO54=;
 b=OgkDLqTI9ec/5J/kDJvI6UdKeAT2rytmgNnfJL59sAvoi4zcUNdhehYwzGdgDNOzeYKO0+juAG/3aQY+c/3ykjLZ5iQhvnjpgfamsCrFWEgfhAVaPTaNaDiBMnC8G0Nx+Bj53xXFr4fDWCv9k8Wr6VRaR78iX0Jev+HiOiBrfqNO2vYimdi4TPMLEd1UPxXj9ND+yky50NMP/TR4rx7QhgizWWy5TOwA+eRYt8nKi1NwdytAKMwCz3Nvd3zUJdXqoZ+UTGswQHWPAaBhhEfKNTRBjz2dc2g4zqfdONAVBZ/IDqw1SDZ7K3u75fs9KPwBz9rgwSF4UI4z9tJUiytqkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6091.namprd11.prod.outlook.com (2603:10b6:930:2d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 18:50:56 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 18:50:56 +0000
Date: Mon, 17 Jul 2023 14:50:52 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Message-ID: <ZLWNjHec/5B4UuUd@intel.com>
References: <20230609073713.7-1-francois.dugast@intel.com>
 <20230609073713.7-3-francois.dugast@intel.com>
 <CAFCwf10La4gW_UCQx8i0ccuSMrnCa+UAwiGSD0TqUO34XR0pHA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFCwf10La4gW_UCQx8i0ccuSMrnCa+UAwiGSD0TqUO34XR0pHA@mail.gmail.com>
X-ClientProxiedBy: SJ0PR13CA0101.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6091:EE_
X-MS-Office365-Filtering-Correlation-Id: 161fad72-8495-41bc-6a31-08db86f6c11b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6N55+TjDZWIgXbGpFHrSo9vQa+/DY9tcDXeGrB9KfZ2ROjUhEmMZTW2Dzur7rfzda6GK5mf6gyl7HdgW/LXVDI4hoJTWyg4GdmJ+GxN3bHQOeX7khVXa0G/ylRzRmEz2LoeLtIDjLQxXh4zL0WxqopQjnH/jIXfSACQ6T+Si6vygqKd+AfLf07ZN+q+VMqSYBYchhrAzOmO26zddfWtlqFz2NCH8gIpGS0dv8+wdwAU0uP1P38s5WA+McKstxLQzHjFRMCDY6oRwZiY2jYvKDx4+dzqQvnCles3ZLR3R2asB1FFx1MIuUOmIm+9AfxMVv1XUix9SmA1LeIkowIP1i1arqekW7qsxZcb9j9gwuv5mcfMoahkQBHfQwSi84iEMq+aK/jwWBZOufzqde6rht2MuSdtaxUo62nvjzke4oCMFDuJvuncb4pM1ksyPKJZ/x4PKs97XXIv97yIzjuEf8lqKR1e5PcRBMoEb14h26ue0aWHQhob2yawMro1yJZ3CFyE/N22DnhbIpEin6ZQFUagzOn8jOrORyS9LQTGif0s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199021)(966005)(6512007)(6506007)(53546011)(66476007)(36756003)(38100700002)(66946007)(66556008)(5660300002)(44832011)(86362001)(30864003)(2906002)(316002)(4326008)(8936002)(6916009)(8676002)(41300700001)(6486002)(26005)(6666004)(478600001)(82960400001)(2616005)(83380400001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGRWemtHWGc0bDVZMG9EWXlmMVNrYWtPaVF3ak9YZHdNZVJzZ0NET05SVU1k?=
 =?utf-8?B?cWNUSWNWMENpSk43NTNaS3hPN3BzTUZ3d0tBU2FPUFlhNVUyb05nRDFvZTRj?=
 =?utf-8?B?Z0dsaWVlUnl2YnphNFRVL3hyZm9PWG5CQXBYdW9TaGJlZStpT2tUTGNlU3FC?=
 =?utf-8?B?SVN3Zm5Sa3VxdkhidXl0WkJCb1FXMkoxZFNGaXpwTExDaWdJVjR1ZWd4STZ4?=
 =?utf-8?B?YVN3K1lkaklXdURZKzk3eE1mZnVHSkZHcmMxK05PZ2VLN1dLYzFtYlBocjdy?=
 =?utf-8?B?ZFowOUE4ZjdKdDVqVW5kWTBqbGhkbU1XdXJCeUppSXdyeDVudll3UzZXcndk?=
 =?utf-8?B?RFloMzBqR0lpakFmbkU5K3VaLzgxMzFGaEhRT3d5VTRRZjRGY3dGdHJXWXdt?=
 =?utf-8?B?ak1xZ1A5bVZGQUdnSFpERnpFYURia281K0F4UXVySGlaMGZ3eW1tcEdOeXlp?=
 =?utf-8?B?TVFUem5zbkJQRnY4eGh6L2ovM0ZIWDhtTmdYWGlPMFlxM3R4UmxJYW5maEVn?=
 =?utf-8?B?aDlpcjBJRG53cXpHN1lpSmJybEFKT3BFRHViNUZRL2ZXbGJ0K1FwekhTcU9v?=
 =?utf-8?B?eEYwZFpjSUt2UExXTjVzTmxGRUw1dlJVUkxkZFlZU0p5UEdjR2taNUF6R0dI?=
 =?utf-8?B?SU5vd1QyRC9nQ080TkVTWENJTXZ1K1B2UnFuckU4VWJvUVhYSUFLNFIwMStE?=
 =?utf-8?B?clBZVjlKRmlzUTRkRnVOZzhnamErbFh6dU1TZ2dickdrUmJPbWpNaFFRT1BX?=
 =?utf-8?B?SGV2eUZobGNvNDNMNmthcG9uaEcwNzl1Q0R6VVEwSm5XLzdZb3NnTW1yRDNE?=
 =?utf-8?B?WnEzSmI2K3R1YytYVVVEbFU2QXcxS1RRdDIvNnpRTjJQM3J5eXN5NjlqcGxy?=
 =?utf-8?B?OWdHaVpxQlNhVkl1eVpybmxIVUhQOWRsRnROdUFPRWZtSnRQR2Y4RkdLSzFT?=
 =?utf-8?B?N0JIbkN6V3VCQlIvK2FrVmJpMUZoNjhWNEViU1RtdVQwSEltbGVocG8xUCtk?=
 =?utf-8?B?L29aOFFkYWFWV0FwTFFxWjFPZ3dZclliWDFYRGgyWU9rU2pLR2xUdHNGSUp6?=
 =?utf-8?B?SFhBV3FXRU1tVHpiQm1rY1NQL0x1ZXVhdFBKR3cwbkZYU1BZOEp6RUhiS3Ri?=
 =?utf-8?B?MmptSTdqMjBBSXVyeHJ1dS9pVGs4TlpOam1kSUlrZmNhcUtwOGxWb0FZc2cx?=
 =?utf-8?B?anptU0tTN1M1QTM5Z0RpR1Y0eXA5dW1CbThyTE5aM2QwaWp5Z2hiL1BKajh3?=
 =?utf-8?B?bkZXQUtOTTFVTkVCT1EvR0VMbjV3cHRRTUFnZ3E0QUtxYUs3R1Z4Wk5zWEhq?=
 =?utf-8?B?bHBEKzlxc01CNUpwWDVOSkI1SG9sSXRqVlFJRXd6REpPSHdldU9PT09xa3ZK?=
 =?utf-8?B?VE9yZlRFRmVYR2dWdUhNK3h2bGpuREV0SnhuSmRITGVCaFp2a3JtVGNQRWVD?=
 =?utf-8?B?bFdwRnZLb3BEeXJYd2x2M25uaEdXVjdjRFd2Tm9DZmZKY1BkS3lFNmYvYkIx?=
 =?utf-8?B?TjYzeitiQ3Y5NFhYeWpQa1V1Q28zaGNXOXVZUnBvdmRpajUvd3Z4V0Y1WTdI?=
 =?utf-8?B?VVhkSFNpL0FQcjVWUzBIV1NHcldTUlliVWtFUmdyanBFckFwWUV3V0VvbFRX?=
 =?utf-8?B?eXVEZzFsUWJGc2Jub0xFQ1QzS3Y5SzA1TW9RVnJ3ajAySy9WNjV2bXNiMWl2?=
 =?utf-8?B?OVBDa0J2cmdLS04vbENHYW1McjVOTEJ2L0c1STZnVjJNTXd4N0dlVHBUYzBp?=
 =?utf-8?B?T25MZWNFYjdBeTBoaWx6T1ZMRFhVTG1qejUraUc1MGRtSnc3d0EzVTFNWlUv?=
 =?utf-8?B?c3gxWnRzbHJWazN4KytVczVWL3Z6dC9LNUZOcjNyd2tabUdRVTN4anZOOGRt?=
 =?utf-8?B?OExvQjl2MDJMWVVWZFlQSDdCSTMvbjdqRTlmNnY4Z0tManBYcjlWU2VoT3NX?=
 =?utf-8?B?RTRLSFNnVnRMRjhEa2o0SUs2YVg3WkJTRzh4UmlZTndLNnRCamhiSU5HdmV0?=
 =?utf-8?B?ZWlKdVVCZlR3SE9vUzVZRTlkMzNjMGczSStaamhLNU8rZGNVd054a1hNbE5x?=
 =?utf-8?B?TWwxcUJsSDN4eTYxdkFHbXp5TU0yTUFzdWZkaTNqR0N6czl4djR4QmpZdE9J?=
 =?utf-8?Q?BEiwdOuZ/3NqZ5dVKn/to9GdA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 161fad72-8495-41bc-6a31-08db86f6c11b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 18:50:56.7072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vGLGT1mHEbjLeMNaAbTntDxYYHtW+ho4glUnOZGTSfiKchsR1YaYsCVKof1NqHGw6g4sLPA/jEXMcsk4YABFxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6091
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 2/2] drm/xe: Move defines before relevant
 fields
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
Cc: Francois Dugast <francois.dugast@intel.com>, lucas.demarchi@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jul 17, 2023 at 03:12:43PM +0300, Oded Gabbay wrote:
> On Fri, Jun 9, 2023 at 10:37 AM Francois Dugast
> <francois.dugast@intel.com> wrote:
> >
> > Align on same rule in the whole file: defines then doc then relevant
> > field, with an empty line to separate fields.
> >
> > v2:
> >   - Rebase on drm-xe-next
> >   - Fix ordering of defines and fields in uAPI (Lucas De Marchi)
> > v3: Remove useless empty lines (Lucas De Marchi)
> > v4: Move changelog to commit
> >
> > Reported-by: Oded Gabbay <ogabbay@kernel.org>
> > Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> 
> Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
> 
> I would recommend that you move all the vX: to the email itself as to
> not pollute the commit message.
> 6 or 12 months from now, no one cares about the changes you did in
> some revision of the code review, and if they do care, they can go and
> read the emails.
> The commit message text ofc should reflect the final code version.

Well, this is a long fight on drm vs other subsystems.

On drm we have always preferred to keep the versioning inside the commit
message, for better visibility, history, credits and for helping OSVs that
might have ported some other version that not exactly the latest one to
their kernel.

But I do see your point...

> 
> > ---
> >  include/uapi/drm/xe_drm.h | 73 ++++++++++++++++++++++-----------------
> >  1 file changed, 42 insertions(+), 31 deletions(-)
> >
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 1c7c4b5b920a..08f98def6005 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -60,6 +60,7 @@ struct xe_user_extension {
> >          * Pointer to the next struct xe_user_extension, or zero if the end.
> >          */
> >         __u64 next_extension;
> > +
> >         /**
> >          * @name: Name of the extension.
> >          *
> > @@ -70,6 +71,7 @@ struct xe_user_extension {
> >          * of uAPI which has embedded the struct xe_user_extension.
> >          */
> >         __u32 name;
> > +
> >         /**
> >          * @pad: MBZ
> >          *
> > @@ -218,11 +220,11 @@ struct drm_xe_query_topology_mask {
> >         /** @gt_id: GT ID the mask is associated with */
> >         __u16 gt_id;
> >
> > -       /** @type: type of mask */
> > -       __u16 type;
> >  #define XE_TOPO_DSS_GEOMETRY   (1 << 0)
> >  #define XE_TOPO_DSS_COMPUTE    (1 << 1)
> >  #define XE_TOPO_EU_PER_DSS     (1 << 2)
> > +       /** @type: type of mask */
> > +       __u16 type;
> >
> >         /** @num_bytes: number of bytes in requested mask */
> >         __u32 num_bytes;
> > @@ -270,15 +272,14 @@ struct drm_xe_device_query {
> >         /** @extensions: Pointer to the first extension struct, if any */
> >         __u64 extensions;
> >
> > -       /** @query: The type of data to query */
> > -       __u32 query;
> > -
> >  #define DRM_XE_DEVICE_QUERY_ENGINES    0
> >  #define DRM_XE_DEVICE_QUERY_MEM_USAGE  1
> >  #define DRM_XE_DEVICE_QUERY_CONFIG     2
> >  #define DRM_XE_DEVICE_QUERY_GTS                3
> >  #define DRM_XE_DEVICE_QUERY_HWCONFIG   4
> >  #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY        5
> > +       /** @query: The type of data to query */
> > +       __u32 query;
> >
> >         /** @size: Size of the queried data */
> >         __u32 size;
> > @@ -301,12 +302,12 @@ struct drm_xe_gem_create {
> >          */
> >         __u64 size;
> >
> > +#define XE_GEM_CREATE_FLAG_DEFER_BACKING       (0x1 << 24)
> > +#define XE_GEM_CREATE_FLAG_SCANOUT             (0x1 << 25)
> >         /**
> >          * @flags: Flags, currently a mask of memory instances of where BO can
> >          * be placed
> >          */
> > -#define XE_GEM_CREATE_FLAG_DEFER_BACKING       (0x1 << 24)
> > -#define XE_GEM_CREATE_FLAG_SCANOUT             (0x1 << 25)
> >         __u32 flags;
> >
> >         /**
> > @@ -357,10 +358,13 @@ struct drm_xe_gem_mmap_offset {
> >  struct drm_xe_vm_bind_op_error_capture {
> >         /** @error: errno that occured */
> >         __s32 error;
> > +
> >         /** @op: operation that encounter an error */
> >         __u32 op;
> > +
> >         /** @addr: address of bind op */
> >         __u64 addr;
> > +
> >         /** @size: size of bind */
> >         __u64 size;
> >  };
> > @@ -370,8 +374,8 @@ struct drm_xe_ext_vm_set_property {
> >         /** @base: base user extension */
> >         struct xe_user_extension base;
> >
> > -       /** @property: property to set */
> >  #define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS           0
> > +       /** @property: property to set */
> >         __u32 property;
> >
> >         /** @pad: MBZ */
> > @@ -385,17 +389,16 @@ struct drm_xe_ext_vm_set_property {
> >  };
> >
> >  struct drm_xe_vm_create {
> > -       /** @extensions: Pointer to the first extension struct, if any */
> >  #define XE_VM_EXTENSION_SET_PROPERTY   0
> > +       /** @extensions: Pointer to the first extension struct, if any */
> >         __u64 extensions;
> >
> > -       /** @flags: Flags */
> > -       __u32 flags;
> > -
> >  #define DRM_XE_VM_CREATE_SCRATCH_PAGE  (0x1 << 0)
> >  #define DRM_XE_VM_CREATE_COMPUTE_MODE  (0x1 << 1)
> >  #define DRM_XE_VM_CREATE_ASYNC_BIND_OPS        (0x1 << 2)
> >  #define DRM_XE_VM_CREATE_FAULT_MODE    (0x1 << 3)
> > +       /** @flags: Flags */
> > +       __u32 flags;
> >
> >         /** @vm_id: Returned VM ID */
> >         __u32 vm_id;
> > @@ -430,6 +433,7 @@ struct drm_xe_vm_bind_op {
> >                  * ignored for unbind
> >                  */
> >                 __u64 obj_offset;
> > +
> >                 /** @userptr: user pointer to bind on */
> >                 __u64 userptr;
> >         };
> > @@ -448,12 +452,6 @@ struct drm_xe_vm_bind_op {
> >          */
> >         __u64 tile_mask;
> >
> > -       /** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
> > -       __u32 op;
> > -
> > -       /** @mem_region: Memory region to prefetch VMA to, instance not a mask */
> > -       __u32 region;
> > -
> >  #define XE_VM_BIND_OP_MAP              0x0
> >  #define XE_VM_BIND_OP_UNMAP            0x1
> >  #define XE_VM_BIND_OP_MAP_USERPTR      0x2
> > @@ -492,6 +490,11 @@ struct drm_xe_vm_bind_op {
> >          * than differing the MAP to the page fault handler.
> >          */
> >  #define XE_VM_BIND_FLAG_IMMEDIATE      (0x1 << 18)
> > +       /** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
> > +       __u32 op;
> > +
> > +       /** @mem_region: Memory region to prefetch VMA to, instance not a mask */
> > +       __u32 region;
> >
> >         /** @reserved: Reserved */
> >         __u64 reserved[2];
> > @@ -520,6 +523,7 @@ struct drm_xe_vm_bind {
> >         union {
> >                 /** @bind: used if num_binds == 1 */
> >                 struct drm_xe_vm_bind_op bind;
> > +
> >                 /**
> >                  * @vector_of_binds: userptr to array of struct
> >                  * drm_xe_vm_bind_op if num_binds > 1
> > @@ -567,7 +571,6 @@ struct drm_xe_engine_set_property {
> >         /** @engine_id: Engine ID */
> >         __u32 engine_id;
> >
> > -       /** @property: property to set */
> >  #define XE_ENGINE_SET_PROPERTY_PRIORITY                        0
> >  #define XE_ENGINE_SET_PROPERTY_TIMESLICE               1
> >  #define XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT      2
> > @@ -583,6 +586,7 @@ struct drm_xe_engine_set_property {
> >  #define XE_ENGINE_SET_PROPERTY_ACC_TRIGGER             6
> >  #define XE_ENGINE_SET_PROPERTY_ACC_NOTIFY              7
> >  #define XE_ENGINE_SET_PROPERTY_ACC_GRANULARITY         8
> > +       /** @property: property to set */
> >         __u32 property;
> >
> >         /** @value: property value */
> > @@ -594,8 +598,6 @@ struct drm_xe_engine_set_property {
> >
> >  /** struct drm_xe_engine_class_instance - instance of an engine class */
> >  struct drm_xe_engine_class_instance {
> > -       __u16 engine_class;
> > -
> >  #define DRM_XE_ENGINE_CLASS_RENDER             0
> >  #define DRM_XE_ENGINE_CLASS_COPY               1
> >  #define DRM_XE_ENGINE_CLASS_VIDEO_DECODE       2
> > @@ -606,14 +608,15 @@ struct drm_xe_engine_class_instance {
> >          * creating ordered queues of VM bind operations.
> >          */
> >  #define DRM_XE_ENGINE_CLASS_VM_BIND            5
> > +       __u16 engine_class;
> >
> >         __u16 engine_instance;
> >         __u16 gt_id;
> >  };
> >
> >  struct drm_xe_engine_create {
> > -       /** @extensions: Pointer to the first extension struct, if any */
> >  #define XE_ENGINE_EXTENSION_SET_PROPERTY               0
> > +       /** @extensions: Pointer to the first extension struct, if any */
> >         __u64 extensions;
> >
> >         /** @width: submission width (number BB per exec) for this engine */
> > @@ -651,8 +654,8 @@ struct drm_xe_engine_get_property {
> >         /** @engine_id: Engine ID */
> >         __u32 engine_id;
> >
> > -       /** @property: property to get */
> >  #define XE_ENGINE_GET_PROPERTY_BAN                     0
> > +       /** @property: property to get */
> >         __u32 property;
> >
> >         /** @value: property value */
> > @@ -677,19 +680,19 @@ struct drm_xe_sync {
> >         /** @extensions: Pointer to the first extension struct, if any */
> >         __u64 extensions;
> >
> > -       __u32 flags;
> > -
> >  #define DRM_XE_SYNC_SYNCOBJ            0x0
> >  #define DRM_XE_SYNC_TIMELINE_SYNCOBJ   0x1
> >  #define DRM_XE_SYNC_DMA_BUF            0x2
> >  #define DRM_XE_SYNC_USER_FENCE         0x3
> >  #define DRM_XE_SYNC_SIGNAL             0x10
> > +       __u32 flags;
> >
> >         /** @pad: MBZ */
> >         __u32 pad;
> >
> >         union {
> >                 __u32 handle;
> > +
> >                 /**
> >                  * @addr: Address of user fence. When sync passed in via exec
> >                  * IOCTL this a GPU address in the VM. When sync passed in via
> > @@ -745,8 +748,6 @@ struct drm_xe_mmio {
> >
> >         __u32 addr;
> >
> > -       __u32 flags;
> > -
> >  #define DRM_XE_MMIO_8BIT       0x0
> >  #define DRM_XE_MMIO_16BIT      0x1
> >  #define DRM_XE_MMIO_32BIT      0x2
> > @@ -754,6 +755,7 @@ struct drm_xe_mmio {
> >  #define DRM_XE_MMIO_BITS_MASK  0x3
> >  #define DRM_XE_MMIO_READ       0x4
> >  #define DRM_XE_MMIO_WRITE      0x8
> > +       __u32 flags;
> >
> >         __u64 value;
> >
> > @@ -773,47 +775,57 @@ struct drm_xe_mmio {
> >  struct drm_xe_wait_user_fence {
> >         /** @extensions: Pointer to the first extension struct, if any */
> >         __u64 extensions;
> > +
> >         union {
> >                 /**
> >                  * @addr: user pointer address to wait on, must qword aligned
> >                  */
> >                 __u64 addr;
> > +
> >                 /**
> >                  * @vm_id: The ID of the VM which encounter an error used with
> >                  * DRM_XE_UFENCE_WAIT_VM_ERROR. Upper 32 bits must be clear.
> >                  */
> >                 __u64 vm_id;
> >         };
> > -       /** @op: wait operation (type of comparison) */
> > +
> >  #define DRM_XE_UFENCE_WAIT_EQ  0
> >  #define DRM_XE_UFENCE_WAIT_NEQ 1
> >  #define DRM_XE_UFENCE_WAIT_GT  2
> >  #define DRM_XE_UFENCE_WAIT_GTE 3
> >  #define DRM_XE_UFENCE_WAIT_LT  4
> >  #define DRM_XE_UFENCE_WAIT_LTE 5
> > +       /** @op: wait operation (type of comparison) */
> >         __u16 op;
> > -       /** @flags: wait flags */
> > +
> >  #define DRM_XE_UFENCE_WAIT_SOFT_OP     (1 << 0)        /* e.g. Wait on VM bind */
> >  #define DRM_XE_UFENCE_WAIT_ABSTIME     (1 << 1)
> >  #define DRM_XE_UFENCE_WAIT_VM_ERROR    (1 << 2)
> > +       /** @flags: wait flags */
> >         __u16 flags;
> > +
> >         /** @pad: MBZ */
> >         __u32 pad;
> > +
> >         /** @value: compare value */
> >         __u64 value;
> > -       /** @mask: comparison mask */
> > +
> >  #define DRM_XE_UFENCE_WAIT_U8          0xffu
> >  #define DRM_XE_UFENCE_WAIT_U16         0xffffu
> >  #define DRM_XE_UFENCE_WAIT_U32         0xffffffffu
> >  #define DRM_XE_UFENCE_WAIT_U64         0xffffffffffffffffu
> > +       /** @mask: comparison mask */
> >         __u64 mask;
> > +
> >         /** @timeout: how long to wait before bailing, value in jiffies */
> >         __s64 timeout;
> > +
> >         /**
> >          * @num_engines: number of engine instances to wait on, must be zero
> >          * when DRM_XE_UFENCE_WAIT_SOFT_OP set
> >          */
> >         __u64 num_engines;
> > +
> >         /**
> >          * @instances: user pointer to array of drm_xe_engine_class_instance to
> >          * wait on, must be NULL when DRM_XE_UFENCE_WAIT_SOFT_OP set
> > @@ -874,7 +886,6 @@ struct drm_xe_vm_madvise {
> >  #define                DRM_XE_VMA_PRIORITY_HIGH        2       /* Must be elevated user */
> >         /* Pin the VMA in memory, must be elevated user */
> >  #define DRM_XE_VM_MADVISE_PIN                  6
> > -
> >         /** @property: property to set */
> >         __u32 property;
> >
> > --
> > 2.34.1
> >
