Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616B5606D832
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 14:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BY7L13Al
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A2910E807;
	Tue,  3 Nov 2026 14:20:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7BE10E807
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 14:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793715638; x=1825251638;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=qOUVNuhWeAYmGZcSZkZM6f6XQptE2rAfY3QlmpfJPF8=;
 b=BY7L13AlAZbhXp4OewRiMcjnYTUMOR/pg73Gs6mTDgkH37Ddoov2s4Dg
 wsXqL71/avvFLdlVO/GHh/TPOsTfpeCbgbfuwfQTL+2c8Tw2eCUHEfPGp
 S8sdV/OmP3FRqE0Teosj/aX7OcV7P7wOgjj8u1OwDrre9hW4LGbsXxudF
 XRhiWVtcgHOAGFAgSgHFZAk8tPARHZrybJEH7vynsj7Hx6hw6MtuupzCE
 XS6S4c3EIc39v2jt/rLeDEYI2LTppD8wSixjQYcHXYDb8ZYSLKfeo9dgT
 kwfmvIEkRaigp8J2bCwEJshj9YhsIPtSX/Ampt3krR9QZspMcX4Eq8tDn A==;
X-CSE-ConnectionGUID: 1THdedbnQN+Gk3/OGdLjaA==
X-CSE-MsgGUID: GRvWmVu/RjW58l1U9VKw6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2318921"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2318921"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 06:20:37 -0800
X-CSE-ConnectionGUID: X6F9xcDDRb+pYU2MxN8beA==
X-CSE-MsgGUID: cqM1kN+hR/q2PnVKva3jrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="8216951"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 06:20:37 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 06:20:36 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 06:20:36 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.3) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 06:20:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LmkYKIHt9kWkOArwJANARIMYX+4ko4tN5OKmBrDvtxzj9NDPnVL930BErPqHHWTy3q4h4ykS6mjikNi32HcbD8+nwOjDuyxMLZ2ftcesaFuS7Ey8IM2/YfVnHrk8Jl5cH4bt5aGEivieZXTHeQyxlkvNthn++yhUucBs3u4ZzC71xageQ8ImlnMAM+oOCi5w6NnisOdy9c441ZUBVRDAjEhX3zreYxSK8pq5LflimOgZptdkcfstZzLOtGgFuQsdXFWRzSseuiGwjgUL4oaXy7X0iKmLkz6o3+ei16cgBwXdQFwmgKD8HH7uDvH5GUCVWCluJybbeqE6zUxgpj0E1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKqyKhQSEYDMmdIJsJ9rYTxX5eUf+8Mw71fgJCrNYo4=;
 b=YLQ6lrynGARHA2m3rjs35n/GB7XMPzb9pj+Ex0HoHnUZzO9ASZB7J3AZXYeSbiFD57VaqiXAXVESB8qqNdo5TP6f/NBzRcOaBD0/Yoc0Cq7ZJEOjnyTPWESPxerz32gMHWf8oWGKf0VRe2A2urpjOzl2086dD3m+BjxKdQ1TfJGTCfJLdCS4YujvUMBDe3TaFszQVB68yqHa3uI/jwQji9gU8y9JW4D2FUpgv17mFLDtQOslp/WdxQ+5sPdKSNZcLZtPykY7O1Y36a0kfV6uCqi4cH2MiypCReAISEt/tdUqkvx/z+aPgBoZGmJ6VJvrPMjAuarPH9N9qvU61RCTpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by LV3PR11MB8744.namprd11.prod.outlook.com (2603:10b6:408:215::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 14:20:28 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 14:20:28 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matt Atwood <matthew.s.atwood@intel.com>
Subject: Re: [PATCH v2 05/10] drm/xe: Bail from adjust_idledly() if no
 applicable workaround
In-Reply-To: <auiH9H2NZGsRZCht@bvivekan-mobl1>
References: <20261030-wa_16031259911-v2-0-919fa1c27070@intel.com>
 <20261030-wa_16031259911-v2-5-919fa1c27070@intel.com>
 <auiH9H2NZGsRZCht@bvivekan-mobl1>
Date: Tue, 3 Nov 2026 11:20:24 -0300
Message-ID: <8733tiq9nb.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0059.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::34) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|LV3PR11MB8744:EE_
X-MS-Office365-Filtering-Correlation-Id: 1302e7f0-94e8-4174-3487-08df39b59c5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|261026140227099003|260925021311599003|260925021911599003|260925022911599003|4143699003|56012099006|11063799006|261009223027099003|261028144727099003|261022105027099003|261021121427099003|261021123027099003|261026121527099003|10067099003|18002099003|22082099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: PDHFqh38CsHuQC0uf5hE15sIcaUyghL/IPCdvWx3ANvsN+A5obcdDcS9poMlg3iJ6MA3wAcpgxAydMRW5SVASO/NJ7pLHJAOOY0Tj8+VW8idg3pEhGSHJxP0jLbgAIDaH1TIuYuAtC0h5dxELIKdHuwKb4O28NGfOBgOTE7j7BATOG2LB9QgXpUnalP2W1iQQXOUx7Gi2xJ2VfaG4H3xT+ULDe2ltWeUqK68WrIrgWHBBFnDhvQzwDKvfi29zi9T4Yi3ZH3zyfaJ2q0+Hr6g0sLXPDTJSeh3rejCtnW0D2LT8qGToc8gZKI26r8aE1Dm8P7hysQU2+/a39uqypDcJnJDvK6VnSlzb0Yciaggp4IRPQtebD5wJYuHJxzRFMr04Y3EJPT2dhYvde8nDdSXLW8r6v0yHCWiVoz+bq09bwmHXxaWKSMmG8cMeUSL5e4sAlC8LhmHuvUEZFd7IVqo8e0YZ6WGaUgN8m260VAPWXAScSgTFh+F9vizHeFdqD0LHua114K/C43MhxDOQyYPZBiJhGjM8QKoTIJ0+iLc08odxS6z6DgaO/fgKLzaIkgFpeeDD5uJlRD6ZMo2bfyywhUErv4gRkGOKkC4IMq9D9Zbqn3FwXjP0FjZh0l1trZJRc43FgO5PErukQkJyimTzLR7XW2qTnrhOeZRmYpWZeA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261026140227099003)(260925021311599003)(260925021911599003)(260925022911599003)(4143699003)(56012099006)(11063799006)(261009223027099003)(261028144727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(261102123227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/rhsMSV7ZHB7pxidb+Dh2EOxrRBFdC77NmTSXDvKyyvsknc3v4+iNzbr9Lsq?=
 =?us-ascii?Q?EQHFx+3GpfCw0Ze9Wkx8pvctpm4hBWbp7IG16HwrV3RP8tWQGt49LZT6jeuJ?=
 =?us-ascii?Q?jMpp+ZM2XvJyDBDxmIWoBx0PaWwJSzYkzHE6FG7g0Ph051Zw1FIAYi7H/Kw1?=
 =?us-ascii?Q?PufriUsbQVlWZ5Kb549rdZeZtlEH3Hker9L+lcVf6jOkNFv1NQosUqbw4AP2?=
 =?us-ascii?Q?TYERlMKAOG1s3h+dT37uRa0WSapXtTCqC4Xq6TBIVgz3oN5XG/WMgnKyt5Yj?=
 =?us-ascii?Q?vpeSUn1YG4jWkuzvczkf7BXUwc/qCnoJXCfGENI6Tt526uIuylZXr/A3u15C?=
 =?us-ascii?Q?dznRzxfxY3nUBMKYlFJ6+I2iokqEzdQDI1EwDqbkE9CUu7kVeAz5ABA2zMmx?=
 =?us-ascii?Q?ekRywReTCWaD+DIHMFfO+2iCeGfOtyNoE9mCoAfj8GZ88ho7xcfMFgSuxKq4?=
 =?us-ascii?Q?x2tuc7x/MPtnk+v+3KcEaIdlqgQ/9VmMx7ALxc14GUbOlL1QX53/H1EZ86XZ?=
 =?us-ascii?Q?4Kt1Uus/+LZ4fLPmGUd8ZsQ3/2bBUEYGL/THblqrcM4BMsrvQ8g5mzV5y7xR?=
 =?us-ascii?Q?gt2JDFTOtoHjkaFXOJHxCKohK0IdzVxfNr/PyD68vwQgvu5mRR+iEOZt+95K?=
 =?us-ascii?Q?07mVCcHxy6HotfWnq06fcpwNnA+z55VwDiII7fyhdD+T1EzVjEASyo58g2nP?=
 =?us-ascii?Q?KiPgGZu1+3/C4bi8+wad106cWaq9iocykEdqmttg/prgNvFWjLhm9HoiWwez?=
 =?us-ascii?Q?rJHhrK6X3T1ZtSb1k2RT3dD/1EH/odSGH6lcnk3qXrHbGxFhKW2w1f4lABek?=
 =?us-ascii?Q?IJ/Rwg7gqMB9WUNmpZRiZK8z19qCtQ6eAd38pGAvUL2xtkoS9d0tIWP/xjtY?=
 =?us-ascii?Q?neznuHPzZTu3vneflXqyYF4I5jnyFdJvrMuBSOLkoBbstP2t21dLoL8G0qZo?=
 =?us-ascii?Q?IPUDJvWNL/ug4Z6nLquuMH8jABSiBnrdGQGA2RtkQvpsh5g7eDr125G0PowH?=
 =?us-ascii?Q?ff6cinq7H8FHcUkeR2DkKqNcfGKCageT1rZ1UPPVg17Ees5im+ks6fIwayDF?=
 =?us-ascii?Q?ggchAhhPVGuNhjmJIEZCJY7Vd3ZdwrNOtP2riGO48RXuOhyNvPSGMeCH8VnI?=
 =?us-ascii?Q?qFNfiEnK8hKNg5KgV7KKeTJuh8B+PcKgylIdI1F7MgtjqlwohQeZ4px9YCKg?=
 =?us-ascii?Q?+aHZM2khB6VvM+H/8MnK+BkbZNgk+/4nyQACGF/Nb8uHZDGxL/Cq6IFyukf7?=
 =?us-ascii?Q?AXo68USR8osDPQ/Ax95Y21ncQdncPX+ifX4iEJ3c/Jn935hq5tmXFY8PJ7B7?=
 =?us-ascii?Q?s4hsGzcBHOn0h8RFVi6ZAvGPBJuadBZZBHbPiRp8UxC+q6FbNbd5bP5vX4PL?=
 =?us-ascii?Q?OEjthgi2RPMs7ANgqvN/diS3A04XQgYdGjG1AOErzyufYXQdaSOUXXSzTtmf?=
 =?us-ascii?Q?zM6Qro8EC7zu2Rqx2woJC7PoJffSet0ScFpXWxrS0wHlyBIRrKUT9a/lodoB?=
 =?us-ascii?Q?mCGog8j2JFDP6rite0q2Ui2zoAXfYTJWCFk9wTD3gkAsCOqVHdaHzG2fPOx/?=
 =?us-ascii?Q?IoWWYHPLSPcP4VLKpyuWkqEReYkqhERoirCDzVwoRg+2Bq0Mr6EzxRiCbTd2?=
 =?us-ascii?Q?KzHlT0i+jlQbIKpeEuipgoEC15y96djuaJ14K15XyfRpcXFdwBd16KiQru8H?=
 =?us-ascii?Q?jmhZ3CvlbpxoyvYpqYXAOkgJB4DJO36tjLjohCEAfi++//nmEFsbB9vJqQy5?=
 =?us-ascii?Q?FQGMPGXgMQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: xF0VqOhUM6pto7waIvbYQ/Bl0LbgO029RfqfIxDxgqRB1Lukp72SxBLvrZ/HfBANlgvCuL9xyoeI8ZqiiPQgBo+voLbTSr/I1i2mwbDUWV2MMrN5YsNDP9pNc+MyEFYnGKgaNcIs5YPYIjEdAPmoJlT7rziov0XCYTHw4QSifoHahiPZOQ4ApxOfEByCxZPmF0art6BR8MX1Wx4U9jt671OOx2CvVyzIFp3gUM4cFuUkRmxX+kEpzJD5BQVW+KNxLI4enNEbRSmuiDOZT7jHe0xAUXaiyuulK14S6thE0FMzKjWx/w9FDb712XQqlwm8/HgLtYt8msYR6B/dReGaaA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1302e7f0-94e8-4174-3487-08df39b59c5e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 14:20:28.6713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qXVYiR0kh49ISB/vCHXRGpNcMxAsD6405UxA99ReEEaPImxfFkMbziaxFdS/ZBkV5pAKrNd54vnPBt3Bg/J9eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8744
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

"Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
writes:

> On 30.10.2026 19:57, Gustavo Sousa wrote:
>> Re-organize adjust_idledly() so that we return and avoid touching the
>> hardware if no applicable workaround was found.
>> 
>> Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_hw_engine.c | 32 +++++++++++++++++++-------------
>>  1 file changed, 19 insertions(+), 13 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index 01a7baf061eb..32d33c70e7f4 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -605,7 +605,7 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
>>  	u64 idledly_ps, idledly_hw_ps;
>>  	u64 min_idledly_ps = 0;
>>  	u64 max_idledly_ps = -1;
>> -	bool inhibit_switch = false;
>> +	bool clear_inhibit_switch = false;
>>  	bool wa_applied = false;
>>  
>>  	if (IS_SRIOV_VF(gt_to_xe(gt)))
>> @@ -616,12 +616,6 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
>>  		if (!idledly_units_ps)
>>  			return;
>>  
>> -		idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
>> -		inhibit_switch = idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED;
>> -		idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
>> -		idledly_ps = idledly * idledly_units_ps;
>> -		idledly_hw_ps = idledly_ps;
>> -
>>  		if (XE_GT_WA(gt, 14025941587))
>>  			min_idledly_ps = max(min_idledly_ps, 5000000);
>>  
>> @@ -633,13 +627,24 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
>>  					       max_idledly_ps,
>>  					       REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) * maxcnt_units_ps);
>>  
>> -			/* Clear the inhibit switch without disturbing a valid delay. */
>> -			if (inhibit_switch) {
>> -				idledly_reg_val &= ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
>> -				wa_applied = true;
>> -			}
>> +			clear_inhibit_switch = true;
>>  		}
>>  
>> +		/* No applicable workaround found. */
>> +		if (min_idledly_ps == 0 && max_idledly_ps == -1 && !clear_inhibit_switch)
>> +			return;
>
> We can skip the check for "max_idledly_ps == -1".

You say that because of the "!clear_inhibit_switch" check?

If so, I would prefer that we keep the check so that we do not tie the
maximum idle delay with the clear_inhibit_switch flag.  It is true that
today the only workaround that defines a maximum idle delay also sets
clear_inhibit_switch, but I think we should make the logic treat those
two things orthogonally, like it is already being done below.

>
> Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Thanks! :-)

Let me know if I can go ahead with you r-b on the patch as-is; or if you
prefer to further discuss this.

--
Gustavo Sousa

>
> Regards,
> Bala
>
>> +
>> +		idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
>> +
>> +		if (clear_inhibit_switch && idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED) {
>> +			idledly_reg_val &= ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
>> +			wa_applied = true;
>> +		}
>> +
>> +		idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
>> +		idledly_ps = idledly * idledly_units_ps;
>> +		idledly_hw_ps = idledly_ps;
>> +
>>  		/*
>>  		 * min_idledly_ps is applied before max_idledly_ps, which takes
>>  		 * priority if the two ever conflict (not expected in practice).
>> @@ -671,7 +676,8 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
>>  
>>  			xe_gt_dbg(gt, "idledly %s: set %llups min=%llups max=%llups inh=%u ts=%ups\n",
>>  				  hwe->name, idledly_ps, min_idledly_ps, max_idledly_ps,
>> -				  !!inhibit_switch, gt->info.timestamp_base);
>> +				  !!(idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED),
>> +				  gt->info.timestamp_base);
>>  			xe_mmio_write32(&gt->mmio,
>>  					RING_IDLEDLY(hwe->mmio_base),
>>  					idledly_reg_val);
>> 
>> -- 
>> 2.56.0
>> 
