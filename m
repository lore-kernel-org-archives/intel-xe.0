Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038B8C46CD2
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jan 2024 04:46:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD0410F608;
	Wed, 24 Jan 2024 04:45:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A87210F609
 for <Intel-Xe@lists.freedesktop.org>; Wed, 24 Jan 2024 04:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706071558; x=1737607558;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=m27j06cEODhcsIkzIiTTnSBO0vpDsFH1qOJ5jmdWJ4Q=;
 b=VjX2THaC6wB8slYzu52j4RvkWjKHpxhbOJKcfcp021RmCJP0mhMnjI9m
 74SHVcI8KliyeF7LbCBIzQrC663YsfC9AXwAaoxoe0GfRLVqJHBZOQbkB
 4/0e9f2bRAk3xN+wJcUWDmaIcEESeo7aCU/hUpbEmgBVTNQjGUUwtZ4rx
 pG16m98KZzPT2lV1w5HQMgYFmuTAW6j5PLKLKkhf6w9eilBdbQLxM+hX/
 fD8Btd4Nn5AXr2LZftOSaYDNaENRHPomncS9ra0LOAjTmtABisDyc72bs
 S5M3mH78TEKR9vfWcFgirh96pR6MMKEvqGuPeVPsqMopuSu7YJHAPLqUm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1583669"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1583669"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 20:45:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="786285591"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="786285591"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 20:45:56 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 20:45:56 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 20:45:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 20:45:55 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 20:45:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QFUNckSAaq3X3aAhJmMJfnhFu7WlWK9n5H9FIcGeVCdCCB0JgGB74l7LaRzWQmgHfXagBbDpyBgOvScy9v00FoYUSEWa85InWUTZoMTUff9QmaFiZrhegs8CO76oeGTOuDD9O0OtzrLKTHRjGPySU3Uoxw0J+OHLmlsasq8N1uLTe6serWA3XRbOvoRBwbdqNohuVBzeL5wWbkXNArmhKYriKsA1pk4ZV6hPDQK0p4r+Rp/qAi5qXzGRioduKffM0zwfTD2wRxagMN1rLsGoontDZix69KZYpt2ttn4EXSr68MGm+ZNLaB991DkXfCCpK9dt36j0lgJWLnYPqxmzDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qTv44a0nMzRCTe/X2cxqyiTiEwn5xYBqO2u1vAwC5o=;
 b=AiCgyn9jNE1C9A7M8a1a99j+1y3j2ImhL9lb60ZpmpOGWxiHtU9IPUDRrKNLfqm3zgz+o2CcZU+78yxvohr+EhLrmf+GeCrhLSVJDbUFgs+4Wokme/r0q2tU6AzmNmkhhoProDfw9M54YqrJ2vXsJc/CIYmPOF/PH/MDDeGLtZdzNGDRzsIRwi/LYsIxS7/FIW8d478FvG97dOUrXMtaPmJTO/K9LCS9D5BMB8hPtaqjOrgEthaKyL5spAmGj55ezbH3MITzeis1dnYNNMagg756SyaNyu3NaWznqNW4T/zy6ZqRpWzKnniN1wbKXGgiZiLYoshUvixkZ1YeCpbjhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN9PR11MB5356.namprd11.prod.outlook.com (2603:10b6:408:11d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 04:45:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.035; Wed, 24 Jan 2024
 04:45:48 +0000
Date: Tue, 23 Jan 2024 22:45:46 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: Re: [PATCH 2/2] drm/xe/guc: Update to GuC firmware 70.19.1
Message-ID: <g46qtz35pbombdfmesyiu63i6cpetal3th6smefia3rev2alaf@nmqq6u6wxz4w>
References: <20240122213708.1841488-1-John.C.Harrison@Intel.com>
 <20240122213708.1841488-3-John.C.Harrison@Intel.com>
 <069f1653-d286-4bce-84f7-e2198ba0c5e8@intel.com>
 <wqlmadoyl4ifwavwaihupuc66nygylkxijofftrphjc4bv5djz@63tydn37unxg>
 <773deddc-54e6-44b4-9ea1-16a314474abe@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <773deddc-54e6-44b4-9ea1-16a314474abe@intel.com>
X-ClientProxiedBy: BYAPR06CA0032.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::45) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN9PR11MB5356:EE_
X-MS-Office365-Filtering-Correlation-Id: d0b0d556-380c-45dc-e04d-08dc1c9755e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1sNxBPHnpeUtlU5F6Es1FbnOSc3XE7KU0AgnYTPi/I0s1SXuyEnfHOUAkY2hDtjq/hw0N80WVuOMCcj4NPk+PWBY47KymOwudGsYjC1tU+cLeZVlKRol1dfj3TLj32Dg3q0U6+s8nwEFt0c8yNkaro8B6U+rkIUSU8mh1W9xPlcLe4b9AEfW0rRVGYeso5tfnXHLBEr1bl8r1UJlzWRD6DB01WtPAgFcGs2SS7DwW2jvdL+5TPhq5esqiec/uOPK3ffvoD0u1s+9615Xx2SCe8YpEPtjJy/ALXhydOOtUQmG1R7Ecjsk8zAIbZtMCi+61Zq1cO9hfLHc0mY3pT5qSExDCt3UmxWVl30NLcZm5JYqaN0b4q+QbZ4+lakaO0LFf8iOYwsdffbdDQiCeCmwPpNwNUT+BT9gdScRhiLKDggp8W+Qknmojxgf37vsnotv1JWBwb+teLHYNVdc/jf8N7j5TSK+dCr/JvF+sWpOEfJsyr2Df765niDrsa74/pjlux5Yia41+TbPGC6kp96VsJxe14qgyYmQpjhnlUlgsZaapplrXv1+25nMaONvuP+v
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(39860400002)(366004)(396003)(136003)(376002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(15650500001)(2906002)(5660300002)(478600001)(86362001)(82960400001)(38100700002)(83380400001)(6486002)(6506007)(6512007)(9686003)(26005)(66476007)(66556008)(316002)(66946007)(6636002)(4326008)(33716001)(8936002)(6862004)(8676002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?XAm5xftMr2HDDj/VtOzueR6aMrLGDmw029FOf/K1OdQQMg/quXGJzc/x6S?=
 =?iso-8859-1?Q?WiIEFx/Vq4hxIWQUIh4n26svVRmgYghOpNTD9dsgPSE/D+HoOQlpLd9OeU?=
 =?iso-8859-1?Q?gHhKpqwSyf/+x08Dlel0lerpQmaXwCAMwf2BS1bJ/Xa2Qnzj0fUTxNjTOx?=
 =?iso-8859-1?Q?PTuPU3iDmjg8r1sn1tX1i827kbuNIqtdAfThMYqBv4lV0KVyVK5Y4JJSZP?=
 =?iso-8859-1?Q?2c8XWS86ixJl9ixwTLL/VO95OVBDcHT4rDfYID1H35V3hX3vX20CJmTVFi?=
 =?iso-8859-1?Q?wq9awK+rtvJeeAqdNLDdYT4KAGYUbsjcXZ6GSg7IbXr+4gqN0BxxBmET3n?=
 =?iso-8859-1?Q?wFLmWTggJT/Gs/Ayudf8hlJjFkRoXQxrUhxfwuc7vRjZTtcnf2mPl+Ls/G?=
 =?iso-8859-1?Q?Ba/s8Ppmiz0xKFrMQMocgAgIugtYUnBmwKKcZV/Y+TFBM91CM2aNk5sYmJ?=
 =?iso-8859-1?Q?KdmqhZOQ69cFFJfay+SLGcQAoGFReqYoa3QZeWQyao95cWfunPDO5O/GIV?=
 =?iso-8859-1?Q?Ue8vtrdwbsg5d9rN7a9HdFJCz501bNjUDQAVynJRE7TsxkizKfBHQOpP3P?=
 =?iso-8859-1?Q?9rxedT2VyApCAXtg/bezPOkYs4SPr411QnfahVrPxX8CHxvHcGbMicfued?=
 =?iso-8859-1?Q?GjsIhwuZ6KcmZqSvj8+6yvHQe7ELwZOJ28QBZLuH91aVKNSryFN5MxT52+?=
 =?iso-8859-1?Q?M54Aph3z3E36cz1xm+K4tdX8rNbdv9LPmEccU0XcbUWWrUvqPqSE3wSaGK?=
 =?iso-8859-1?Q?o2djk1BOL/s5tYjGUVcP7cCBWKejQTVnG05R8lIwuVcRcG+rJy1opD8h+0?=
 =?iso-8859-1?Q?umr6r3/GMOeXRfksWrZAimLcYcjZ0z/TKYEtvplzkLJKUAnEaQHVCi1V5m?=
 =?iso-8859-1?Q?oHGJeW6WrSITLby8qfddjbwKfxHHoAuypNGnC78VimydL2JhWccBK2OcNC?=
 =?iso-8859-1?Q?YHuGYN9IhoYgOqoBnz7OQO7IloM7nU0HB9Y6SXncNV46pFyxw29y9eV1+Z?=
 =?iso-8859-1?Q?tvyoNwe6TaJ5DJEzyWlQpyp5ig0SNsbGYn8qm0rLwbGozXeb1bJUua8oTZ?=
 =?iso-8859-1?Q?5mKVTn3H8vy/0uPcrZX1lMqQfSFqKA5br5YwjRsgBJBX8tCCgNKQOexPK6?=
 =?iso-8859-1?Q?NcLcmgxMVYuybQso/yVF5MKJXDTPufPV3lZ6txakAAFnVV2Z0ZdGTTM6rP?=
 =?iso-8859-1?Q?nKebiJREqNKcXD0gvn2Bb5PeaWSpyFE7p/muocmAEbBq0/KoCXy5Sxod+V?=
 =?iso-8859-1?Q?DvKB38s6+AEhMO9MxQY0rk/vP7FMnQrSl66cWSkbK6zXiTJrQXlpS/ufXC?=
 =?iso-8859-1?Q?voauwabBbUS7m7yK/t5ecQePql+k4ZNzGx/FQV9QF0z5YV+wBkUvSDguHu?=
 =?iso-8859-1?Q?pEUh4X6v3KSBl0omOucTstfQi159r7fMryur9imeU2L6Ei7M4BXXOf1YTg?=
 =?iso-8859-1?Q?OkTYQQFWEgiKoAX26G98nUOyKxbUfJW2vLenPloaZTaMEnf6bk1DNoUlx0?=
 =?iso-8859-1?Q?DmW/9pGhrGLyDRFVUH6KyrHdJgigY1kLBIKM2W7wEZGXwkT7Bvuh6myGxV?=
 =?iso-8859-1?Q?qVNvgfW9ecuw1B0h7YSinTDBWN+sAHkV3qqReD3dWj80SNe1CDWe2cwAGG?=
 =?iso-8859-1?Q?UKhuP2RXKTaSPuMllmqG8MRyZo6suYhai6h6pUq72ZaThpZtB0oDFraQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b0d556-380c-45dc-e04d-08dc1c9755e4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 04:45:48.7892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5DpXIOArAcEgruLbz/tlIflwz1cDQuQj8tQwDWFZmb61RhngqzGplQwlTj+nXRpYVtvYRaSw1BHGp5zk91khB7+3F/B+jeDDubE3lf+sY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5356
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
Cc: Intel-Xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 23, 2024 at 03:24:45PM -0800, John Harrison wrote:
>On 1/23/2024 08:41, Lucas De Marchi wrote:
>>On Mon, Jan 22, 2024 at 02:14:56PM -0800, Welty, Brian wrote:
>>>On 1/22/2024 1:37 PM, John.C.Harrison@Intel.com wrote:
>>>>From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>>UAPI compatibility version: 1.8.1
>>
>>what exactly is this? We don't seem to track it anywhere in the driver.
>It is XE_UC_FW_VER_COMPATIBILITY. This is the version number that 
>should be looked at for tracking what features are or are not 

maybe in the commit message refer to it as

XE_UC_FW_VER_COMPATIBILITY, or "GUC FW I/F" or even "VF Version"?
UAPI here is too confusing.


>available. The raw file version (e.g. 70.19.1) is XE_UC_FW_VER_RELEASE 
>but that is not accessible from a VF and cannot be exported to UMDs 
>because again, it would break in an SRIOV type scenario. The file 
>version should only be used for feature checks when actually loading 
>the GuC itself (which can only be done by native/PF), e.g. what to put 
>in the ADS, what load time w/a's should be enabled, etc.
>
>>
>>>
>>>I've wondered for awhile why was lagging behind here....
>>>
>>>Reviewed-by: Brian Welty <brian.welty@intel.com>
>>>
>>>>
>>>>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>---
>>>> drivers/gpu/drm/xe/xe_uc_fw.c | 16 ++++++++--------
>>>> 1 file changed, 8 insertions(+), 8 deletions(-)
>>>>
>>>>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>>>>b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>>index d3f0fe2101a7..8da6cbb8c9e2 100644
>>>>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>>>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>>@@ -103,14 +103,14 @@ struct fw_blobs_by_type {
>>>> };
>>>> #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)            \
>>>>-    fw_def(METEORLAKE,    major_ver(i915,    guc,    mtl, 70, 
>>>>7, 0))    \
>>>>-    fw_def(DG2,        major_ver(i915,    guc,    dg2,    70, 
>>>>5, 0))    \
>>>>-    fw_def(DG1,        major_ver(i915,    guc,    dg1,    70, 
>>>>5, 0))    \
>>>>-    fw_def(ALDERLAKE_N,    major_ver(i915,    guc,    tgl, 70, 
>>>>5, 0))    \
>>>>-    fw_def(ALDERLAKE_P,    major_ver(i915,    guc, adlp,    70, 
>>>>5, 0))    \
>>>>-    fw_def(ALDERLAKE_S,    major_ver(i915,    guc,    tgl, 70, 
>>>>5, 0))    \
>>>>-    fw_def(ROCKETLAKE,    major_ver(i915,    guc,    tgl, 70, 
>>>>5, 0))    \
>>>>-    fw_def(TIGERLAKE,    major_ver(i915,    guc,    tgl, 70, 5, 0))
>>>>+    fw_def(METEORLAKE,    major_ver(i915,    guc,    mtl, 70, 
>>>>19, 1))    \
>>>>+    fw_def(DG2,        major_ver(i915,    guc,    dg2,    70, 
>>>>19, 1))    \
>>>>+    fw_def(DG1,        major_ver(i915,    guc,    dg1,    70, 
>>>>19, 1))    \
>>>>+    fw_def(ALDERLAKE_N,    major_ver(i915,    guc,    tgl, 70, 
>>>>19, 1))    \
>>>>+    fw_def(ALDERLAKE_P,    major_ver(i915,    guc, adlp,    70, 
>>>>19, 1))    \
>>>>+    fw_def(ALDERLAKE_S,    major_ver(i915,    guc,    tgl, 70, 
>>>>19, 1))    \
>>>>+    fw_def(ROCKETLAKE,    major_ver(i915,    guc,    tgl, 70, 
>>>>19, 1))    \
>>>>+    fw_def(TIGERLAKE,    major_ver(i915,    guc,    tgl, 70, 19, 1))
>>
>>are all of these in linux-firmware repo?
>Not in the upstream repo yet. I'm about to start that process.

let's make sure we get all those there then. With that,

Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
