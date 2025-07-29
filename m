Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95886C87FC9
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 05:28:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F3D10E1C3;
	Tue, 29 Jul 2025 05:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DeSKyw18";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754F810E1C3
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 05:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753766906; x=1785302906;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sijui1/X1G0khUrvUg96tuWUznuh5u4jQBli7D3knTU=;
 b=DeSKyw18uiRPI4s+5YXq7tRcLGjVktwYoBf36b8qaXI50dH3MjUOXO8K
 8eisHBxhFCLyYztn+qBJydnPdjZx1FdFi6ywz05976yCjAPJPqR7olDzC
 NMmFMe8+PDdbSkvcY6ic+q5E+5n1++sq6lsxvc3GSx6iwp75yVBPFsi1A
 Me6y3K6zJKiWGTFrmYwk2i43o2aAGHKja+mr5SFXfIHN1PPou24J67F4r
 VfjGgrqohTBjSvvachc3oqALp4oNsf21/OUyNI8wZzG29mtz3lMi4YcGy
 qumpwZFP/aOvrI4Wp2FnycIAqCDBzlkzyXVlqlS4qIQ0Wwvtw5ji5d7CX w==;
X-CSE-ConnectionGUID: 8SPKH7gGRteHahral2Ka2g==
X-CSE-MsgGUID: y927B3oJSZKnZJVR9LWo5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="78580663"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="78580663"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 22:28:25 -0700
X-CSE-ConnectionGUID: w36YoLtxS2aa8FufUKFZXQ==
X-CSE-MsgGUID: u4sHFKzhRYqEFuQr6pzPqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="193593118"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 22:28:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 22:28:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 22:28:24 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.77)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 22:28:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hqLe5K+XIrOxXP3NjNphenyETdSQ57qLau2IzCiNO/6xyP84KyZikNbLyg0GIP84UrvpKI9NJJXIlfNne7O6TFhWtEgFc9DN4dinCcCdNmxRO1jJ1pbRKXucm8H57p4U9ZgjIYhpTId/Wkw1IBuDUwnRXYcDopIHISq6+rK5UBcq91zZVwZtrLd5dJySd9iErII2+5LWgJoL3PMHzZ+ldzb+gfrgWUri8/hSu3Ybve2kYBvavLELXE6duJzKO5AEMbWxLiHwmAd4Lgxl1DNCoQ6jToA4NC+Ayf6S72QTJRT2kGLuOFLntdSMog1j+MoI181lpCoCrVkhfJrbbJ6rbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r30yMX6LMf6O0GCapMVrqOgfXAR3QfUjNAcV2bI7esA=;
 b=c40Gcc//CpY7ObCpb1G2doZb7dBwBtmMPA7/B3KrrVPIP51G3vbTlRkOx7xsi1dwulWSEaEXMPYMBDkp7k2AN5BdITGWzgsnRlI9g4UfopQcxRb/tl9W2K4/MLG/nIbfweHkztEVda014aQ1HF/4EMWpetRHcg04Vr3H1RE3q0sFKWzniYIQt56x4tzeODGJ+/w7+1DvVqsALTaSFGFhBk1qDI/SNFgSEHVKGja8/wQ8i36ghhzkYDB9VM6VasBEo+D0ArS6q6/olli5LnLL4znJt+8Vu9x6fJwTBCZVLZDywEg2wktOxWOtYxU9oGRf38nNZZjyYojUIPJLLseaLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH3PPF383C22AA3.namprd11.prod.outlook.com (2603:10b6:518:1::d17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Tue, 29 Jul
 2025 05:27:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 05:27:41 +0000
Date: Mon, 28 Jul 2025 22:27:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 20/23] drm/xe: Reset VMA attributes to default in SVM
 garbage collector
Message-ID: <aIhbyidHjPVrzutO@lstrano-desk.jf.intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <20250722133526.3550547-21-himal.prasad.ghimiray@intel.com>
 <aIKqt67Ob0sYuDIO@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aIKqt67Ob0sYuDIO@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0230.namprd03.prod.outlook.com
 (2603:10b6:303:b9::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH3PPF383C22AA3:EE_
X-MS-Office365-Filtering-Correlation-Id: dc10fb18-f640-45bf-2aa1-08ddce60a371
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xHBZqwgeNprerz8DFG7MCjGi4Oy5iltfSajHdY0e94SZWtYpeEs8xn52ypRH?=
 =?us-ascii?Q?6w3krNpWkb9xpY+xqY+lDLhNQGvlZM7u+LyNg8ucPf2oWQc23rz5t9vXQRY8?=
 =?us-ascii?Q?Hvl/z4yBM4wMtWRJNwe9vHoCBSqsjBPKmUc9H/vo8M5chQ1GOEXmL1IyfBfQ?=
 =?us-ascii?Q?YN+oaEM3H4vvq9YXgZnAdwJqMIkL6zMltHDByu/nIgfYXPhC8T4VX6TdgZl5?=
 =?us-ascii?Q?+Ko0Xs4NPdeqV89KcQdmlR2G6vz+YIzpb6nE4cgmYAjhs49tixObfQaiN8pj?=
 =?us-ascii?Q?MPuBEsxkk3IsQBJdeEHKNtGgXETfUE8CV8z0I6S4RR7RQoXmGN1ajKVOhrPd?=
 =?us-ascii?Q?BnRfhDkES5PtNNs/e6FX27pW0KudlzG0FVv0VEdewlZnIMH0K86RrF10FKtU?=
 =?us-ascii?Q?nojDpFERaO5yPI4054TJmK7kcBog+padFSnjQnC8NgHn7C3ZTqfZlRASVyF1?=
 =?us-ascii?Q?7ZfcqN8ud8DQEzzdmIj4tuALP5/DSiMmwzpoPEaHyajZfvsu7lmcVNRlrXpY?=
 =?us-ascii?Q?UKy+kx9L9Ri8qHtAYSTWxzwkzgpbZFN3mHXT+sg64lhHbE7oFZT9JFIIFybF?=
 =?us-ascii?Q?rdxUfd8Kp9LhauFkBJTRVCd896ikM92rh76JgUptCHiZDk7x9TiEcj4qfy3f?=
 =?us-ascii?Q?aFK8FAfmyi6I2OVDxMCSRUUxQSJNtlKtJJav7rz4pLOcAIkfpJ1+iFp0YQyp?=
 =?us-ascii?Q?Gwo2p8yvCGARJtS2i2a/jvyM3pM6E7zWNWslBRFfaJicj4TuU+b/Yf7aGi+w?=
 =?us-ascii?Q?EKP7Ys0NqAsmT/+rcsViOpvdOMbHqsGh30wgHOm8UNTkvhsJSzCIVT01FX0l?=
 =?us-ascii?Q?2XbNizTA9zdsKqxgseAimntTGHcQb1HoGWkbkrjVKQqq4tgFaxxnv4Tw3Fcl?=
 =?us-ascii?Q?yegULCcMtyGcQf5ixcKzD2C/l2DNCEe4Yn0z2yXzqdetJnF+r+/SvWWYK4ey?=
 =?us-ascii?Q?u3HTM7hhDL5iYWSqLQWLJRyRe2FQkiILcXJDzVzwt5b3OFLhMkodqS8JB2M/?=
 =?us-ascii?Q?pCM0ao+3tbArvIQAQXg+1jaH6UAsKyE61HiU+yXE6hzCXtJI+snm7ppFiPkE?=
 =?us-ascii?Q?nBklva5kxs/1T1INckj4H1re+D67fXCFzNEKjIyM40MPSMK+zYgLzsgfXDs8?=
 =?us-ascii?Q?mJi6292VHJX9/dCVh3l9R8VHrxB/3P9W58P0S+mItkk+pjAWgsH7TJONlKy5?=
 =?us-ascii?Q?sZqFLJFTMvI5w5UJgSGSTE/bM/Sz3jn41orTSWEE34h6FBJbMOOixicjVzUx?=
 =?us-ascii?Q?EuzuCOkXG/BFCY4MnkKz/qbh+4zgnrDKIJR8wlwCx/FJaxmc23KapEaadaUE?=
 =?us-ascii?Q?WqT1K6Vf99VmVwQBKCbxqFFmIt40uX20OzfX3JDBf/38mQFZPVuTkayPHu64?=
 =?us-ascii?Q?3TSbc1r84rYom6HIxubqMYOHpiba4JSm5R3aCx4mKL2oF5DcDFL7+90q+gQL?=
 =?us-ascii?Q?FjLtgWEcPvg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?54R57x9/AQtktLqLSn95iqq62ssvWrgPRGBtxaYpqhRW+AUi/Y8eOYx+LpGq?=
 =?us-ascii?Q?+w5xkWH8OA9FrOBjIG4lVDXPz/YHVenOIKq35mpNKfNqJuTSSb0BQPz/4g0w?=
 =?us-ascii?Q?CUIJShQFtKEni/lKyUWqVuGpzOP5F34rV8hG26DqCLq1zoAM+AX+EPNLwHS9?=
 =?us-ascii?Q?chfA4l0rFrmfRTMmKj6Vq1FIpSZfhF0tZvxMmSUGxVRlnRnRLwwTTz8IixBp?=
 =?us-ascii?Q?oXfk/s1MnDuAukbk8g4QCA0uDqOrZxXVLC7jCd5Oqj65Z4AwFVYPXlOUwlOD?=
 =?us-ascii?Q?5/uDdx+DpMugUurzw+ZIvwRc22e+6NqvG7w06m0zqfcDeuLdPC2KdAqMSaMD?=
 =?us-ascii?Q?d6u0l4Is3z/z0yGYeaQfHbULNnH7/wDsqUfDVXLfK64S25BYP08FxIcIRHnQ?=
 =?us-ascii?Q?7sQPmyXZt2bE2brw2GWFCfHNEKVm1ezO1Mpm+38AqScpNTkIH++ecxECsxQE?=
 =?us-ascii?Q?K7AZpy8ieiIgRZLngN8iDFtPCktt1dwJSGGl2bEt2otxlv5n+WVfqx8Ma4/x?=
 =?us-ascii?Q?NYCsE3yljtFi036tuERKxs53AZLO/e7sKphKF5njG4UCncEUxSdRH303RMsQ?=
 =?us-ascii?Q?J7byrOi+VH6rTm10KOJYcKjRP8kGN8GY1FjxD4S8ReoSlnXDY4KBTmMygt8F?=
 =?us-ascii?Q?YMOeucKGt8sKGzwqrQWDXOpSNCyXzPyJz27wIzKEvbGtHK+zc2j/39VYImPF?=
 =?us-ascii?Q?KFL6CaOwrDwye3R0jEP7bSVF00H0GK5qOenMto8kVEiXk6w0yaPLY+zudpH1?=
 =?us-ascii?Q?T+HM12VKSZkcIutNYSRY7caTABleU+qIeGUPN1kypwZnj5ncfnTSPPCZ8hjc?=
 =?us-ascii?Q?AUu3sToAHvLQoK6TS21/lgozvdI1x1drFuovK8KJqFuIx5E4AkJG8ZEGt3qY?=
 =?us-ascii?Q?LynuSu8k428mUG0gliKXT/feuKHTKBux06Ridk4RzuvX9RIIvrRULs6JiW2x?=
 =?us-ascii?Q?r82X+L4gogBUEjA0GUTJ3qo3RbbWOP9IL//EmIv0NMUx4uH+1AvHylrww9yA?=
 =?us-ascii?Q?IcBe+F7Hiu5eMNBeXr3J0Qr7edSWgwVn3Ni8LlMnDiPXfIzl5caUjGLORpeT?=
 =?us-ascii?Q?a9QErBPyjgvI/RmKXPRgRQ6lgYb78zPNOnOYMnTwoGYD6vD7ZF2/paNGGC86?=
 =?us-ascii?Q?trhmBDBQbL8zC+kGkQFtxJMu3n0tbkIgjhovdlJGkowy7RIRzR1k2DQCAv+0?=
 =?us-ascii?Q?Q0mnW4Cg+7P+avIJvsvxTQr919Sj0L80gnehCNMV/EfLD42y/AA2XQFM/KwH?=
 =?us-ascii?Q?qGZwD1TF4GBJe9gj5nedP2QpJLMUlipkPVEp3wLGd4j+lFbrLMmfmITM1XQn?=
 =?us-ascii?Q?6paXzOWjYo0HbDiCHPSBwNkOZ7gx1DeqoZUx4rXgh20Bj5tdq274caCq2YYF?=
 =?us-ascii?Q?yzc/bOKbCQEiD87UHzSPWrPek7sugzYeNb9dl3QN3EQdL9UlISzsbcKqmy6U?=
 =?us-ascii?Q?o4+ewRtuDTpclEMcLPZ757h24egjCe7FWdnYMDAZaPgSIPnF3FRVFugveI8x?=
 =?us-ascii?Q?Iqz1PqaLDzxMskE3awl4m6c2o2WV4GrnWVfw6S8AzBOCfW7nVULpFpcisRNO?=
 =?us-ascii?Q?17xzipUrIjlyJXl97GSjMx5dne5WQo/x3uSbPdfDT2xO+HCEWiF/JhYLNSZJ?=
 =?us-ascii?Q?YQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc10fb18-f640-45bf-2aa1-08ddce60a371
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 05:27:41.2315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2Fldfpp2T95ZbJMKnnUB6hE8IwEMgolD7vc/jb4HoRY/rEUBNpF8A4ZJgs8XmYqKKRUC7INYM0EewKYxr2eVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF383C22AA3
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

On Thu, Jul 24, 2025 at 02:50:47PM -0700, Matthew Brost wrote:
> On Tue, Jul 22, 2025 at 07:05:23PM +0530, Himal Prasad Ghimiray wrote:
> > Restore default memory attributes for VMAs during garbage collection
> > if they were modified by madvise. Reuse existing VMA if fully overlapping;
> > otherwise, allocate a new mirror VMA.
> > 
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_svm.c |  34 +++++++++
> >  drivers/gpu/drm/xe/xe_vm.c  | 140 +++++++++++++++++++++++++-----------
> >  drivers/gpu/drm/xe/xe_vm.h  |   2 +
> >  3 files changed, 135 insertions(+), 41 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index ba1233d0d5a2..79709dc066b9 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -255,7 +255,18 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
> >  static int xe_svm_garbage_collector(struct xe_vm *vm)
> >  {
> >  	struct xe_svm_range *range;
> > +	struct xe_vma *vma;
> > +	u64 range_start;
> > +	u64 range_size;
> > +	u64 range_end;
> >  	int err;
> > +	struct xe_vma_mem_attr default_attr = {
> > +		.preferred_loc = {
> > +			.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
> > +			.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
> > +		},
> > +		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
> > +	};
> >  
> >  	lockdep_assert_held_write(&vm->lock);
> >  
> > @@ -270,6 +281,12 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
> >  		if (!range)
> >  			break;
> >  
> > +		range_start = xe_svm_range_start(range);
> > +		range_size = xe_svm_range_size(range);
> > +		range_end = xe_svm_range_end(range);
> > +
> > +		vma = xe_vm_find_vma_by_addr(vm, xe_svm_range_start(range));
> > +
> 
> I'd find the VMA outside of the svm.garbage_collector.lock.
> 
> >  		list_del(&range->garbage_collector_link);
> >  		spin_unlock(&vm->svm.garbage_collector.lock);
> >  
> > @@ -282,7 +299,24 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
> >  			return err;
> >  		}
> >  
> > +		if (!xe_vma_has_default_mem_attrs(vma)) {
> 
> It seems possible the VMA could be NULL in error cases. I'd check for
> NULL and error out.
> 
> Also could this code be moved to a helper? Internal SVM seems ok, in
> that case xe_vm_find_vma_by_addr could also be in the helper.
> 
> > +			vm_dbg(&vm->xe->drm, "Existing VMA start=0x%016llx, vma_end=0x%016llx",
> > +			       xe_vma_start(vma), xe_vma_end(vma));
> > +
> > +			if (xe_vma_start(vma) == range_start && xe_vma_end(vma) == range_end) {
> > +				default_attr.pat_index = vma->attr.default_pat_index;
> > +				default_attr.default_pat_index  = vma->attr.default_pat_index;
> > +				vma->attr = default_attr;
> > +			} else {
> > +				vm_dbg(&vm->xe->drm, "Split VMA start=0x%016llx, vma_end=0x%016llx",
> > +				       range_start, range_end);
> > +				err = xe_vm_alloc_cpu_addr_mirror_vma(vm, range_start, range_size);
> > +				if (err)
> 
> On error, I'd print a message and kill the VM as it shouldn't be
> possible to fail aside from a memory allocation failure and we can't
> code with errors given this can be inside a worker.
> 
> I'll circle back to the rest of the patch a bit later.
> 

I think the rest of the patch makes sense.

Matt

> Matt
> 
> > +					return err;
> > +			}
> > +		}
> >  		spin_lock(&vm->svm.garbage_collector.lock);
> > +
> >  	}
> >  	spin_unlock(&vm->svm.garbage_collector.lock);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index d3f08bf9a3ee..003c8209f8bd 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -4254,34 +4254,24 @@ bool xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool
> >  	}
> >  }
> >  
> > -/**
> > - * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
> > - * @vm: Pointer to the xe_vm structure
> > - * @start: Starting input address
> > - * @range: Size of the input range
> > - *
> > - * This function splits existing vma to create new vma for user provided input range
> > - *
> > - *  Return: 0 if success
> > - */
> > -int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
> > +static int xe_vm_alloc_vma(struct xe_vm *vm,
> > +			   u64 start, u64 range,
> > +			   enum drm_gpuvm_sm_map_ops_flags flags)
> >  {
> >  	struct xe_vma_ops vops;
> >  	struct drm_gpuva_ops *ops = NULL;
> >  	struct drm_gpuva_op *__op;
> >  	bool is_cpu_addr_mirror = false;
> >  	bool remap_op = false;
> > +	bool is_madvise = flags == DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE;
> >  	struct xe_vma_mem_attr tmp_attr;
> > +	u16 default_pat;
> >  	int err;
> >  
> > -	vm_dbg(&vm->xe->drm, "MADVISE IN: addr=0x%016llx, size=0x%016llx", start, range);
> > -
> >  	lockdep_assert_held_write(&vm->lock);
> >  
> > -	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
> >  	ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, start, range,
> > -					  DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE,
> > -					  NULL, start);
> > +					  flags, NULL, start);
> >  	if (IS_ERR(ops))
> >  		return PTR_ERR(ops);
> >  
> > @@ -4292,33 +4282,56 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
> >  
> >  	drm_gpuva_for_each_op(__op, ops) {
> >  		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> > +		struct xe_vma *vma = NULL;
> >  
> > -		if (__op->op == DRM_GPUVA_OP_REMAP) {
> > -			xe_assert(vm->xe, !remap_op);
> > -			remap_op = true;
> > +		if (!is_madvise) {
> > +			if (__op->op == DRM_GPUVA_OP_UNMAP) {
> > +				vma = gpuva_to_vma(op->base.unmap.va);
> > +				XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma));
> > +				default_pat = vma->attr.default_pat_index;
> > +			}
> >  
> > -			if (xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.remap.unmap->va)))
> > -				is_cpu_addr_mirror = true;
> > -			else
> > -				is_cpu_addr_mirror = false;
> > -		}
> > +			if (__op->op == DRM_GPUVA_OP_REMAP) {
> > +				vma = gpuva_to_vma(op->base.remap.unmap->va);
> > +				default_pat = vma->attr.default_pat_index;
> > +			}
> >  
> > -		if (__op->op == DRM_GPUVA_OP_MAP) {
> > -			xe_assert(vm->xe, remap_op);
> > -			remap_op = false;
> > +			if (__op->op == DRM_GPUVA_OP_MAP) {
> > +				op->map.is_cpu_addr_mirror = true;
> > +				op->map.pat_index = default_pat;
> > +			}
> > +		} else {
> > +			if (__op->op == DRM_GPUVA_OP_REMAP) {
> > +				vma = gpuva_to_vma(op->base.remap.unmap->va);
> > +				xe_assert(vm->xe, !remap_op);
> > +				remap_op = true;
> >  
> > -			/* In case of madvise ops DRM_GPUVA_OP_MAP is always after
> > -			 * DRM_GPUVA_OP_REMAP, so ensure we assign op->map.is_cpu_addr_mirror true
> > -			 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
> > -			 */
> > -			op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
> > -		}
> > +				if (xe_vma_is_cpu_addr_mirror(vma))
> > +					is_cpu_addr_mirror = true;
> > +				else
> > +					is_cpu_addr_mirror = false;
> > +			}
> >  
> > +			if (__op->op == DRM_GPUVA_OP_MAP) {
> > +				xe_assert(vm->xe, remap_op);
> > +				remap_op = false;
> > +				/*
> > +				 * In case of madvise ops DRM_GPUVA_OP_MAP is
> > +				 * always after DRM_GPUVA_OP_REMAP, so ensure
> > +				 * we assign op->map.is_cpu_addr_mirror true
> > +				 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
> > +				 */
> > +				op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
> > +			}
> > +		}
> >  		print_op(vm->xe, __op);
> >  	}
> >  
> >  	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
> > -	vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
> > +
> > +	if (is_madvise)
> > +		vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
> > +
> >  	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
> >  	if (err)
> >  		goto unwind_ops;
> > @@ -4330,15 +4343,20 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
> >  		struct xe_vma *vma;
> >  
> >  		if (__op->op == DRM_GPUVA_OP_UNMAP) {
> > -			/* There should be no unmap */
> > -			XE_WARN_ON("UNEXPECTED UNMAP");
> > -			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), NULL);
> > +			vma = gpuva_to_vma(op->base.unmap.va);
> > +			/* There should be no unmap for madvise */
> > +			if (is_madvise)
> > +				XE_WARN_ON("UNEXPECTED UNMAP");
> > +
> > +			xe_vma_destroy(vma, NULL);
> >  		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
> >  			vma = gpuva_to_vma(op->base.remap.unmap->va);
> > -			/* Store attributes for REMAP UNMAPPED VMA, so they can be assigned
> > -			 * to newly MAP created vma.
> > +			/* In case of madvise ops Store attributes for REMAP UNMAPPED
> > +			 * VMA, so they can be assigned to newly MAP created vma.
> >  			 */
> > -			tmp_attr = vma->attr;
> > +			if (is_madvise)
> > +				tmp_attr = vma->attr;
> > +
> >  			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
> >  		} else if (__op->op == DRM_GPUVA_OP_MAP) {
> >  			vma = op->map.vma;
> > @@ -4346,7 +4364,8 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
> >  			 * Therefore temp_attr will always have sane values, making it safe to
> >  			 * copy them to new vma.
> >  			 */
> > -			vma->attr = tmp_attr;
> > +			if (is_madvise)
> > +				vma->attr = tmp_attr;
> >  		}
> >  	}
> >  
> > @@ -4360,3 +4379,42 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
> >  	drm_gpuva_ops_free(&vm->gpuvm, ops);
> >  	return err;
> >  }
> > +
> > +/**
> > + * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
> > + * @vm: Pointer to the xe_vm structure
> > + * @start: Starting input address
> > + * @range: Size of the input range
> > + *
> > + * This function splits existing vma to create new vma for user provided input range
> > + *
> > + * Return: 0 if success
> > + */
> > +int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
> > +{
> > +	lockdep_assert_held_write(&vm->lock);
> > +
> > +	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
> > +
> > +	return xe_vm_alloc_vma(vm, start, range, DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE);
> > +}
> > +
> > +/**
> > + * xe_vm_alloc_cpu_addr_mirror_vma - Allocate CPU addr mirror vma
> > + * @vm: Pointer to the xe_vm structure
> > + * @start: Starting input address
> > + * @range: Size of the input range
> > + *
> > + * This function splits/merges existing vma to create new vma for user provided input range
> > + *
> > + * Return: 0 if success
> > + */
> > +int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
> > +{
> > +	lockdep_assert_held_write(&vm->lock);
> > +
> > +	vm_dbg(&vm->xe->drm, "CPU_ADDR_MIRROR_VMA_OPS_CREATE: addr=0x%016llx, size=0x%016llx",
> > +	       start, range);
> > +
> > +	return xe_vm_alloc_vma(vm, start, range, DRM_GPUVM_SM_MAP_NOT_MADVISE);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index a4db843de540..f7b9ad83685a 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -177,6 +177,8 @@ bool xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool
> >  
> >  int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
> >  
> > +int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
> > +
> >  /**
> >   * to_userptr_vma() - Return a pointer to an embedding userptr vma
> >   * @vma: Pointer to the embedded struct xe_vma
> > -- 
> > 2.34.1
> > 
