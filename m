Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B7BCD3439
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 00:29:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEF710E21A;
	Thu,  7 May 2026 00:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a42+8/rE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F194310E21A
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 00:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778113757; x=1809649757;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ToKPmE0tc6KCZrKGNyo9uBboDLKtRaXZ04lsNZML7eo=;
 b=a42+8/rEuzHqPOcrpvqWAq5iYEuk80wVeAWSgxJ3ZIEyhtFvqdG5sgPc
 LOgIy7Mo/wnGHBFEzMxFoGyWzz/w7HxrdllwAFaEU+9w/LldhgQH/uftw
 HuVj9ENMkmPxySSWYRVXyzp/fnwibhQxHeaNMJTiMCihBEvgQBvk3FXUF
 rQsR09q2UqTE2JHFLK+4kHfDfaP2RsCAuxl2aqWSirWtuFeNw/2KbEn00
 jiLVrq/HgQqGx0qlykY5SL1dEK9OBfyZcTXOgc7qYojhiiI4DzTeo1Kjd
 qxYcO+sLDBZU5F/+9XLHsblVuUSg5kM5kJHw3fB3t4VJCmF3QpdXSNuuC w==;
X-CSE-ConnectionGUID: ti0iWKn8TaONWanwXA+pDA==
X-CSE-MsgGUID: jHFJcbxuQ0yXnGRfbIXAug==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78208417"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="78208417"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 17:29:16 -0700
X-CSE-ConnectionGUID: 82la/TYcTRSXtQ5M7wj3/A==
X-CSE-MsgGUID: 3HZojZjNReaZ70Jg07jXrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="236227189"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 17:29:16 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 17:29:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 17:29:16 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 17:29:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YXtbL4n0PRWxABAgKvFQGAAEF91NxJ4K94JMrSY67fr55huRhmLZHHfWbCKxWsJ87w6LTR1Y2vGtQTI2dAEpgc+FyoQJpI87V29/b8DIUhOgxgj+xSz+3sDbYMAYBhxo/WcMVtMrnQGAnCGrgoHdgPFQ8b6cj4daQ8XbnYzHf2uqtbqg22gfiCzBqiZIiTUkKVyXjlJe9p7LDkOvkCWYM0WW3VciZRaeeoNz4HGvRYMvnnPkz/bxQo8Tj2w4aLHAVq5rSlrda0bWpUkr1goYt5qswpkYHCiykYONSE6fA/4IVWtKU08I1AFT/UbHcl/GcydhR13Gx/HhFP952RJt5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+X4CjbGwf3BuwfozDKJaRl+1H1OV8neUPK5Oe28KYYU=;
 b=hwFtEJtMfUZBZcM6RQU7N6VD9aBGyKyWJDcOPEr/5H55EdU5k/mA4OC2l2I3LRnA+LZ3zCxSNQu7hm3KCba6uFKA+CMQ7V7AfdgJq4J7IEEdfjrOxrtpgFtIWuHI0XIn2urEen4h3ZYX0VgrogH3/gIgRMraUIJ2xCZrbSRLMQRif03wDbSa63ycqjxrKpqN9ciHzHvPVXqwSxjwA2iPrl/CFscx2g0VnVWavlopBJJHJqUHIJ6s4B0UU8iAo+/JhTvk703GAAnQhxCE3rJiCjZlS4kYTHZaMU8Vx3Jq+arAIkHt58eBhbpQPxhVEttnKN2Pk/Af/AGZpUHu6b+lgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH3PPFF8B8D6872.namprd11.prod.outlook.com (2603:10b6:518:1::d61)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Thu, 7 May
 2026 00:29:10 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 00:29:10 +0000
Date: Wed, 6 May 2026 17:29:07 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v4 06/11] drm/xe/multi_queue: Add helpers to access CS
 QUEUE TIMESTAMP from lrc
Message-ID: <afvc04GHOy3l0wuj@nvishwa1-desk>
References: <20260506223500.3769614-13-umesh.nerlige.ramappa@intel.com>
 <20260506223500.3769614-19-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260506223500.3769614-19-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0159.namprd05.prod.outlook.com
 (2603:10b6:a03:339::14) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH3PPFF8B8D6872:EE_
X-MS-Office365-Filtering-Correlation-Id: 223345e2-2416-4d10-cd2f-08deabcfa81d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 4v90GC4WCA9bqQkX9TELAyy43OO5PdbbepA0MTsSxSRP1Hu67IrllGQClSBIHKw+ZNKQkGOl96oHBPl99ENnmU2kzfmDpekWuOJnEkG+GgI/exeG/1n3/+vBGbQEyvF8mkTsicTYjoPVW3t0vsUSa6s93YU97xkNDNc9L6i9rkm1FUdzo8lZgUQEXxCsWKbGBLlrnl48vwydkxytAyXhFlpiDr0KX6xKv5xEka52lWjtZmOdGGxbcVCmrh8pIALYyGB9esIXkxM0G4Bzdw3pn6G2jkfUYUyyuE79t+eAvkqd/Tls9YvSy4r9F/YV2Q65r4qBe1NdWeVHQeEaE8UJU89otitsdSVnS/5oym7bmAljPOg9RD/u0OZtEZTyjqb1ZPmFElbSr48bRlXn2gvTL5QdKfiqPRiXT8vWVHVqOcMaRsSuCTWEnwZEN48vwRA/ZUvqQOs/k1eEk9TfgX0MG4W3Q/Y6IIebR2wGRRqYS3E4pxTDf0rKpraNfU7lMl3UuFIxPa0v+w+uY2M2qCok1vCGlKZjy6R5wNZu/8zmUFJ8xUUjyL2n7fiFTHiqsblrLtIioh427eCjBQ+4I9eP9P8JN4qaUndWBTfMIW3MCj06/pGtV1bHJlrUszMTy1MMgY9DQdMCwjm0Yy0K22V8V1o/i1L+9Alz2Q3S9u9Yze3+v+DN1p5XYbyDYVV53zOI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mWPJHloDb3AH9kn+ayy5LHVcImiDI37N6nNrqKNTsEimUO2O+gfJD6CWI7Sr?=
 =?us-ascii?Q?ct1FMb4NkTZEgVsHLYyDvmnxlxGDIdbJFwy1jrk3FHzznPLuZe/zz2m8wnmn?=
 =?us-ascii?Q?Ta7nal4relW7KOD+eOWlHFcIsO/6KKjNsP6vV49Fhw45YlVFsNT18Dj85tsa?=
 =?us-ascii?Q?e/UZmbn/IfOP2P5a/6dr/IEXflIIpuY6oEQ6m0/tDy/Q/3dvHBRSvGAB4UGb?=
 =?us-ascii?Q?IZ0oYQ0JSurfQ8EvQ7M+6sKkq/TlzpgknDi+wXzdnMVu4R8B5Z+BuuX8YM0u?=
 =?us-ascii?Q?UZk+8a+7tpu3ZwjRNPmoBsXAc8N6h0fjOR21/5h5nWtUey1mcf49vh0UIrRq?=
 =?us-ascii?Q?ZgASg6107uoQhyuVJD8WsvndV5qK/VuRbwpVXO2+MiwBVaxvErJaPJK6yJ3R?=
 =?us-ascii?Q?caSmkCVxwxZVHv6JTuillSpRJrgTU4pjJTgu/vKgjU7IjjwkhQd29ANc/70i?=
 =?us-ascii?Q?bcNrFPr6uwcM5E+D+Ck65fFw0cSh4gMaRFQoiJirJgjjr4zFwJGzpWjubcWq?=
 =?us-ascii?Q?jK1PalvrrOL+WHlQz/LftrFJDxRR9TiFwNiaTQI2tnp7wc+qQCaGZuaVi3qZ?=
 =?us-ascii?Q?pLs8beJ6ygjnSXQUTNx1zdJl1t8RN00C3yDLxZWCS5GmbJEf3ogoqFwi+7af?=
 =?us-ascii?Q?aZlBvnNBPe0WB4eUlrtlm/7Ci5cBIaLoYseUxmU3N43j2aQZ1uusC6W3TjKA?=
 =?us-ascii?Q?I1lwbQXs5CTJ1sEj2ersX9yNW4KY+yF5zaqEmEorCOTRUqmhtYhjU1/VXbaa?=
 =?us-ascii?Q?TyGpuvqhONZxobyih/hfSpgzHNRTDrwHHa3AoO/O/IZl/CHLDX4ZMp5jd+yZ?=
 =?us-ascii?Q?Fv6RLpCRF+Ekqr2IFjLI84nfD13+YX23ShqvSA0UNV2UHSqUCD5tMJSaOdB/?=
 =?us-ascii?Q?WVPLEF6DvJ+gaIF9ogEISvhuEzn8pjvQQaA346UAaheSMMDZ5jELLQ7eHXc7?=
 =?us-ascii?Q?gDFdOiCRr0IMJrfP7L6Beu46oTjltrLwCyjTIUVryy1tY3Ad69h6ZH0uA+ZJ?=
 =?us-ascii?Q?gKbOPOugVIVuczXXOT/m3zcVg+bUPfIa70WJ2fq8VnV3xMpwVDZOV/3tjG+D?=
 =?us-ascii?Q?rE43QjEHJA4y8DAR14kNuzk4bqEGDQI7iCVIoNHarUXSxjesDHNIXGv2JUrl?=
 =?us-ascii?Q?sV0geENV3YX38Q6d7sKqbSlgxFqLjGtdQmgesjqZBBHdX0eaos1JMlkf+H/u?=
 =?us-ascii?Q?TEzKtJ5r+rtkEHsBsk0Mj0ry9DRaOzA7xHaeoKpD+nptXbvm3ifZqGHfz/5I?=
 =?us-ascii?Q?xgcm3eO1FbyYKxCynK10DDLbqDBukSVRz4YVCJef1yBuLuS2zz4dt9VE5tQH?=
 =?us-ascii?Q?9aqQSYyPWk1pB3an1uQ9BEnx33snfXRT2/WtAvjOOeZ5VMApozsq+wBTYmhs?=
 =?us-ascii?Q?uKTMWB8vUs5IzfhO3jaId6rIu+ju0WAWJH2tFEz5AdbQ/9Y6fQgeFi47+Svh?=
 =?us-ascii?Q?PyD1lyPrNTCfz6+7+20gdqKnaGQCQ9bhCGQFOeZJVkC0wfrMczcqd8SS6Do7?=
 =?us-ascii?Q?9GvhqksCPb9914yCyJ45vx/LXdCXEiqxmtYfnBKkOeT5iZSvj6RImCismmmj?=
 =?us-ascii?Q?qkmyocnhYjLeSNnKZW9obAlYGqKnt7rO/By02bNoqM9QU7xlv1hD3qjwbaLv?=
 =?us-ascii?Q?2M+7lBFziRy6OoyIahqLyvi8KkQRGsT3gzBm5kPNulNDee32R8yNusRN9/cy?=
 =?us-ascii?Q?gBQCAXZnMhRdOLVvaaAAKbBx646NyTwCFZL/fwW7JIv5nhsjGwYbN4Dtza1W?=
 =?us-ascii?Q?yEGzEq7956h9xZBBEjOP2hXh/lF0d8JvVGDoPKqczAkfBJ+cqB0R?=
X-Exchange-RoutingPolicyChecked: ZNLIpQdwoZxm6QCmUSWfUK6CCa36JAPbHaL5MzWYOaPEr57r0OzXn49WkdrlL/bv3N2hTEA55BjDv+DrmhI3xJSWswwDv9/TeBwCong5jLEEIpWX9/6hGjnAhMZIlfC1JPsY0bmexMYl5CixbqglWNxooe32sHduBi52+ljEegUEk83g2wqTbsKvcUC24YSLPLeqx1G2FGMAjn6j7ZMtt3fKhDYhmcLujyFFp4leIcKffBolU9naPda6JIFP/JWljMDoA8lLDyyxKKiTfJ+UUHeJWPs8a2G8352ZOMoseFvFBz2lxXjk/9ZG8n/4n5rzGx1ijVlHdRhpBJRRI11yUg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 223345e2-2416-4d10-cd2f-08deabcfa81d
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 00:29:10.1555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BfzRWEKzwAhTf1lecF+EyAMPKqp5h+VMdKnluL4HkH5u8UJRw4S4pc0LnrfIlCSGbHUp8PbXIwIgZ5LA6V/4IL+h+hSoo3p/zF+z6EfcH5iK3rB/zj6KZ3nzuHgtJVZy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF8B8D6872
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

On Wed, May 06, 2026 at 03:35:07PM -0700, Umesh Nerlige Ramappa wrote:
>In secondary queue LRCs, the QUEUE TIMESTAMP register is saved and
>restored allowing us to view the individual queue run times. Add helpers
>to read this value from the LRC.
>
>BSpec: 73988
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
>v2: (Matt)
>- Add BSpec reference
>- Make queue_timestamp snapshot 64 bit
>- Add a snapshot of queue timestamp in ms
>
>v3:
>- Replace xe_lrc_is_multi_queue check in lrc init (Niranajana)
>- Use assert instead of check in xe_lrc_queue_timestamp
>
>v4: (Niranjana)
>- Add comment for clearing QUEUE_TIMESTAMP in LRC
>- Print snapshot based on xe_lrc_is_multi_queue

LGTM.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  3 ++
> drivers/gpu/drm/xe/xe_lrc.c             | 54 +++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_lrc.h             |  2 +
> drivers/gpu/drm/xe/xe_lrc_types.h       |  3 ++
> 4 files changed, 62 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>index b5eff383902c..4ab86fc369fd 100644
>--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>@@ -34,6 +34,9 @@
> #define CTX_CS_INT_VEC_REG		0x5a
> #define CTX_CS_INT_VEC_DATA		(CTX_CS_INT_VEC_REG + 1)
>
>+#define CTX_QUEUE_TIMESTAMP		(0xd0 + 1)
>+#define CTX_QUEUE_TIMESTAMP_UDW		(0xd2 + 1)
>+
> #define INDIRECT_CTX_RING_HEAD		(0x02 + 1)
> #define INDIRECT_CTX_RING_TAIL		(0x04 + 1)
> #define INDIRECT_CTX_RING_START		(0x06 + 1)
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 3def999ce48a..46e9b98a2dfd 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -777,6 +777,16 @@ static u32 __xe_lrc_ctx_timestamp_udw_offset(struct xe_lrc *lrc)
> 	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP_UDW * sizeof(u32);
> }
>
>+static u32 __xe_lrc_queue_timestamp_offset(struct xe_lrc *lrc)
>+{
>+	return __xe_lrc_regs_offset(lrc) + CTX_QUEUE_TIMESTAMP * sizeof(u32);
>+}
>+
>+static u32 __xe_lrc_queue_timestamp_udw_offset(struct xe_lrc *lrc)
>+{
>+	return __xe_lrc_regs_offset(lrc) + CTX_QUEUE_TIMESTAMP_UDW * sizeof(u32);
>+}
>+
> static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
> {
> 	u32 offset = xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE -
>@@ -826,6 +836,8 @@ DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw, lrc->bo)
> DECL_MAP_ADDR_HELPERS(parallel, lrc->bo)
> DECL_MAP_ADDR_HELPERS(indirect_ring, lrc->bo)
> DECL_MAP_ADDR_HELPERS(engine_id, lrc->bo)
>+DECL_MAP_ADDR_HELPERS(queue_timestamp, lrc->bo)
>+DECL_MAP_ADDR_HELPERS(queue_timestamp_udw, lrc->bo)
>
> #undef DECL_MAP_ADDR_HELPERS
>
>@@ -874,6 +886,29 @@ static u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
> 	return (u64)udw << 32 | ldw;
> }
>
>+/**
>+ * xe_lrc_queue_timestamp() - Read queue timestamp value
>+ * @lrc: Pointer to the lrc.
>+ *
>+ * Returns: queue timestamp value
>+ */
>+static u64 xe_lrc_queue_timestamp(struct xe_lrc *lrc)
>+{
>+	struct xe_device *xe = lrc_to_xe(lrc);
>+	struct iosys_map map;
>+	u32 ldw, udw = 0;
>+
>+	xe_assert(xe, xe_lrc_is_multi_queue(lrc));
>+
>+	map = __xe_lrc_queue_timestamp_map(lrc);
>+	ldw = xe_map_read32(xe, &map);
>+
>+	map = __xe_lrc_queue_timestamp_udw_map(lrc);
>+	udw = xe_map_read32(xe, &map);
>+
>+	return (u64)udw << 32 | ldw;
>+}
>+
> /**
>  * xe_lrc_ctx_job_timestamp_ggtt_addr() - Get ctx job timestamp GGTT address
>  * @lrc: Pointer to the lrc.
>@@ -1538,6 +1573,18 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
> 	if (lrc_to_xe(lrc)->info.has_64bit_timestamp)
> 		xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP_UDW, 0);
>
>+	/*
>+	 * Note: It's possible that this LRC may belong to an exec_queue that is
>+	 * not part of a multi-queue group. That said, it doesn't hurt to set
>+	 * this field anyways since any class that supports multi-queue will
>+	 * have these LRC fields defined.
>+	 */
>+	if (xe_gt_supports_multi_queue(gt, hwe->class)) {
>+		lrc->queue_timestamp = 0;
>+		xe_lrc_write_ctx_reg(lrc, CTX_QUEUE_TIMESTAMP, 0);
>+		xe_lrc_write_ctx_reg(lrc, CTX_QUEUE_TIMESTAMP_UDW, 0);
>+	}
>+
> 	if (xe->info.has_asid && vm)
> 		xe_lrc_write_ctx_reg(lrc, CTX_ASID, vm->usm.asid);
>
>@@ -2470,9 +2517,14 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
> 		snapshot->multi_queue.primary_context_desc =
> 			xe_lrc_ggtt_addr(lrc->multi_queue.primary_lrc);
> 		snapshot->multi_queue.pos = lrc->multi_queue.pos;
>+		snapshot->queue_timestamp = xe_lrc_queue_timestamp(lrc);
>+		snapshot->queue_timestamp_ms =
>+			xe_gt_clock_interval_to_ms(lrc->gt, snapshot->queue_timestamp);
> 	} else {
> 		snapshot->multi_queue.primary_context_desc = 0;
> 		snapshot->multi_queue.pos = 0;
>+		snapshot->queue_timestamp = 0;
>+		snapshot->queue_timestamp_ms = 0;
> 	}
> 	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
> 	return snapshot;
>@@ -2528,6 +2580,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
> 	drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->seqno);
> 	drm_printf(p, "\tTimestamp: 0x%016llx\n", snapshot->ctx_timestamp);
> 	drm_printf(p, "\tTimestamp ms: %llu\n", snapshot->ctx_timestamp_ms);
>+	drm_printf(p, "\tQueue Timestamp: 0x%016llx\n", snapshot->queue_timestamp);
>+	drm_printf(p, "\tQueue Timestamp ms: %llu\n", snapshot->queue_timestamp_ms);
> 	drm_printf(p, "\tJob Timestamp: 0x%08x\n", snapshot->ctx_job_timestamp);
> 	if (snapshot->multi_queue.primary_context_desc) {
> 		drm_printf(p, "\tMulti queue primary Context Desc: 0x%08x\n",
>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>index d0deb916e4f1..131bd2b0ceab 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>@@ -39,6 +39,8 @@ struct xe_lrc_snapshot {
> 	u32 seqno;
> 	u64 ctx_timestamp;
> 	u64 ctx_timestamp_ms;
>+	u64 queue_timestamp;
>+	u64 queue_timestamp_ms;
> 	u32 ctx_job_timestamp;
> 	struct {
> 		u32 primary_context_desc;
>diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>index 0a5c13ec2ad7..53ef48feebfc 100644
>--- a/drivers/gpu/drm/xe/xe_lrc_types.h
>+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>@@ -64,6 +64,9 @@ struct xe_lrc {
> 	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
> 	u64 ctx_timestamp;
>
>+	/** @queue_timestamp: value of QUEUE_TIMESTAMP on last update */
>+	u64 queue_timestamp;
>+
> 	/** @multi_queue: Multi queue LRC related information */
> 	struct {
> 		/** @multi_queue.primary_lrc: Primary lrc of this multi-queue group*/
>-- 
>2.51.0
>
