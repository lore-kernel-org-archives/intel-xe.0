Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A43610F2867
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 20:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BD610E132;
	Fri, 27 Mar 2026 20:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ua+jaiCS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9913F10E132
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 20:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774642068; x=1806178068;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ykLOZBJC19uY2LhiwdvJoognhXXtTc2mOqxLdnuJhQQ=;
 b=Ua+jaiCSY54t/h5gAQC7Q01TNY9LxzfkldvOXpy+Xq7SH3It4++SLxpW
 23hZG3DatKh3lLQk2tBrzX6BhWWJu3UMEiPtxe8O0DYWX61ryrBDqlZMv
 JIAqj3OnsL5F44+CE8JG6yOOwRDC8s9FuNMPaoSR7nyE21IbA0od1ZxFQ
 EeU3bg96yI04Zi7p9jkW5o0DqtsEYoHX165fmihjKzihJ5bytVNccokiL
 vBwHdJIAiDd7N9J87f01GWR0j6EqY8zv8J0fDRK4Qg9UtGcusRlEU7AdE
 agANZw1jFMp3jkLN+iFvXz7V6AFIQKyUx4oFbNDQT6iSbLRY7fgXZWccd w==;
X-CSE-ConnectionGUID: BE2ezzeRQtSec7jKvg6NvA==
X-CSE-MsgGUID: RMcFJS/KS6mBAGrL2GLEdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86028595"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="86028595"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 13:07:45 -0700
X-CSE-ConnectionGUID: eeFpFHrQThOaudpHSmvj5w==
X-CSE-MsgGUID: GiAaNqcuTNCH4/J8w4u5kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="229904490"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 13:07:45 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 13:07:43 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 13:07:43 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 13:07:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ShGtFdkD1GCuv12buXLhSTl+Wp9VdwTpx9SvRuMRKLUslck/+jQKYyQnpQBxweDcmeP2mlTl6BXAHtomRV/P0qcLUDL5/yQN18JD9/lzb9t0BSrUvh5PSR4oggiG+37kQheHC5p159txdW+bNxsuUd8g2VD7BNnGWJgi2VOhD+YcdimsAouAvlN4xgnmtkFfyzYrvTOJVS46gXBTR398Dao2L7oh45/7B9oPsJEwsLvHJA++WeZ1pRmeIh7VSVk0Aq+eBSsaM+KXfiBw1FKjSFTMtb8mk6QdapxKDauILDOI1gbde4cAwDbqrx7+nP9drG6xOv6SZuSuo068NkR9Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1U8vDhuxfkH7guXNf8SFGQkAVRM0tSZKouIO5WKqoI=;
 b=knJsGMfeYJmM59OA6/3b3bjvQt0G3G2ObqZ9LmDzFzSsrO6FRvlXx9jEWPgW5vkPb1bUsMwRo3R6SYc/wVkhN4H7wldWVWlWnZol1/WVvntmhZafoIsL0K+o+OGbAUDURTPfdUwaolOtgXdeQiY+hlcMnaGjFYx9EQJqRmK8YHBqwpZ9e1oQEnIhIVQTNTJ8eel3hzvFv6StWeKNm8H4vBsNpSbTTLmFdImvOH5heJwPt7AN8i5PWanvPjLjVNqld0dTndzFGx50UQrrSGPwoijn4QHxQteUE6dC9WPJVNNosE9FltOfF/v5oBU1DxWxVOodndJW+DK4VUJPbJbMHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS0PR11MB7309.namprd11.prod.outlook.com (2603:10b6:8:13e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Fri, 27 Mar
 2026 20:07:40 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.006; Fri, 27 Mar 2026
 20:07:40 +0000
Date: Fri, 27 Mar 2026 13:07:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH 3/3] drm/xe/vf: Use drm mm instead of drm sa for CCS
 read/write
Message-ID: <acbjiCkXhYR+uDrx@gsse-cloud1.jf.intel.com>
References: <20260320121231.638189-1-satyanarayana.k.v.p@intel.com>
 <20260320121231.638189-4-satyanarayana.k.v.p@intel.com>
 <cf383a64-ae77-4129-a22a-88353946103b@intel.com>
 <2caa6dc8-26ec-436d-9326-04444eb01133@intel.com>
 <623189c1-4006-4553-84bd-4f633ad4831f@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <623189c1-4006-4553-84bd-4f633ad4831f@intel.com>
X-ClientProxiedBy: MW4PR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:303:8c::18) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS0PR11MB7309:EE_
X-MS-Office365-Filtering-Correlation-Id: 252676f7-c2fb-496f-b2ff-08de8c3c7f72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: e7ihEnKDnco+8vEhzQSaG3s8ssExSopwytAdXe1BA6LQiTc92de+4aYMnGxO63wkdK5H0jFQYT60r5gxc3U4uEQMd2HDAj6y8CMKvkmg6a5Is6WAE0w0x2lumCyi/zmgWmH6bQeGjqmammaKeaydjzr8+yOtq9pNEnIqauUiKWQ/Syv2w58FkRT+qChN90pVZllJ9geqZPDMylTHGKJ09wTDfLe8IC4u5ZoVxOvArcQ1iEnyviha+/RbuURt6NuuYcX/NcbdcizqMMwIujesUDlYXnaaEo36+y+PHM3fFtM2igp68RDZH/X74UN/OZGIEDBezgfKyL2J9oDMNNBmoovkX8gZu9hY1zptnjWvqgD2bV6N7DjV13kO9klnQJOoQAhoja3yJFc/41zEOcYrk3mfdSQkJ3Wgj8LP0UgCdW5mJqTjiBlnhc04hz3SwKs8oh8gGPwd3iNSVrlUNuaYfFwsa+BdRNqU0PlMblcX2iglYRlv6h+Bd8e2OjwYxK7e/u6EXlHyysxE9h9SzcMDnlaG7SerJECCuHkeYIRqKWLzb4CLfiGia3iwDuTUO/4+U58L7ED7ZDyGwkHhss2XSqd+48MB//LS+KUbDkM8E5v/TwIueQRRSKEI+YB2a+7Ict6kEKiQ10YXFYd6u/yyREwQm5A3GXxQvlxo45clcVRig7I35dAeAfLFVXGuiQo4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?SjnWSFCQL2AbOElgN/sXXdQyrccj8nl1v6jG3NLvkUsIffPQ2N2ex8Igg0?=
 =?iso-8859-1?Q?jRB8WM2j4+n2aLlG6HFPik668mFFXR9wA/BPXMvypsswjCtZlGvwT2iIv3?=
 =?iso-8859-1?Q?+w1tH1v24TxlpF7JTJ6W4jIBXcfQxtEIo90rGa7Bbl/VC7WzgcaqJu0FUF?=
 =?iso-8859-1?Q?ApcSVlmPn2Kj4dRsWlyoebDlEqSXuO84pFe/V/JBXDyNWRpQNMXAjlce3U?=
 =?iso-8859-1?Q?TJKnf/r0AByfcbt8nRuC3NfXAQdP9sTxW0UFSGJF7GyU57FxVOMszU3hlo?=
 =?iso-8859-1?Q?u5QwzRTCmPmRb7qVJcLP4DSWg6e6RyEDtvrRL0nTp13KiTnuxNjnllIR7L?=
 =?iso-8859-1?Q?r+qmhg0L0142zh2qQG4TF4dQtBwYS/3QJtoII9rlT7nK/+Sg0QnDRVLnm+?=
 =?iso-8859-1?Q?u3TIlzC0/srR6Pinbtm96cI1Suns/wiWZDR6UO1Jh/gC/tq2TvUZVSG14N?=
 =?iso-8859-1?Q?svmlKS0k+l7Aj6T0FwysVMgE04ZRdXK9hoN87P72nJI+BSfOyPsNWrppSa?=
 =?iso-8859-1?Q?3bVX1eUzLRkTo7ukvW9SoSG1kcbYpi5lArSaaBu6EFTvhmMqKHmTIQGCmG?=
 =?iso-8859-1?Q?yGfZo4t1oOP92iMsqytDEktvDThUik66x4k9eoXgyIoE3kjBVF761k3BEJ?=
 =?iso-8859-1?Q?Fr/SlDAPcFMZaqoF7H+ibss2nX+dBbSNgPHC10d0+RHJG6bwZsNVUhN5lH?=
 =?iso-8859-1?Q?Bf1359DABTz2vmPpxQCOfuED2q4bsDHdvaPCxu/9RvPeICvACHUfjLSEyl?=
 =?iso-8859-1?Q?DEBMI4DF3z8iuZdHN8oSY5RSKMK+6at/T5+k5yM3/tEVxRRuNsqvqcT3o5?=
 =?iso-8859-1?Q?kWS0Jp1OsdeqMqL5wxSXpE1MysXXK/W1QG7950YN5iOMdIym51aK+XhrAH?=
 =?iso-8859-1?Q?msn35CpGbYwFXk7lJeCDujlIrNzY3nOFJ1gwoN9Fq949N/8tq8qoQVfIXp?=
 =?iso-8859-1?Q?w+ZMwWJhhx0+Uf+njnT+2Qf/JkgDvKZQUyPiBKhQapfqYbYRQeVXW3O4lr?=
 =?iso-8859-1?Q?TpCNKc+XV8XG5yRBmG8kqMg0b+JsjFT3MFtFzIOPWu/8hFu6QYb0WNmy6o?=
 =?iso-8859-1?Q?lcoLeftdLG5bJiVhHl2OhKcCs4uQiPItVV3JKKVPeGvjkI1lUqrEI3vTgO?=
 =?iso-8859-1?Q?skuS4ckJU50zZOg5Qvt44pCrVQcUHYnK5t0ZkilNB8jjxc0V0Ajrf+BDIl?=
 =?iso-8859-1?Q?fRMR80H1GguC2LPuM191eqClp4fLFQidOMBQHC9EEIz/NcXa81PBKivKDe?=
 =?iso-8859-1?Q?5CuD65NqSsYwhwk1kbwkHxsEGNQKqS/bLYi+eBifxxVDXwPPReMfA6wpJ7?=
 =?iso-8859-1?Q?aT5a2aZcSSsP/cW4DcNrizTGYsRCOPHD2J5PEbP4xxEQ4Y/eHpeoLKji4k?=
 =?iso-8859-1?Q?pS6p1pv6Klqo/1H+YSTOEUN6Poc70lbv8V69hb2qLHoWKx687ZEX6VdByQ?=
 =?iso-8859-1?Q?QC3uv8WzQGtxe23sDvyIahRxa09HEce63iDcApki3YB1SM46heW87u0nEX?=
 =?iso-8859-1?Q?eOOZBF/O+F5X3MwWbSP4hpzIlsGBBwN+K78+SihEeqiVbwOJNcUWaseSEk?=
 =?iso-8859-1?Q?wQpwC0zZ1O+Bw7cKccHUxbhcVTQaeOlqb3PW/8JTQu9lPoEjOVrA4dA32v?=
 =?iso-8859-1?Q?AIDwov0sG42KZn2eSadrTvSVlypDTzhnJGsNckeP/LxxYEcpkNA5KE+I6F?=
 =?iso-8859-1?Q?aRW2fN2aYGarT3jjA/FPV0mKvJOzIr8UVmL3Aw1mns6htc9TBjDbqwldeq?=
 =?iso-8859-1?Q?h1gaIeqFxhInGmCKD0Kt5IQpC2EmhL1lwkrvIxJrcJQqmEY0rdCBtYDpGj?=
 =?iso-8859-1?Q?A+D36jWZZHOxxATCFx7NH6xy4sFzsdg=3D?=
X-Exchange-RoutingPolicyChecked: utxIV/eMDAAhaQdPX+CAYDsCxW5u+VBg4+Z271w/cK5zgvH6to6YRU0HX5qJunCvnO2jJ3UO2Ts72YVDwkU/NTmvt3bOfasqtQTHfiWXGXMWfOYlzfOefGgj+aswzMFCHcRSRyMaGzh5EiYl5VoXPivWlq9sSloyHXMTbWumJ/KcB+KBP6oE/lqdyPXp7NgUL4WqQmzW1ta4tr23soNjTBx1h3tXssQLh7SQjL0jIpWA54n/PupYRS3ZC9AI0zpRGp8T5NgEAxFdmT41aPBGJ16BypP4u2tWcSoICy1HKq3QTLU9XeLrtU0OJ3Xj8cbVPj/l+vt6j61uDtbvKDCEvA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 252676f7-c2fb-496f-b2ff-08de8c3c7f72
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 20:07:39.9320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 59N8H8zzjAll9BGbffh6mxCPKMySCbNpl/6ilTSHrP1jDlzLea7eXICoyNJq8eM8eyOX0olQ/X+nnTRgsKnulA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7309
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

On Fri, Mar 27, 2026 at 12:47:36PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 3/27/2026 12:17 PM, K V P, Satyanarayana wrote:
> > 
> > On 27-Mar-26 4:37 PM, Michal Wajdeczko wrote:
> >> On 3/20/2026 1:12 PM, Satyanarayana K V P wrote:
> >>> The suballocator algorithm tracks a hole cursor at the last allocation
> >>> and tries to allocate after it. This is optimized for fence-ordered
> >>> progress, where older allocations are expected to become reusable first.
> >>>
> >>> In fence-enabled mode, that ordering assumption holds. In fence-disabled
> >>> mode, allocations may be freed in arbitrary order, so limiting allocation
> >>> to the current hole window can miss valid free space and fail allocations
> >>> despite sufficient total space.
> >>>
> >>> Use DRM memory manager instead of sub-allocator to get rid of this issue
> >>> as CCS read/write operations do not use fences.
> >>>
> >>> Fixes: 864690cf4dd62 ("drm/xe/vf: Attach and detach CCS copy commands with BO")
> >>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> >>> Cc: Matthew Brost <matthew.brost@intel.com>
> >>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> >>> Cc: Maarten Lankhorst <dev@lankhorst.se>
> >>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>>
> >>> ---
> >>> Used drm mm instead of drm sa based on comments from
> >>> https://lore.kernel.org/all/bbf0d48d-a95a-46e1-ac8f-e8a0daa81365@amd.com/
> >>> ---
> >>>  drivers/gpu/drm/xe/xe_bo_types.h           |  3 +-
> >>>  drivers/gpu/drm/xe/xe_migrate.c            | 56 ++++++++++++----------
> >>>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 39 ++++++++-------
> >>>  drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  2 +-
> >>>  4 files changed, 53 insertions(+), 47 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> >>> index d4fe3c8dca5b..4c4f15c5648e 100644
> >>> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> >>> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> >>> @@ -18,6 +18,7 @@
> >>>  #include "xe_ggtt_types.h" struct xe_device; +struct xe_drm_mm_bb; struct xe_vm; #define XE_BO_MAX_PLACEMENTS 3 @@ -88,7 +89,7 @@ struct xe_bo { bool ccs_cleared; /** @bb_ccs: BB instructions of CCS read/write. Valid only for VF */ - struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT]; + struct xe_drm_mm_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT]; /** * @cpu_caching: CPU caching mode. Currently only used for userspace diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c index fc918b4fba54..2fefd306cb2e 100644 --- a/drivers/gpu/drm/xe/xe_migrate.c +++ b/drivers/gpu/drm/xe/xe_migrate.c @@ -22,6 +22,7 @@ #include "xe_assert.h"
> >>>  #include "xe_bb.h"
> >>>  #include "xe_bo.h"
> >>> +#include "xe_drm_mm.h"
> >>>  #include "xe_exec_queue.h"
> >>>  #include "xe_ggtt.h"
> >>>  #include "xe_gt.h"
> >>> @@ -1166,11 +1167,12 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> >>>  	u32 batch_size, batch_size_allocated;
> >>>  	struct xe_device *xe = gt_to_xe(gt);
> >>>  	struct xe_res_cursor src_it, ccs_it;
> >>> +	struct xe_drm_mm_manager *bb_pool;
> >>>  	struct xe_sriov_vf_ccs_ctx *ctx;
> >>> -	struct xe_sa_manager *bb_pool;
> >>> +	struct xe_drm_mm_bb *bb = NULL;
> >>>  	u64 size = xe_bo_size(src_bo);
> >>> -	struct xe_bb *bb = NULL;
> >>>  	u64 src_L0, src_L0_ofs;
> >>> +	struct xe_bb xe_bb_tmp;
> >>>  	u32 src_L0_pt;
> >>>  	int err;
> >>>  
> >>> @@ -1208,18 +1210,18 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> >>>  		size -= src_L0;
> >>>  	}
> >>>  
> >>> -	bb = xe_bb_alloc(gt);
> >>> +	bb = xe_drm_mm_bb_alloc();
> >>>  	if (IS_ERR(bb))
> >>>  		return PTR_ERR(bb);
> >>>  
> >>>  	bb_pool = ctx->mem.ccs_bb_pool;
> >>> -	scoped_guard(mutex, xe_sa_bo_swap_guard(bb_pool)) {
> >>> -		xe_sa_bo_swap_shadow(bb_pool);
> >>> +	scoped_guard(mutex, xe_drm_mm_bo_swap_guard(bb_pool)) {
> >>> +		xe_drm_mm_bo_swap_shadow(bb_pool);
> >>>  
> >>> -		err = xe_bb_init(bb, bb_pool, batch_size);
> >>> +		err = xe_drm_mm_bb_insert(bb, bb_pool, batch_size);
> >>>  		if (err) {
> >>>  			xe_gt_err(gt, "BB allocation failed.\n");
> >>> -			xe_bb_free(bb, NULL);
> >>> +			kfree(bb);
> >>>  			return err;
> >>>  		}
> >>>  
> >>> @@ -1227,6 +1229,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> >>>  		size = xe_bo_size(src_bo);
> >>>  		batch_size = 0;
> >>>  
> >>> +		xe_bb_tmp = (struct xe_bb){ .cs = bb->cs, .len = 0 };
> >>>  		/*
> >>>  		 * Emit PTE and copy commands here.
> >>>  		 * The CCS copy command can only support limited size. If the size to be
> >>> @@ -1255,24 +1258,27 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> >>>  			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
> >>>  			batch_size += EMIT_COPY_CCS_DW;
> >>>  
> >>> -			emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
> >>> +			emit_pte(m, &xe_bb_tmp, src_L0_pt, false, true, &src_it, src_L0, src);
> >>>  
> >>> -			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> >>> +			emit_pte(m, &xe_bb_tmp, ccs_pt, false, false, &ccs_it, ccs_size, src);
> >>>  
> >>> -			bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> >>> -			flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> >>> +			xe_bb_tmp.len = emit_flush_invalidate(xe_bb_tmp.cs, xe_bb_tmp.len,
> >>> +							      flush_flags);
> >>> +			flush_flags = xe_migrate_ccs_copy(m, &xe_bb_tmp, src_L0_ofs, src_is_pltt,
> >>>  							  src_L0_ofs, dst_is_pltt,
> >>>  							  src_L0, ccs_ofs, true);
> >>> -			bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> >>> +			xe_bb_tmp.len = emit_flush_invalidate(xe_bb_tmp.cs, xe_bb_tmp.len,
> >>> +							      flush_flags);
> >>>  
> >>>  			size -= src_L0;
> >>>  		}
> >>>  
> >>> -		xe_assert(xe, (batch_size_allocated == bb->len));
> >>> +		xe_assert(xe, (batch_size_allocated == xe_bb_tmp.len));
> >>> +		bb->len = xe_bb_tmp.len;
> >>>  		src_bo->bb_ccs[read_write] = bb;
> >>>  
> >>>  		xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
> >>> -		xe_sa_bo_sync_shadow(bb->bo);
> >>> +		xe_drm_mm_sync_shadow(bb_pool, &bb->node);
> >>>  	}
> >>>  
> >>>  	return 0;
> >>> @@ -1297,10 +1303,10 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> >>>  void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
> >>>  				  enum xe_sriov_vf_ccs_rw_ctxs read_write)
> >>>  {
> >>> -	struct xe_bb *bb = src_bo->bb_ccs[read_write];
> >>> +	struct xe_drm_mm_bb *bb = src_bo->bb_ccs[read_write];
> >>>  	struct xe_device *xe = xe_bo_device(src_bo);
> >>> +	struct xe_drm_mm_manager *bb_pool;
> >>>  	struct xe_sriov_vf_ccs_ctx *ctx;
> >>> -	struct xe_sa_manager *bb_pool;
> >>>  	u32 *cs;
> >>>  
> >>>  	xe_assert(xe, IS_SRIOV_VF(xe));
> >>> @@ -1308,17 +1314,17 @@ void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
> >>>  	ctx = &xe->sriov.vf.ccs.contexts[read_write];
> >>>  	bb_pool = ctx->mem.ccs_bb_pool;
> >>>  
> >>> -	guard(mutex) (xe_sa_bo_swap_guard(bb_pool));
> >>> -	xe_sa_bo_swap_shadow(bb_pool);
> >>> -
> >>> -	cs = xe_sa_bo_cpu_addr(bb->bo);
> >>> -	memset(cs, MI_NOOP, bb->len * sizeof(u32));
> >>> -	xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
> >>> +	scoped_guard(mutex, xe_drm_mm_bo_swap_guard(bb_pool)) {
> >>> +		xe_drm_mm_bo_swap_shadow(bb_pool);
> >>>  
> >>> -	xe_sa_bo_sync_shadow(bb->bo);
> >>> +		cs = bb_pool->cpu_addr + bb->node.start;
> >>> +		memset(cs, MI_NOOP, bb->len * sizeof(u32));
> >>> +		xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
> >>>  
> >>> -	xe_bb_free(bb, NULL);
> >>> -	src_bo->bb_ccs[read_write] = NULL;
> >>> +		xe_drm_mm_sync_shadow(bb_pool, &bb->node);
> >>> +		xe_drm_mm_bb_free(bb);
> >>> +		src_bo->bb_ccs[read_write] = NULL;
> >>> +	}
> >>>  }
> >>>  
> >>>  /**
> >>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> >>> index db023fb66a27..6fb4641c6f0f 100644
> >>> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> >>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> >>> @@ -8,6 +8,7 @@
> >>>  #include "xe_bb.h"
> >>>  #include "xe_bo.h"
> >>>  #include "xe_device.h"
> >>> +#include "xe_drm_mm.h"
> >>>  #include "xe_exec_queue.h"
> >>>  #include "xe_exec_queue_types.h"
> >>>  #include "xe_gt_sriov_vf.h"
> >>> @@ -16,7 +17,6 @@
> >>>  #include "xe_lrc.h"
> >>>  #include "xe_migrate.h"
> >>>  #include "xe_pm.h"
> >>> -#include "xe_sa.h"
> >>>  #include "xe_sriov_printk.h"
> >>>  #include "xe_sriov_vf.h"
> >>>  #include "xe_sriov_vf_ccs.h"
> >>> @@ -141,8 +141,8 @@ static u64 get_ccs_bb_pool_size(struct xe_device *xe)
> >>>  
> >>>  static int alloc_bb_pool(struct xe_tile *tile, struct xe_sriov_vf_ccs_ctx *ctx)
> >>>  {
> >>> +	struct xe_drm_mm_manager *drm_mm_manager;
> >>>  	struct xe_device *xe = tile_to_xe(tile);
> >>> -	struct xe_sa_manager *sa_manager;
> >>>  	u64 bb_pool_size;
> >>>  	int offset, err;
> >>>  
> >>> @@ -150,34 +150,33 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_sriov_vf_ccs_ctx *ctx)
> >>>  	xe_sriov_info(xe, "Allocating %s CCS BB pool size = %lldMB\n",
> >>>  		      ctx->ctx_id ? "Restore" : "Save", bb_pool_size / SZ_1M);
> >>>  
> >>> -	sa_manager = __xe_sa_bo_manager_init(tile, bb_pool_size, SZ_4K, SZ_16,
> >>> -					     XE_SA_BO_MANAGER_FLAG_SHADOW);
> >>> -
> >>> -	if (IS_ERR(sa_manager)) {
> >>> -		xe_sriov_err(xe, "Suballocator init failed with error: %pe\n",
> >>> -			     sa_manager);
> >>> -		err = PTR_ERR(sa_manager);
> >>> +	drm_mm_manager = xe_drm_mm_manager_init(tile, bb_pool_size, SZ_4K,
> >>> +						XE_DRM_MM_BO_MANAGER_FLAG_SHADOW);
> >>> +	if (IS_ERR(drm_mm_manager)) {
> >>> +		xe_sriov_err(xe, "XE_DRM_MM init failed with error: %pe\n",
> >>> +			     drm_mm_manager);
> >>> +		err = PTR_ERR(drm_mm_manager);
> >>>  		return err;
> >>>  	}
> >>>  
> >>>  	offset = 0;
> >>> -	xe_map_memset(xe, &sa_manager->bo->vmap, offset, MI_NOOP,
> >>> +	xe_map_memset(xe, &drm_mm_manager->bo->vmap, offset, MI_NOOP,
> >>>  		      bb_pool_size);
> >>> -	xe_map_memset(xe, &sa_manager->shadow->vmap, offset, MI_NOOP,
> >>> +	xe_map_memset(xe, &drm_mm_manager->shadow->vmap, offset, MI_NOOP,
> >>>  		      bb_pool_size);
> >>>  
> >>>  	offset = bb_pool_size - sizeof(u32);
> >>> -	xe_map_wr(xe, &sa_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
> >>> -	xe_map_wr(xe, &sa_manager->shadow->vmap, offset, u32, MI_BATCH_BUFFER_END);
> >>> +	xe_map_wr(xe, &drm_mm_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
> >>> +	xe_map_wr(xe, &drm_mm_manager->shadow->vmap, offset, u32, MI_BATCH_BUFFER_END);
> >> this seems to break the new XE MM component isolation, as you are directly
> >> touching the XE MM internals without XE MM being aware of this...
> >>
> >> are we sure that XE MM will not overwrite this last dword from the pool BO?
> >> maybe it should be exposed to the XE MM user as this 'trail guard' location?
> > 
> > For CCS save/restore, we submit this complete MM to Guc and whenever VM is paused, Guc submits this MM to HW.
> > While allocating BBs, we always allocate size + 1 
> 
> that sounds like a hack and relies that XEMM will not zeroed the new BB
> but in v1 xe_drm_mm_insert_node it looks that new node->size is zeroed...
> 
> btw, it also unnecessary wastes lot of dwords (1 per each BB)
> 
> but this could be done in a way that XEMM has some control over it
> and we will not need to deep dive into XEMM internals
>  
> assuming that we will allocate XEMM as size + trail/guard:
> 
> 
>    <------------------- pool size -----> <-> trail size
>   +-------------------------------------+---+
>   |  ____    _______                    |   |
>   +-------------------------------------+---+
>      ^       ^                           ^
>      |       |                           |
>      bb      bb                          trail
> 
> XEMM may return vmap of the trail (or special trail node) where we
> could write our BB_END and then we can let XEMM flush it to the BOs
> 

All you should need to do is create a fixed-placement drm_mm node and
insert it with drm_mm_insert_node_in_range when xe_drm_mm_manager_init
(or whatever it is renamed to) is called, based on a trailing argument.
I think this is a good suggestion.

> and XEMM could allocate all BBs (without any extra +1) within real
> pool size without any risk that it will overwrite our data in trail
> 

Yes.

But I do think the caller should own the initialization values for the
BO, shadow, and tail, so that the allocator remains generic while the
upper layer defines how the contents are used. Of course, we could add
some helpers to extract things like drm_mm_manager->bo->vmap, etc.

Matt

> > so that even if the allocation happens at the end of the MM,
> > the MI_BATCH_BUFFER_END instruction is not overwritten.
> > 
> >>>  
> >>> -	ctx->mem.ccs_bb_pool = sa_manager;
> >>> +	ctx->mem.ccs_bb_pool = drm_mm_manager;
> >>>  
> >>>  	return 0;
> >>>  }
> >>>  
> >>>  static void ccs_rw_update_ring(struct xe_sriov_vf_ccs_ctx *ctx)
> >>>  {
> >>> -	u64 addr = xe_sa_manager_gpu_addr(ctx->mem.ccs_bb_pool);
> >>> +	u64 addr = xe_drm_mm_manager_gpu_addr(ctx->mem.ccs_bb_pool);
> >>>  	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
> >>>  	u32 dw[10], i = 0;
> >>>  
> >>> @@ -388,7 +387,7 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
> >>>  #define XE_SRIOV_VF_CCS_RW_BB_ADDR_OFFSET	(2 * sizeof(u32))
> >>>  void xe_sriov_vf_ccs_rw_update_bb_addr(struct xe_sriov_vf_ccs_ctx *ctx)
> >>>  {
> >>> -	u64 addr = xe_sa_manager_gpu_addr(ctx->mem.ccs_bb_pool);
> >>> +	u64 addr = xe_drm_mm_manager_gpu_addr(ctx->mem.ccs_bb_pool);
> >>>  	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
> >>>  	struct xe_device *xe = gt_to_xe(ctx->mig_q->gt);
> >>>  
> >>> @@ -412,8 +411,8 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
> >>>  	struct xe_device *xe = xe_bo_device(bo);
> >>>  	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> >>>  	struct xe_sriov_vf_ccs_ctx *ctx;
> >>> +	struct xe_drm_mm_bb *bb;
> >>>  	struct xe_tile *tile;
> >>> -	struct xe_bb *bb;
> >>>  	int err = 0;
> >>>  
> >>>  	xe_assert(xe, IS_VF_CCS_READY(xe));
> >>> @@ -445,7 +444,7 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
> >>>  {
> >>>  	struct xe_device *xe = xe_bo_device(bo);
> >>>  	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> >>> -	struct xe_bb *bb;
> >>> +	struct xe_drm_mm_bb *bb;
> >>>  
> >>>  	xe_assert(xe, IS_VF_CCS_READY(xe));
> >>>  
> >>> @@ -471,8 +470,8 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
> >>>   */
> >>>  void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p)
> >>>  {
> >>> -	struct xe_sa_manager *bb_pool;
> >>>  	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> >>> +	struct xe_drm_mm_manager *bb_pool;
> >>>  
> >>>  	if (!IS_VF_CCS_READY(xe))
> >>>  		return;
> >>> @@ -485,7 +484,7 @@ void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p)
> >>>  
> >>>  		drm_printf(p, "ccs %s bb suballoc info\n", ctx_id ? "write" : "read");
> >>>  		drm_printf(p, "-------------------------\n");
> >>> -		drm_suballoc_dump_debug_info(&bb_pool->base, p, xe_sa_manager_gpu_addr(bb_pool));
> >>> +		drm_mm_print(&bb_pool->base, p);
> >>>  		drm_puts(p, "\n");
> >>>  	}
> >>>  }
> >>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> >>> index 22c499943d2a..f2af074578c9 100644
> >>> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> >>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> >>> @@ -33,7 +33,7 @@ struct xe_sriov_vf_ccs_ctx {
> >>>  	/** @mem: memory data */
> >>>  	struct {
> >>>  		/** @mem.ccs_bb_pool: Pool from which batch buffers are allocated. */
> >>> -		struct xe_sa_manager *ccs_bb_pool;
> >>> +		struct xe_drm_mm_manager *ccs_bb_pool;
> >>>  	} mem;
> >>>  };
> >>>  
> 
