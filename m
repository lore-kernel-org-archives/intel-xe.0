Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E25BC76196
	for <intel-xe@archiver.kernel.org>; Sat,  1 Apr 2023 05:39:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9EE010E114;
	Sat,  1 Apr 2023 05:39:11 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DACB10E114
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Apr 2023 05:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680327549; x=1711863549;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6WBJd9Qs0M9Xn7SGbiKVUh711nrBDOj03e3jHQKmVig=;
 b=n/BQqrcstbwS9h3bdVq1O7uIm9/sQe5mqew+vGmWVrImqdI0Mostfbvd
 uKKPA/DflZgaaykEFGvNYe0sPO9xC6EiJ9+SbpL9zPkSMw2ARNPo+l3pR
 +liwBQsHPpgI06+IH98lwFPsMTtdHpV9jbfwaUzdFORBOG2/u7/UaNcXp
 CQn5ub7ZWbflfmMrWBnYw18Fapte4LlwBA2uV2Ju6zJmvAl0q6L+Vl2c6
 W9PHZmcoz0n5wACqIpVP1QgTGQheIJrR8rTq+pp5S+Km/C3LE1berpxbO
 fQ4cl9KV2j/LYHihk9iY44OPeKFUAzLDij0pQVSYVb9OUw+FiT7J8H/aa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="322013655"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="322013655"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 22:39:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="754614323"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="754614323"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 31 Mar 2023 22:39:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 22:39:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 22:39:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 31 Mar 2023 22:39:05 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 31 Mar 2023 22:39:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wct63jDcdbC0jxLfHYS1STHmCcSholW2KOFaez2dRIsyXezTlZnBNNryHZNuDlv4wo0Y0n62fhmN+DCnXPfpoTbHr86RU3cgoXuJPwjAMW5ofE9KaG2F5tRwptIuAHkUxb0Jm7IsCCLDzPTFkPXygZsTZHdKqqC3JdTp0f/Y8YyBvZHz9XbcRUvsSOZM4X+853uzqtfi88ywaZ82C+pMwIRz4Mu8Fj+sT7++XGiqOaN3io+E2Qqe8Qwlf03PahwAJesSSvB4J7lqcDzL09l8U7YkWWXrV5TRiDQ0wM77G15WxQLXXlgkEwHjp/pszWahRkaCFCtEei65iBrsRUSrrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Edu1VNZ7Bq0GkWhnWhAj0PIGzdRiJJUj3kuUMUg0o/M=;
 b=nqWfQW2ff2ztGOhsWiQORUxcojq8MtL0BnN7Zh3vtpPgITGYrCJLzJrvQzaGewFZmxPYmVjjCgeeX/Wrvn+Af3Wid+UiYurkcV9k4ytcP3I0FD1CnpXNn6ELMSl1hLBcftB4SwfrjOdy5UMZnCG2R3093URdOXPZr06nWjlJ6b9mWn476F9Mp51FIEgSG5MavAUSFHcfWaIddrE03RbElePbQ5JhDlGHrW/njAMJnirg2x3IvWgcHcVFfFHBiCxbki+ayUPAzdGw6VCj2dw301QyIQQWnHuo9sU5BpQH5tV8F3O6wu6cLJ7lBXwDF6ssbS00yDB4hG8iMpHYqGiN7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5027.namprd11.prod.outlook.com (2603:10b6:303:9d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.24; Sat, 1 Apr
 2023 05:39:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.022; Sat, 1 Apr 2023
 05:39:01 +0000
Date: Fri, 31 Mar 2023 22:38:58 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <20230401053858.5p2pttr6hyugdqwj@ldmartin-desk2.lan>
References: <20230401030300.22568-1-niranjana.vishwanathapura@intel.com>
 <20230401030300.22568-3-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230401030300.22568-3-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BY5PR20CA0022.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5027:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c24c997-1875-4435-8c5a-08db32736598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JgRXtdtfN+r2TX3gMu918beklZ/3kjKKyBhyPOXoOP+WYL2XWUDakahvRXW4YVNGZ+kati4at3nMfjqrC0Rxj6dSrtcuzhm+GZKA7JBKKuTcLMww2TXUpBLznZ3/NTV1+EVmqzL7PrV+uJl9RTjdPF41lz3Jd0igqBnKMkO1OMBB6XOhKO6awElZoFLgzkb1WDqxDooMpBIwkOHHx5U2FNNS2SLO3qxQ62ud5gnDP+pvef9g2sYO9EhdrpATqA/cYMP8GrSFWANuRiexwyeuoeKVkLzOyh/j82eM2qLa/rE+xwbFHeGDhmefYGBmVaTo/8qk69FcG+SVbLoNKZsav85RIiY5gk0sHUye6Eesyr9sk3cSwt3rRvnry7rJ5mzAnye44Y7K5WA2z18qZl2mFVqZ1o6npg0JXxYiQPRA88inGwBQH82Zcg8Jvsky8HolOequFJYex+g5JJz6qabbyTB0xJbCQfAAWLqWEuN8XiuSw0D9knKbbevYRNiSPxW92CgkJANX1XN8YT9/ti928wnwvXRS/SqKgnXRfMQoBxuMANzvhDwr+V6SJhmhmMtL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(39860400002)(376002)(136003)(366004)(451199021)(36756003)(6506007)(6512007)(8676002)(316002)(6636002)(66476007)(66946007)(6486002)(4326008)(66556008)(478600001)(41300700001)(5660300002)(8936002)(6862004)(2906002)(82960400001)(86362001)(38100700002)(186003)(6666004)(1076003)(9686003)(26005)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IDy453iMcLYhIyEQTApShW4NiGxC0lMVY8xdtzZZ0UwUxJ2oKkVyGf8S377Q?=
 =?us-ascii?Q?xphW5DMGnWCy0nD1F6GKi82VPrx4iu05Se8eUItc64aTC+ypFYA6JJnEiF2L?=
 =?us-ascii?Q?9rtK/if3E6sOdSN79p8flAXk+Ebqq0l/WcfEe4WObNzQG4MS51XlCmiw24VV?=
 =?us-ascii?Q?2ObwYZ6CbSr5/NYFdT2oBiIIKECn++/t1rnt9+6p7+7ua54/RRzl5sDCgNrR?=
 =?us-ascii?Q?so+Bh07Xac4j0/ili1oAVW1fQJpZ6ZV17y3a9M+qh6+UL++5JPGU+q7AMWEy?=
 =?us-ascii?Q?iPvOZf3HqAS6OJamgbchTW0VopHzjI6IbFRfbqS4SsoYENJ3NFIsa4uXZyci?=
 =?us-ascii?Q?w/q0b0+6XjlZUUoWN2wuGhAxFrZIGynFZMhDApmmYadSZxBcLuNrQ0iHAbx7?=
 =?us-ascii?Q?b00x4vH+BIWUBUm/8mX83CBVWKNaFEaTScnIlSwDpPWwWA9aINfQVlnm/4j3?=
 =?us-ascii?Q?wnju2dUfG0RSIxvvKTxQt4F80IGryrI1K7Da4dkVAab7UsrCKXw4pelOMGcH?=
 =?us-ascii?Q?lu7UK1+BZl7S2DrSzRTheEMzBreqxHBrLQ6KVuXzCXy6i3PsbFJGk/vMHZaR?=
 =?us-ascii?Q?lIZnAqrPKBDHElSSo2/2SiXQMu9iX1STk/2SACxfmpurItItEp5gCTAtNW28?=
 =?us-ascii?Q?LevLjur/nf2GmQe/9Wr/KpElzlI1wifSXntc3OxyD4FygwD1yfKALxn7arj/?=
 =?us-ascii?Q?Xn5EO0ILDRHVyQ2cQpiDT4Dab8AI9hQPl5qjOrmxWlHmYFWDR9EuL7GPEV05?=
 =?us-ascii?Q?IVrxMYf6ittV4XjUuTN7/MPMaD11LhWqitfaS05CrgcNnzSoyCnA2McYw/nt?=
 =?us-ascii?Q?VGodMItEoRihWt7KG2va7b80Yx5VCkhXBzU6r1DYPjwJpOnF88vHdz3qXL42?=
 =?us-ascii?Q?SiTPYbBs+WcYPuOfmszcyVsvzixo3wGyNvf6owYll1N74kFywdmhJyABouWh?=
 =?us-ascii?Q?91JHA8fChavkAk0fmNowS79aJLmom4jzAGa2Kh2COC5DJU8Mg1hgIwViZ4cK?=
 =?us-ascii?Q?hqlqh4nn7x5ZMjbZMjOLwIApB1qJWsCTYVSBRJ6Cmt3q6/aDWllvX5V/C1Ql?=
 =?us-ascii?Q?vRaRXUAxpjhUUHIzGNlckmtA4YM4Ddaw3zVecR10RYCob305XEgNaoWpKbve?=
 =?us-ascii?Q?PkjeZ6SOGVt6rlBIT94DFLSYAffJHyph5Lm0j8vXexn9XtHVfhYWRZAuXAzn?=
 =?us-ascii?Q?IrKUM+ZTBjDgwWeT2HZW80J0dsKlm01r9KRk5UjGkT9ZQWpDfEc6XQdXGY0C?=
 =?us-ascii?Q?WM9s0pV4fAFlWVAXcKwdCZPs9amlPukVJxHzzlH+MA9qiDgVZwJtxqxTVxIn?=
 =?us-ascii?Q?r/q25fXxhDDimh97fVGR0qoTZIDa/5YfF03peQeEYslSSPsdt1FlbU/m8vJb?=
 =?us-ascii?Q?TUC2TZ2kMZ3gfTwjg1pYvZFKDD3d9thksTZR0oBjUn7cYI53MRFqkbC7ZiNM?=
 =?us-ascii?Q?2dfj8+uZlwyosPNo5EZzPQzT67lsTq8lkWqzFsXcwU+DJG1b1atTzSJvsji6?=
 =?us-ascii?Q?70i/qv8D7drGrgAkyPqvSGrVPuQ+W3KdOYWhUWkaxs39zM/5m4/XFbKVUr9/?=
 =?us-ascii?Q?bdmX0rRWg1wiWRi7ypWpjIIC4mWDBYL43BkkOGyqmmvARnVIE5wnxvWVlW7m?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c24c997-1875-4435-8c5a-08db32736598
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2023 05:39:01.3815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bSSeDDQ6bNCjG3JeP/AJ8SR4r2gIsORNQ0/GC7LhBW3YT7Kjz5nqV4/7xbU+y2jHBJKKcTX4SPBNmwcBtzLxgsY9tBSMxSJzqqUvABq6z4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5027
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe/tests: Set correct expectation
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
Cc: thomas.hellstrom@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 08:02:59PM -0700, Niranjana Vishwanathapura wrote:
>In xe_migrate_sanity_kunit test, use correct expected value from
>xe_migrate_copy() operation.
>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_migrate.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
>index 90f4e1c4f029..862d11b2210f 100644
>--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>@@ -147,6 +147,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
> 	xe_map_memset(xe, &sysmem->vmap, 0, 0xc0, sysmem->size);
> 	xe_map_memset(xe, &bo->vmap, 0, 0xd0, bo->size);
>
>+	expected = 0xc0c0c0c0c0c0c0c0;

Fixes: c1a4e05c9aeb ("drm/xe: Stop accepting value in xe_migrate_clear")

as the expected value was not only used for the xe_migrate_clear(), but
also for the xe_migrate_copy.

Lucas De Marchi

> 	fence = xe_migrate_copy(m, sysmem, sysmem->ttm.resource,
> 				bo->ttm.resource);
> 	if (!sanity_fence_failed(xe, fence, big ? "Copying big bo sysmem -> vram" :
>-- 
>2.21.0.rc0.32.g243a4c7e27
>
