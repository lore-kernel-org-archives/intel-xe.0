Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447F6CFD318
	for <intel-xe@archiver.kernel.org>; Mon, 24 Nov 2025 16:58:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0777510E30A;
	Mon, 24 Nov 2025 16:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jBfxRJtp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDC010E30A
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Nov 2025 16:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764003516; x=1795539516;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GMLk0EyAS/S8PiHhUJfzYVpnJJIHc/eLdQULFQhAaTQ=;
 b=jBfxRJtpN5Qt0fuf0bJ0CzUStgEEoknjZAT8XNVLWUczYWYEaWquw9vH
 uj+lF9pGrEV+QAl1cd2yht48HmJIIAHzRQG7qxXMEOSnIRVopH67+dbYd
 VwpVlheqG7FTiy7U5yMb4gjWTEXSGEqfHveF/v1XGFZe2nXpbv3XNlCGU
 c2RUTlHKwCim8CW7NPUfT4XE5t1frH/tPFL4Taflz/PepZmoeMfnLw85j
 DPhNOLUvpNtTuUnZov0vAi+ODf/LU7cdEpJ+ngpcBgk39OgMnemsZoAbn
 m/fNWRtgTach1C2881DT99V9FEQqyKsSSK+TxqeQIzNvCCvFZFqLnfkBG w==;
X-CSE-ConnectionGUID: ubO/jbvgRUuJGN2rcYFtbQ==
X-CSE-MsgGUID: TUVpgBGwRLu15GeGv9ih1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65959190"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="65959190"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 08:58:27 -0800
X-CSE-ConnectionGUID: DnZhHvlfSz6kef5H9U6Z/A==
X-CSE-MsgGUID: pzMZd7zsQq+ZbTJbLIhcaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="192262389"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 08:58:26 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 08:58:26 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 08:58:26 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 08:58:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yaJZvnrkJEPd/8v00BtgKNOUbwPe6r3Sau7HrR/hdatEV7TrUdtmh3cpeT7PRFv9SksDfp8qocDYVSepm7XEL5hg+lMRXAOUNKd0dORUU+XBi4WO1hesV3j8VGfAHPKvaZ4HkVbyfuXVu2EPm4s+fEpwSWOKu1opYfV+bNTafI3JyjOeK8eHSYq4qnWxzzisEPWG5f0PD1b3zCy2ykeP1f6SkgozPktKyGttN+jk12M90D+IGmt588GJwQkanL/7DH8n2WSY4wp4k+z65YuZV6nYpvzyJ14MwgHelYE/66lo8fYcJq7hlQYAmCuB/pIFfL4JZUMFO6IB5mJb5NeNUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9s63ZpVsVoc8qfm8a8XETg3Ea07CyI1zkRdjwxQ+s+4=;
 b=x6OZ8nZnDKkjFFw3s27GnKjFtH8Yq3QItg8sIMAYiKifY2TqWOCxRoE6oil0d25k4FGdo8wgMD+Ob4Tq6Rl7hxo9nNyXQLmgYrSYJmWX9r1IGTbfn949vyWMAoj7cJD8TcLvv8sLlBeyt0tg71lEkZQKbOgT9KrQvlxUDAZRIsFhnRryeLOpWt7ohJ5I6ajl3O3+x3QBv6GpMmMemtcTxjX9yOujk9qgDC04VzT9sp0PlyLWXxqOhsT4iA6No77E03ZkLiINOUAgLpzv5pvMXZ8yGGdiB34X5+5GvpbWdQLfc11Gt38QgFzetExk7u/A0Qhpyw53hsWoQ/dLrXfHqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7940.namprd11.prod.outlook.com (2603:10b6:610:130::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 16:58:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 16:58:23 +0000
Date: Mon, 24 Nov 2025 08:58:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 4/5] drm/xe/svm: Enable UNMAP for VMA merging operations
Message-ID: <aSSOrBXaWb/pn/so@lstrano-desk.jf.intel.com>
References: <20251103060957.957760-1-himal.prasad.ghimiray@intel.com>
 <20251103060957.957760-5-himal.prasad.ghimiray@intel.com>
 <aSIywKH7Sn9uV4Hc@lstrano-desk.jf.intel.com>
 <f85e4257-5235-4fbc-a4f9-818ce7476c5a@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f85e4257-5235-4fbc-a4f9-818ce7476c5a@intel.com>
X-ClientProxiedBy: MW4PR04CA0249.namprd04.prod.outlook.com
 (2603:10b6:303:88::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7940:EE_
X-MS-Office365-Filtering-Correlation-Id: 56e0b117-e1e9-48d6-a991-08de2b7aad76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?9+m9UN7nPtGsqTWS9hyU/32HQUVbJTWc+hpIjiVBw06Nfz/lzkDqKdGyoM?=
 =?iso-8859-1?Q?j9rYQIcV7zafHiy2xSHbdWno30tOU5RTc0/odn8TVp74XkX1oxJhBYemoT?=
 =?iso-8859-1?Q?xehL6wS1OKLfbp6Y3mYixi2GZqYDYKyZ3z4r6/I986i6lHB3Ni2CfWG3dX?=
 =?iso-8859-1?Q?R8p4L4hwvcF79+qWhyPQTrasipt28aVs0WuyXYG+WJYkGfXzlYRUNopdE3?=
 =?iso-8859-1?Q?AlDWO1TTs5IYjlr3jxZVsIOQvJ9hFdYmGa4ACWJPa1K7Pv1JZvzP2IExfw?=
 =?iso-8859-1?Q?3W4T2uwv1TiX92oYInk9+hX55L0ZxBJiugpiEddEJ1Gv3qfYPsLR93jv0B?=
 =?iso-8859-1?Q?PH2E4Tc1zyTyuuCnPWnn6w1My7MLSGGrsqoYbeKG7JXAxTDgs7ic/zI9qT?=
 =?iso-8859-1?Q?EoV2TIJX5yEzEXklpbpwaORzCNCEFNfgQeJ1QflfMJbJMbK5HE5SVALzAJ?=
 =?iso-8859-1?Q?qgysEszQtc2ZzMcq/VW8ntYzq2nUq2d+jf7KXCx39HT7axJRn6zEeRK+YQ?=
 =?iso-8859-1?Q?U0sXfvdzzPllZ6yJpy3lj3O+5GiS3vQuKvyCPgbe/v2Fbe6hOhk26rKt0l?=
 =?iso-8859-1?Q?mpkm9cVUVZWz7wRBlloTxhSbzj8w5me1vT4qq9YLLFMnH+iBfjL1Y9nRh4?=
 =?iso-8859-1?Q?2fW8C6lVsJwplFfTgtamgVgXjyBq8Qj5Ojp6lHQlyh9cDZZU1dYLcoSjZM?=
 =?iso-8859-1?Q?SfaSClnX/7RDy27eN6J91YnYkdtIJJmPoa/Je+y+ZDKlK98qGOBTqrDKWz?=
 =?iso-8859-1?Q?8ByEKnAOkzSm/Fs1AffHuOsYRzgO5+8IB/27xPjrWtFwgQ2z3dcLXTASkc?=
 =?iso-8859-1?Q?zZ1PAqW7V9AzthAIlHVzNJRywBrREul7ejdidSDLjOGemNoPZPaJ5nY1RL?=
 =?iso-8859-1?Q?f29mkloBm3is/c6bo4l1fvuC8mnHYkh15Meb9eJAqc6qN7vwegwqGpwP6p?=
 =?iso-8859-1?Q?88+aDbHC5fh1kurqRkf9ieSYgMKZDEy3FLgBY8H0sEPqi8okd+xRJ8UKUU?=
 =?iso-8859-1?Q?EPkshhUgyMqj+5NOHaqsGhSq1WMSPc9JkukpMzu/M4OIhWPO6rx4fVOulX?=
 =?iso-8859-1?Q?LlInnmsdiMWPf8gm7/B1YPrLcoxMVS4hW7RdlpL4w7T6+bYirzbHzZ4gV/?=
 =?iso-8859-1?Q?P6uCOHI1iVMZC0VLnr86l5jDYz+z+6uejGj4DiP5S/GAZzOhC8tYQPPb+x?=
 =?iso-8859-1?Q?H08RjmmhK4xTzOQLHiM3jrXmliTfiN+n8Qc8cxjFRHOVxsug/4dYjkTcXc?=
 =?iso-8859-1?Q?5vReDre6iwK5rNs7U8BQMqOcEGTopLFk7UFzzfAko692LV4cGQZrezbfTY?=
 =?iso-8859-1?Q?tFZX8W/MfJ54hhpP4c6i87wybO0BXamGHn0wanlUe7jSl68Yb7NWjeunxh?=
 =?iso-8859-1?Q?SKYxJvGFeCBudKPc/KKHx6S57bBc5AEMBnwoXFO8dPjyTgIvlmdye7+bCu?=
 =?iso-8859-1?Q?rJQRfA2xi2h2abFPp8YOjoeSf/DlbagUXVdOiA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QNwxmUy5ti2cAqYxEEifjN82eyIOr3E7Rc38cIZv2aL8CRFHb/NXEKO2gu?=
 =?iso-8859-1?Q?S4zfdrMC3Joy3cF9KBAyXj9blULH5VitEjGMP+xl+KdiXQ0JNfbTaY8ppz?=
 =?iso-8859-1?Q?sNopJdl4bTJgbJnYEoXvCSgB/KvM/dWGxYtvfFJSRLVzRCb5hRmGlg/W5y?=
 =?iso-8859-1?Q?dH/Y/gZraJl/a2Wo0KBooG927Le4lx7KPVHw90pSlBCr/4UrC97HnRPvD/?=
 =?iso-8859-1?Q?0ZmLwbQcY3qfz/Qu9/3XTLrMmDJrwve+L4HgYjLL/gVVHDAwpDe94MgGE2?=
 =?iso-8859-1?Q?ll3rmtoF5spazyadfLxRuxDNoburyyRYs70Vc0NyXoEEGkUj7vd2KW0QqT?=
 =?iso-8859-1?Q?hqkFyqcNKksMOXeLgBp5JGoP7C27a5l9W+kClwTrn6GkZtTVw8Q0syIuSi?=
 =?iso-8859-1?Q?xu/9/00b0Hnbslj7gMO7UVQ8vlYz9U3TpGECsjNUVa+AUCsDW/9D3YXhLQ?=
 =?iso-8859-1?Q?4smQsuWnykJ4AUYrnBgkCQG9XAgmOGK5B7VT/iEYMzIdE8rPzx2tFegx/I?=
 =?iso-8859-1?Q?Zc9aYBEEcw2UhKKaq2lrW+uWwfLoBeBnK7ElGJn6Fd8cbOZjXyHoWIyFaA?=
 =?iso-8859-1?Q?sOVAiQ14Ab77La96nZaJUa0dR16tvAA7dG37IDhAlNHkxQV7ZLwJepLLw7?=
 =?iso-8859-1?Q?5wj6iDJBGCLTsmF0vuBhXb/OWJBrmNr2xo+i1C1yegfNfYb7xDfM+aEAiv?=
 =?iso-8859-1?Q?/w5NAEZIvhgAK0OWryP3mNrKCxKwU5e1xq9VNv0Eury+gXhLxZoKJnB3l7?=
 =?iso-8859-1?Q?zNlacn+uYDFOFP2cneko/lYgse5wWHUsIfI3SXWkDLtvG0AsfkZB/HwHxi?=
 =?iso-8859-1?Q?3Hlnv7K6QK5eVwJX14L/pMPgIIAoGz/MepsAE+1BfAW6vwOgVhhgaH3Ksi?=
 =?iso-8859-1?Q?mmQyfyYW5TbnxXsxtO3ZFTlxKPLGlLYCaF/KQY39dSDg5Fqinwv6WwTIBn?=
 =?iso-8859-1?Q?RlsW6mbIvX088W4tJz6hA6SIvX04XFAH/kaCDq3jhDsrTDBmdUsYb4DWL8?=
 =?iso-8859-1?Q?GkoL1DUDOguMoZkLc/JwkjQSMxzc/Rnm5Eri85in9nYYfXYycmX/oNiIdn?=
 =?iso-8859-1?Q?W9yx+nj0XYJNH093Jr3flN+bk+TdJLo0cu2mQcslK6o9jhvEk2Uxus8HXE?=
 =?iso-8859-1?Q?Cbg/oHtxkc3AyB1QG7/rOgcMjKPZhb7XH5ToPOhU1M4WQ+Oqb3rS97exbe?=
 =?iso-8859-1?Q?cv/mUJj/MaAJQOhH36CU2AUmo4RpS4UPjRW4iRf/DC9j9R4DvaT4szvkQR?=
 =?iso-8859-1?Q?HF4Hbf84D1gKt6ODJWtZ6lp9wL8yc9ZFT0hTDj+4f1rBEN5+fk2Et0ZIZ9?=
 =?iso-8859-1?Q?b0XU8sdLnjYNxSJyAHKf9+GVDBJ84oaE0z2KAHaZcwiAEuKtH9i2jHF3Wi?=
 =?iso-8859-1?Q?cEfNlti3gNbrnPnKrnW6El87xT3YAMj9u7M7V+dMqko5S/Hvb1dVfhgIao?=
 =?iso-8859-1?Q?jVWu55DYGc4p7Ncnup3qqReewuaZeh7ctItEOvZHjsRj/SDomTKCAp/MNM?=
 =?iso-8859-1?Q?HR8yOT9UjcmL6UaYDVRVC+FzcRa7gicek4DfYv51MJHptcCA9LOz/mVTR6?=
 =?iso-8859-1?Q?miCO5pUl+khFWL+9GRbIUNDcuU6a/HjE/uVnsToSMJQWLxiKt9hQ4MBSP+?=
 =?iso-8859-1?Q?c8euXzDRE8jN7EJ9ZkjFIATLmt3Ol/2P4E/nEiexvfEP00QzQr8wZ/tw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e0b117-e1e9-48d6-a991-08de2b7aad76
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 16:58:23.0849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k3eKbhOcDHvgXSUgMnwZ5vjVt7KKrIq4baAGbpWc1u9e9LaDNZkUisRyTfMwFtv217IIM6CuDqgby8Qj0756nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7940
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

On Mon, Nov 24, 2025 at 11:31:07AM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 23-11-2025 03:31, Matthew Brost wrote:
> > On Mon, Nov 03, 2025 at 11:39:56AM +0530, Himal Prasad Ghimiray wrote:
> > > ALLOW UNMAP of VMAs associated with SVM mappings when the MAP operation
> > > is intended to merge adjacent CPU_ADDR_MIRROR VMAs.
> > > 
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_vm.c       | 10 +++++++---
> > >   drivers/gpu/drm/xe/xe_vm_types.h |  3 ++-
> > >   2 files changed, 9 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index d78eb95a954f..12354e03c3e2 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -2244,8 +2244,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> > >   	switch (operation) {
> > >   	case DRM_XE_VM_BIND_OP_MAP:
> > > -		if (flags & DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR)
> > > +		if (flags & DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR) {
> > >   			xe_vm_find_cpu_addr_mirror_vma_range(vm, &range_start, &range_end);
> > > +			vops->flags |= XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP;
> > > +		}
> > >   		fallthrough;
> > >   	case DRM_XE_VM_BIND_OP_MAP_USERPTR: {
> > > @@ -2727,7 +2729,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
> > >   			if (xe_vma_is_cpu_addr_mirror(vma) &&
> > >   			    xe_svm_has_mapping(vm, xe_vma_start(vma),
> > > -					       xe_vma_end(vma)))
> > > +					       xe_vma_end(vma)) &&
> > > +			    !(vops->flags & XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP))
> > 
> > Do we need similar change to the DRM_GPUVA_OP_REMAP case statement which
> > has similar logic?
> 
> 
> As far as I can tell, REMAP is only possible within the
> svm_garbage_collector. In that function, we perform the REMAP operation
> after the range has been unmapped. Therefore, the REMAP should proceed
> safely without this check.
> 
> 

I believe this is right now that I think about this.

> > 
> > >   				return -EBUSY;
> > >   			if (!xe_vma_is_cpu_addr_mirror(vma))
> > > @@ -4295,6 +4298,8 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
> > >   	if (is_madvise)
> > >   		vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
> > > +	else
> > > +		vops.flags |= XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP;
> > >   	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
> > >   	if (err)
> > > @@ -4371,7 +4376,6 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
> > >   static bool is_cpu_addr_vma_with_default_attr(struct xe_vma *vma)
> > >   {
> > >   	return vma && xe_vma_is_cpu_addr_mirror(vma) &&
> > > -	       !xe_svm_has_mapping(xe_vma_vm(vma), xe_vma_start(vma), xe_vma_end(vma)) &&
> > 
> > Ah, ok this answers my question in patch #1 [1]. But then in this patch
> > should we also remove the similar check in patch #2 [2] in which I asked
> > the same question?
> 
> Thanks for pointing this. Will address in next version.
> 

+1

Matt

> > 
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/patch/685118/?series=154832&rev=4#comment_1267065
> > [2] https://patchwork.freedesktop.org/patch/685119/?series=154832&rev=4
> > 
> > >   	       xe_vma_has_default_mem_attrs(vma);
> > >   }
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index 830ed7b05c27..7578ccada2cf 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -470,7 +470,8 @@ struct xe_vma_ops {
> > >   	/** @flag: signify the properties within xe_vma_ops*/
> > >   #define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
> > >   #define XE_VMA_OPS_FLAG_MADVISE          BIT(1)
> > > -#define XE_VMA_OPS_ARRAY_OF_BINDS	 BIT(2)
> > > +#define XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP  BIT(2)
> > > +#define XE_VMA_OPS_ARRAY_OF_BINDS        BIT(3)
> > >   	u32 flags;
> > >   #ifdef TEST_VM_OPS_ERROR
> > >   	/** @inject_error: inject error to test error handling */
> > > -- 
> > > 2.34.1
> > > 
> 
