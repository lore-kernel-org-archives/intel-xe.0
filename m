Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D63AC83F1B
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 16:25:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A789110E231;
	Thu, 10 Jul 2025 16:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZVzDynKR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62DE10E231
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 16:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752164743; x=1783700743;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EsusX9j93KNFmA2ExLwvW0O+41pm+QwhaJEryIp+AO0=;
 b=ZVzDynKRRTQDgpRMnXE4uB/UAGGmw1PEnAFD12S2vJBvSW/Gp9Y91y2Y
 dSWFjpOwIesdoAky1Tz1btzygr1HS5pwCqLv4OP2tWdua7lLtGBMVTW2n
 1sCZeFULJQMLBYvl0c4VD4jMr9AKkh907IQg2LvSHoZF2qscP+ORDI6ty
 lCbv2sX8EfuqIkmPpeujl7KPbfWnYkWD9vpjFO4bXoNNckLRf3R3gYujb
 /WKIaJjB2DWbrhtncCcCt7pPgxxK3zHg4vLEE2ybEfyS3N+3j8R0wCeq9
 3rbZxFy7F1enER2bqfs6RPR/KM0pUuQTm12KzUMyJxdt7yjKyuUvwFFUX Q==;
X-CSE-ConnectionGUID: GJ1G6B3iTQOtMOqrZRo/TA==
X-CSE-MsgGUID: g6ciPG2UTACX8mSK6XLl1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54579949"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="54579949"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 09:25:39 -0700
X-CSE-ConnectionGUID: 0ACi/m+uRMSBgfZpQsQ39w==
X-CSE-MsgGUID: THI1xzA2R569hzkjksvDig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="155913994"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 09:25:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 09:25:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 09:25:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 09:25:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJZNJvB0LNnXWx0AXGuq8FOfxJAvQa6LePAE76GjA9DnQ6HKri/U54uNQRTxxigBQ/GS5LvEFh1dlnK/5D8djJjdN/EMULzb7YLRR8v9ySheZYle1A7/q3DVQ0ihztbZF63LqyVN2mYyZSnrGyWeOg+jej0+vSHZMzArv7Rv/uvCVZjtS09wlstC3RGAegHtqmPfxyjp2MRt2fvKV/VGTTfCd52oOKaJrig4IOlD46+tqYH2DHeOEjgCKuRbbYzMUPDFeGMVAAS1zgSJwiuWY/4ogW1PBRvqX0UFFFii8XNT6XLjLoAIyjqdIm0+6GgcWGHmWtGDYKN8lQxE/ybW/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EsusX9j93KNFmA2ExLwvW0O+41pm+QwhaJEryIp+AO0=;
 b=zKw1FEyJ6Hb3g97vqyfiPoIDXQTJA6Q2W0hcaA/A1QE74m6NIDmbNRCqpHtSgcLp/FZSbppPYtrOVn3eSpF+DUKnoFuJ827OHKvTJDL11oZE1g7ysa7MMZ8jJvbBvioTH352M+Yv7e0zrQ9qCbjBHpl0V6zz5JqvUNmHKLQWgPA1Ye2gKAdIhnFuAFw56uQcaWNGH54cTBlsPEqv40GlT3tI6Wca00qjriQIkowhgctPRN1YOYZUD5OpJydWQMUHDxyc66FCpFe7syQrw42seGOWHBSLA2iMx9X05mV0veiv7LFt54PKxCUMBj65kCdh1eYZIjTiHgVfN6OKi82n/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN9PR11MB5257.namprd11.prod.outlook.com (2603:10b6:408:132::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Thu, 10 Jul
 2025 16:25:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Thu, 10 Jul 2025
 16:25:08 +0000
Date: Thu, 10 Jul 2025 11:25:05 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 0/2] Add SR-IOV support for BMG
Message-ID: <ygx4omuhjpsjo54b6d3n6xuy5dvmzrtf2iyjissmlt5drs6wtw@mpib547j6eut>
References: <20250710103040.375610-1-jakub1.kolakowski@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250710103040.375610-1-jakub1.kolakowski@intel.com>
X-ClientProxiedBy: BY5PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN9PR11MB5257:EE_
X-MS-Office365-Filtering-Correlation-Id: 15d4a99b-cafb-4de9-b668-08ddbfce55a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?djoXs8OFayc6fhNnujPI5s/mzA+QRToNj/Xx4oYcC146m8hevgUZQqKLWmNB?=
 =?us-ascii?Q?hfAg5xmMOzsqkPpvfyiNzFoJ76qjuSLXwS/nj3VdFUxi9fE4iyTeRWplbsAk?=
 =?us-ascii?Q?HPj7dTnA25meB03dwlva7JAW+Y8hoRXKYkg9To3O9m0AJug+pxkv497Z5DG7?=
 =?us-ascii?Q?HvajM+prB8Btb0nfsEVjdOqGqk/qqoauISlSAf837loMIKUAsNQQFPMcvg1W?=
 =?us-ascii?Q?5fGpGxZh0/JJTWMabCpLOlU0xGt4lkDuHEE/jUXRPLzaqUFQyb7yLN6HKSU/?=
 =?us-ascii?Q?cVVybQarakIbEvHs8uNPrYk0bHTR1pREyUrjqBaDIlZsehLL1upZ4dLMspUl?=
 =?us-ascii?Q?epbM3oST1yU/qZo28hnsqhNmAo7pFvTr0zpXGxxexf9mk6xfwvQcFTYllqGx?=
 =?us-ascii?Q?t9wKGP8R6z2DbJ29RdRCyZlDvLZ9ZjT9HVmF9FgP9j0MXvg/PbZ3RrgQ6Z06?=
 =?us-ascii?Q?hauDjF/+RV1Rk1ff7e50l1xH86skfwswKP5d4v2pKs/lpIrrJGdiHy9IRBHI?=
 =?us-ascii?Q?0TY+JZ1YyhY9PQqKZaPgG9dCLhwa7Vh3pGu5YeaI9Jg4WY1cIRdeMMKT7XeM?=
 =?us-ascii?Q?/kAYhs34JU6C9QOaVe1BjfNK9r7YXDeTqorRQ2obOSXfqRAnr+WNQJOaIr/C?=
 =?us-ascii?Q?xswl2pqg1dOwRZ8I7/E+p9bidI9vIOxfgMfw7Cd9OkHr7Nm81pnp0xAv0yyJ?=
 =?us-ascii?Q?Hfjjz+qVYQEwKs8Oi5gjEQTXcKm9fA+uL6Gsx/kJhdvr/q/cIrZOiWrAsJY3?=
 =?us-ascii?Q?akRfggrnNUVvhRizONIlUJFEQ3npU9M3yg5FajmnzM9M0KuoLMP3Ijr7wB8e?=
 =?us-ascii?Q?f6jQrCkRgA/NSl7iz3npXz2ZAbGSwd6LtrBV4l/qHE77+jy/P/94qbZwwZev?=
 =?us-ascii?Q?1KpHH54Ox0cKZEdxK8vj/4dzoUrgXV3JTeC9iu7yaKQHe1vkApijI91JhcG7?=
 =?us-ascii?Q?FzeYP3k7M4KqJ3buXrXzRoxsPrypUXWJ2VJWtd8WZa//s5ZecxZpt2Sbru93?=
 =?us-ascii?Q?x+s3kcztuf+fiKEl3io4j1Cq3QQk7Jx1aHav/gNoXU/2orPDhqxWAG1gtPY8?=
 =?us-ascii?Q?pT0/n5WWHIawA+AfPg7il9HGoJBO8nZNPYoCMAMmSkrcceUUXUEIrBQ54CsH?=
 =?us-ascii?Q?AUSruDO74xLFWZWbwczfymJDumswuow7weEJ4PrAB/QaNXfsKYftehDZX1w8?=
 =?us-ascii?Q?MxwB26oqkxRLYCU9pyVvija+RDOIZfU9DmaTZjmYJCb2RXUSORpYeaH/0jvU?=
 =?us-ascii?Q?Ynt8GfH6Pg+WdsEVw7ryFLqfUXn6RHqFBaKGWb9MwW8FI0KiGm1V96J/u1/m?=
 =?us-ascii?Q?G0sx/C5JTBZ11jLR7q4EiqYRjYZ2mp3hd5EnQeQUtXRi0uU0s2GMjyLs1B5J?=
 =?us-ascii?Q?5bySitECeaVSU/Ojof4LZfeysFMP3rsBkUAztwNuxEiNHOrhRFm2MHx/R1Hm?=
 =?us-ascii?Q?TFoUQ/BzrQA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RRE/UbBBT7wQlR0hBBCEIqKds+0i/xTYlv3t6wciXlze1XkBrJ6NQ6WIilF2?=
 =?us-ascii?Q?JuVAnabsTnxmN0qjGlBAdDEu3DdHPDM9qLDK4+ZITtsXyhj49NPlJ5P3kzKi?=
 =?us-ascii?Q?rma2JSVbLVq4aFP8YCye5ErcbtOcWSvxjuebhvXofDwNWb10dcefvW45oUVn?=
 =?us-ascii?Q?EY/XExuFz2l0Shl1iWVWy3w5uMDiFxlsydnKwBjs/+NhLBltU5SEs9T6pgs6?=
 =?us-ascii?Q?Xh69u+yVt1lw7yDQ+vTQRDDCycplRUr2sOqSEQmkyHOZIUev5gBPFiaX0mL+?=
 =?us-ascii?Q?aHqkiNmk3FGbk7/ocE/3XpbtsvOexxYAPdkm9b06PKO2/Gpsx8vwGCx+menR?=
 =?us-ascii?Q?mFMoE4LnUU+dMJf/2S7vwDqOQvU5eOPorYev+D38EklhTnHKONH9piuujT+e?=
 =?us-ascii?Q?oB96f6ME2ah3zxO2HvS7keNwwlCHXRzRVLWy+je4//W3R38KIoXL4Kbza5ud?=
 =?us-ascii?Q?ioumirJIMnmwnm85VfmbvE1sRKFibAgv6W69NHeUZKo54JThXsuWb0aNBPhA?=
 =?us-ascii?Q?59Rc66DV2LyV7V23dduw18LJrUn9C8a5WkiupovQ3fiQvWVVD0jQTA4Jntfj?=
 =?us-ascii?Q?S66XMfdZJkvI4uGR2N83jLu9qn5UODFbK7+qybYZmS3YM+aBVPppk/9hD8zr?=
 =?us-ascii?Q?MjSqRsBSvDMZph0x+1vA9caOpwOfjG9fOEIQznNjgEqgZk1FYfm7hVOzHsCS?=
 =?us-ascii?Q?1c8HUTa9xP2ZKCC/4C5sbZH2NsvORwvi0vIJs1IsDuXo939gECJCCAj6NArL?=
 =?us-ascii?Q?fifzcOvw4IcSZ9sVzfGIZWF5wZUPeEAQc2EKOnGAeQUuBCK1Tb3QySlvyl/1?=
 =?us-ascii?Q?bMULdKk9aWLiGGihslZ6iyuwGc67F2bGWAuSOUi6p//s4SzDakAXnk01pcO2?=
 =?us-ascii?Q?dI6aU/pP0xKIur8rnvEWc3R5oNsgSYcBz7dbyUTazOm84sqxVkgDKzDGRmwq?=
 =?us-ascii?Q?XGtbBVEtPGrIcZxUzM33WMQN+SH/WQ3zi+pgzFIEKjUuoq0Re2j+ZSSUNoOF?=
 =?us-ascii?Q?uV2Z/4SRGi87TgE6bOHQiZv30T8WCTOkoBShpF3tjfCkArETGfK9ekyBC8CQ?=
 =?us-ascii?Q?VMvO+R27+MpedVnK1oBGtkNt6e5Pf2tfBIroZOE4cF97VbFCtpv2NHFIyT8p?=
 =?us-ascii?Q?Mx7RxUHfasIgy7UoQQnlcynY0qWdr8F07jbFrA/6ztJCe7oTZMkTvkAo4h2m?=
 =?us-ascii?Q?OQmhaBW861NQo1Z3JemMUCuocAGCeOa1vkXF/Y4xalDhLPYdtV52RcXWcG22?=
 =?us-ascii?Q?9sj39i8r8f0llzfSfeFzBMguWVDJfrdG95SAM8t9a4i506VwiHAKmlEb+gc2?=
 =?us-ascii?Q?MMQhIvWxSqyQPCc5swA7lZc2V96Og/PX87imuVEMa2I3guD2SgjJGbTfXS6Z?=
 =?us-ascii?Q?cI3df07nRGMcE7bH3KiWFUQlCtyQe04F1vP6S3zA9cUCgAH1ZfN07odTweT+?=
 =?us-ascii?Q?+yxuqUPz2YdCDLfMBhJ/QLqNE2lsBxOG68pju0E7mxGV9J1NhEDahfao61FO?=
 =?us-ascii?Q?quiPqhBxreGvYogqf6crnERjdPsrzqn++Mu/cIgU61VT/0QZShnSnZjqBCDR?=
 =?us-ascii?Q?ILNJ3jC0qywM+3znlj4VsX5bR/UXJ9zO/ud3XqTfAKRecnrVN56DJpZgU3p/?=
 =?us-ascii?Q?wQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d4a99b-cafb-4de9-b668-08ddbfce55a5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 16:25:07.9466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z5ThZ0VrG+AT6N+X3JxyYyZnemPyrT71okObhu831mRW4bDDvFLE7awylaHXjMUk/d9pmUSRXD130hTz7XVlCfPZ02tYzkWTpnPV8xsxNmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5257
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

On Thu, Jul 10, 2025 at 10:30:38AM +0000, Jakub Kolakowski wrote:
>Add SR-IOV support for BMG platforms. Exclude VF from using WA

well... as long as the card in question (combination of HW and FW)
actually supports it. Not all of them do.

I pushed the first commit to drm-xe-next as that should have been
applied already. I'll wait a little bit for the second one.

Lucas De Marchi
