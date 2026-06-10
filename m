Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F733CD8CB9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 12:12:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A1D10E920;
	Wed, 10 Jun 2026 12:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nRrcB05o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6A010E91D
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 12:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781093550; x=1812629550;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=p1pOvI8V9yKuPuHcT4PkUpcoCRcsoEZNMql7hPRIJaY=;
 b=nRrcB05oIM1tiCoxRmKIcs7SZpWxBczD6cmrlZb83R3e/7r8qxzcSJEG
 Busxwi6qgwg2QRjaoJGMKosC0vZPAG/tk2ZZXROdhgAbK8cAgzH7OCIo5
 DGbYRLTVmpK5fd30gKBeZMz32tTN08yha5Wh9aKPSbXasUQzpjxSaGMQB
 Y7jQP5sHAQcajA1vXdvdjcKPSydnuD5yYIj8dfRfsVu2XdhQfv05sfZdk
 PiTKuD3Yz1U4D5l2oV1/6izXz8cvfQBgSxi4+p/AK64ZkFsZ/9aosJ8+s
 yAuHRQjD1bZLRpTgsqklTE16RPRUP5pfuXljCZcJPAt/ls0zFCMQnYva4 Q==;
X-CSE-ConnectionGUID: TrF8dMleSAaIl28Kd/+eCQ==
X-CSE-MsgGUID: 0RFgkxdFRD2Fxq/Sde5SCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81927018"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="81927018"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 05:12:29 -0700
X-CSE-ConnectionGUID: w9esD1ZAQSeTDhCISfIpWA==
X-CSE-MsgGUID: cGNqlK/MQde9nxtcW4CPVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="246180283"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 05:12:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 05:12:29 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 05:12:29 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.18) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 05:12:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yLlQaO1BYADjIaN0L+KyFsNKb93qPyDMJMbMOByEHKa42/8BDcHbnzzGCMInv55Gd+wFUM+aWNf07qaS9bIYUrdeYQ9H5o4fhDOENgDgBz76SATdxHW6NP8HkQK7h3qxT3M4Zf6ULki2RKw8QGCvdMnTi46QeCeuIDoqVCVh9KTtjv6apnHEWyQsEVF/8xc1OKah7ZiL64BcvudgJve5Z98ReF63SHeUl6bw19y94dJemFvOFK2oa9Nx0IdhGa+xPd5t6HHM6tbCyx2fpQu3W1818DQBRt58VE2ibBXBZ5Kzvq/e+k7hPOlwLWHDma0BbIQCl+QIGRvSOox//Mfq+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XAKnFai26j5tIOQ5NOznzpKZ2W/J2hukDt7jJOxwaA=;
 b=AJHxDiIk1yIqo+RWi718AOnWwhHrHolDh6Zq9iBz2AYhufRiAX4lqnfK5zEa38lOb3+KmpQq4pxcgZGQNAMwNm5gbqzS3MGwMz5TPOLWz5yWwSOxBxP/7lxkrJGGjzYoqZus25LKPihsXPiIpy6oJ6tSpRc9qKY3cXc/gLxVg2s9u6UJkWj+WLmLC85nMPu+lY7BEHGnQIzy7WnN3zgrFIh+aJiAjfV4eyEmGN6O3RHwIHtPt7aC54rD1M7dc8BI7mzR/z+fZ95c4XRoT20qVGYN+YOPlU61UXV+NuwcKkWcrT1ipGn4tiNzNa5AA2oJKOj8zQ8RVZ7el94dL77Q8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by IA1PR11MB8831.namprd11.prod.outlook.com (2603:10b6:208:597::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 12:12:27 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%4]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 12:12:27 +0000
Date: Wed, 10 Jun 2026 14:12:20 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Fix use-after-free race in xe_pt_zap_ptes and
 xe_pt_zap_ptes_range
Message-ID: <ailUpAN2qA8BxBPO@fdugast-desk>
References: <20260605105202.1664464-1-francois.dugast@intel.com>
 <aib8+iiirtA0Wxz/@gsse-cloud1.jf.intel.com>
 <b35603bebdab62b381cf30b6ebcef0c9e07a7e1b.camel@linux.intel.com>
 <fd8a9de69a770c0cba41a6846b6dd09bba13ad99.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd8a9de69a770c0cba41a6846b6dd09bba13ad99.camel@linux.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU7P195CA0017.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::27) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|IA1PR11MB8831:EE_
X-MS-Office365-Filtering-Correlation-Id: ef9d8cf0-c239-4e81-e7cb-08dec6e9896f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|6133799003|4143699003|56012099006|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info: /V97065MGsL/d0M8rDWeIlAaTY0g83sZhpE6Vl3h0q+QpStilYKb1niv+8kC4PtKBU5e+ikMe/469wer/mWtGUvTsXs9gOze/8FZj6K6DhiDg1+PB/83cXJK3YKfmVy/Uvo5J9HnT6fctx+KKWsNBqWJjRfZZAkbahlcGcgnndaF7BuR4zsmdRl3i6cPpJV5qE3WKvc8tM3hWONd3MCYHM55UnMooI2JnulnmxawQ5LSi4N0VBRJ0USq/tnafJ97aoMCop5hC1CoNc5hAkPbRwNMhf1BXVCHqKz4ILM5Puvw8d2ktswMj1ZLeUpGi23S3671biwzNCr5a5DfjaC80ZfBq//uKQ6nhNhgDy6A8UGdNobU4gSJXnuyxYkqWUppEgzeMi5yolxt7PJh5MD68jbVOwGL5ztrd6ynmBEZICbbqlBaUTbYh7Dqv2rkI9CaVUFqUHKNe9iz29eUJGYkx4vQWvnujjJRVV3jefb5vcA/+8SHZd5Apo55Ru7mkgzFdARsT3QBfqs57SvqvIfJO9qviDxEhwG75oVnYETAR8xOPPqD1lf47k8oCBS6QaicsguHzXGhBaCInKDVtVbslZyR8PzkceFOn5FevoE38TiRab4fPpC2LcmQJ3W7ARqXzIQw1LPg0X7OhSutA1oBvQmbcMKm8c5OBoyNPbpCcTCZ8Rv0Vg8LpfH9mpxDQ+VF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(4143699003)(56012099006)(18002099003)(11063799006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czhlNFQ2TWc4OUhXRnVtMWRwZVlSbzdxRHZaa1RoVmxPQUNNZ1RHcVkrOHhL?=
 =?utf-8?B?OVlqMEIrWVZKWmc2Qk53WmI0ZkZ1UTdXdGZXMk42ZHlWdDVXTEdVa3B0cEFK?=
 =?utf-8?B?Z3VHY0orVDFSZnhsLzJTRlFSek5DbGR4cm1wQTNLRHRNbms2TVBScGlESSs5?=
 =?utf-8?B?Si8xSFpSbTJoYzBMUlJqaU5sMUtmVURtMVduTTI5QW9EalVEM2Y3U3hvTStB?=
 =?utf-8?B?TEpJNjRFZ0VRYlczVk1TVVpKNTBsTVBjNXJMUjBkaHg5QW1xa3FENURZbXRG?=
 =?utf-8?B?TThGMkIyY3Z0aUI0d0hrZldSVm05aFMzbWNacXd6Mm1GSzB6VFpXcGlWTWti?=
 =?utf-8?B?b3dDNnBKai9CRWx1YisxS0lSU0dOR1VWY2dYZGRyUmhqbzZ4bTc5OU1Cd3Ev?=
 =?utf-8?B?ZUFjY0lWK1hTcUwrUDRUSVcvNldTdW05cXJFTzVmYlo4WjhqZ2tVZXV6ZERE?=
 =?utf-8?B?bWpucVVpamhtOE1zcVkycjZ1aGZPR2RCczFCcU5hMzBqVlJXQ0t2L2VTeC8x?=
 =?utf-8?B?OGQ5dlRtMi9laVk2Q0lEdmVHT05NVUVudjZvaDU3RkRTeS9MalZGcmtoS2U4?=
 =?utf-8?B?SVZLeFRuY1pBMjl2dDhoN1Y2MmR4N2lraWF6MllOWXpXNTVEb253WlQrN2Nl?=
 =?utf-8?B?RTUrNTVXZVJXbVZ1WHZnbW9KV2VkZFB2VzNyNGJCZVd0dCtrZnlLbDU4em4v?=
 =?utf-8?B?REdvek05K1VhcmROWVFxVVA5U2RvaC95UzdsbDdwbVpPaExTNEhlakYyd2E0?=
 =?utf-8?B?dmNOVUc1QmNLRUFqb25DN3RSNWh4bTBJbitSZlczZzd6YmhrdUZrYlhXL2Vp?=
 =?utf-8?B?ZGczMitmUXVwai9ITjZ0OTI3alJSLzVvNGJtQVg3TVRpTFVLZmpJMzh5VnN1?=
 =?utf-8?B?eXFaWDQyc3UwZWxFSW5WMXFzSXpZRlVCT3RCcWJ0T3FmZjB2enZFbkVkeTRT?=
 =?utf-8?B?NU90Y2k4ZS9Wdm83SGNocWtRUkl2MmVVb29zUTVQNi9kUHcwR1JIeVBBVmhm?=
 =?utf-8?B?Zm9aYldaMHRxSEhrTmpTWVh6aHVZT2ZTaGVWM3R5UHYxdWNRME80RlczNVRw?=
 =?utf-8?B?bFhKVk1CVUlHU0VOQzRnWkErc2xjN1I3U0RwNEh3d2R4QkJYNUcra0l3Sms3?=
 =?utf-8?B?dG5OWGtrQnIzeWJPVHUwSFl6U3kyc3JqWG0rQkVkRVYrNkdPVDZjVEovMWpw?=
 =?utf-8?B?TlpkTEdLd01KZm4reDN6ZWxwTkQybmFIcUN4cHlmeVlVb3pKT2s4bFJBNGVi?=
 =?utf-8?B?OE1Wdm5BeTl0VW0zNWVObEtQZGNjMWdoMWJuTC9xbi9tQ2xXUHJVeWNZSWli?=
 =?utf-8?B?ZXJDTDlPRWVVcmlqZ1p4Y29pcDhyR3RTNk5zMW5VUlZ1WTBuTXRnbzhzZUpp?=
 =?utf-8?B?ajlVd2hHcU1vYnNxRnJqUTZibktjMmRBSDZncytLOFZ1ZC9jemdnV1l3TmpN?=
 =?utf-8?B?RExGVVZXYnZGNnZROHE1dlYvMHRvZjJ2UENHZitYOUNqaFBxdkZVb25PQ1RY?=
 =?utf-8?B?VjYveFMrRUp4RFpaMzFESlZJaHVtampud1oybzNyOW9DR0dTcGZjd1VBbnpR?=
 =?utf-8?B?SldaYWFVZVd2MXRrdFYvSVIrdEhiM1VEeTJJbEJJQ2tCblNqazJVdjZmNzdk?=
 =?utf-8?B?S1had205bGo0TEpEZW9lYU4rdDBXSzEzUVdrY3pMTGhob1R5bEN6SDZZckps?=
 =?utf-8?B?QkdjZk9rL0tRdVJacHR5V2xHOGxZbG1vQnltK3kvNU5iRHNxUFhHK215TUFF?=
 =?utf-8?B?UVF2ZlRZWGxtV2lHY0c0aHdEcDBBS2JLTzIrMzJ3Z28zMUdNVFY3clNSOWlV?=
 =?utf-8?B?MGJ2S2pvZ1JOL1cyTStZTzBGTC9uOUxtaUFUajZzbGluWk53WFgwQi9SVnJp?=
 =?utf-8?B?MWFTVGNPOUY3eTVHTENBcmc3SklaUmZDVlg5VDc4UTdoMU51R1FEdm1STXNG?=
 =?utf-8?B?Wmt2c0xzUzdrNXZJcEF6K1RYZHM1Y0h5TlVGTlcxanNxMzArVG9TcXd6MnBw?=
 =?utf-8?B?Y2VxUGNROC84TUQ1YVhqQW00YVFPVVZ6MmZHTFpxZHVURHFjNE5PdmZiSGNX?=
 =?utf-8?B?M3U2NnZLNG9oTmJ2V01pV3dRTlA2OXFjM2RjTjJhdS9UNWVSNTRvaXJvMmRm?=
 =?utf-8?B?MXRJU0NjSTg1ckRscElIMlhFUDZ2aVIzdGFFWURmUVo1ZEpEazRmZHkxdDRS?=
 =?utf-8?B?T3pRZzk2Vlhxdk1PUmExVC9hb01TQ3hXcUUzcXIzWCtJUFVCbzdMazhzNllU?=
 =?utf-8?B?Q3RFa2wzb3FuTDZwa0pWZXZZaFhZV2pWeVNNdEV3cFp1TzduL2tFN1RKcmti?=
 =?utf-8?B?T21jaEw2UUcrTXhBaHBjWUF1MXJYRFBOTFlzVnpUQy9KRUptRTl2YnhMZmFF?=
 =?utf-8?Q?YEDz37uNIhiKa5Uc=3D?=
X-Exchange-RoutingPolicyChecked: GvQoXProBt3Ys9SjfE4OEsPYy71JqzKOQMbitKHjib1WQW4ZQt/iIf7glPqr1LzyokWCW0dFtiEOH/eW3wNqWpx86qzYD+aZjsX4S93rphuCeMARkor8EdAKiTR9ZMOyPZyJWqKj0DwJ+ZB5E3h95tEMElEgcOmF5eP61HCec7LrF+f4L/AgNDRZRIrBCWq9sY7eKZwW2MAnJJtUunVUr+66lshqmbw6P41k8t1Mq7npuvXB/e3/NhQ/v1keNXySgWxEHM04y4c4wqQuK0KSOS7DnyYGM39mPveC8UeJujMfrcEajZeH2w+qJ/OJoCYQnS7DREsOlWuIEnrAW2I4Eg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ef9d8cf0-c239-4e81-e7cb-08dec6e9896f
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 12:12:27.1028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iwauKrfN4TtvWc3cvb7Q8PO8Id94/5j3aG4QiHmWRICJVoqdZlVOGli8VUvIc22foc/zDvhKT/M4leoHioQyRkA0ghbqzSraLcGuiawDK6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8831
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

On Wed, Jun 10, 2026 at 11:41:51AM +0200, Thomas Hellström wrote:
> On Wed, 2026-06-10 at 11:07 +0200, Thomas Hellström wrote:
> > On Mon, 2026-06-08 at 10:33 -0700, Matthew Brost wrote:
> > > On Fri, Jun 05, 2026 at 12:52:02PM +0200, Francois Dugast wrote:
> > > > xe_pt_zap_ptes() and xe_pt_zap_ptes_range() walk the page-table
> > > > tree
> > > > holding only the BO reservation or SVM notifier_lock
> > > > respectively.
> > > > Concurrently, xe_pt_update_ops_run() (vm->lock write) calls
> > > > xe_pt_commit()
> > > > which swaps children[] pointers and immediately frees the
> > > > replaced
> > > > xe_pt
> > > > via xe_pt_destroy().  xe_vm_pt_destroy() has the same exposure
> > > > during VM
> > > > teardown.  Either path can produce a use-after-free when a
> > > > concurrent walk
> > > > dereferences a just-freed node. Fix by introducing a per-VM
> > > > rw_semaphore
> > > > pt_lock.
> > 
> > When commiting a pt walk, The xe_pt_commit_locks_assert() should be
> > ensuring the zaps are locked out:
> > 
> > If zap is holding the resv (bo eviction), then a walk touching the
> > same
> > bo would also be holding that resv.
> > 
> > For userptr, the same is true, but with the SVM notifier lock.
> > 
> > One corner-case, though, might be if the touched regions are
> > disjoint,
> > and the pt_update_ops_run() frees a shared page-table. Let me check
> > that.
> 
> That shouldn't be happening either. IIRC That should be guarded by the
> pt->num_live, so that a disjoint range shouldn't remove a shared pt
> unless its own range part of num_live matches pt->num_live, meaning
> that no other range is using it.
> 
> And pt->num_live is already protected by the vm resv, so it can't race
> with a concurrent unbind, and zap never touches it.
> 
> So the locking asserts in the code appears correct to me and should
> protect against zap races.
> 
> Did you actually see this happening or was this from an analysis
> report?

This was observed on a running system:

    kernel NULL pointer dereference, address: 0000000000000af0
    ...
    xe_pt_zap_ptes_entry+0xce/0x100
    ..
    kernel panic

It could mean that xe_child->bo is NULL, which is possible because
XE_WARN_ON(!*child) does not stop execution. Unfortunately it was
not possible to check if this was the case in the trace.

This is confirmed by the fact that replacing XE_WARN_ON(!*child) by
"return 0" seem to work around those kernel panics, however it
creates other issues as this does not address the root cause.

Francois

> 
> Thanks,
> Thomas
> 
> 
> 
> 
> > 
> > /Thomas
> > 
> > 
> > 
> > > > 
> > > 
> > > This locking is very hard to reason about. I believe I understand
> > > the
> > > issue—zap holds the SVM notifier_lock, but an unbind with only the
> > > VM
> > > resv lock (non-userptr/SVM) could race and cause a UAF, right?
> > > These
> > > operations  should be touching different PTEs or they would both
> > > hold
> > > SVM notifier_lock so it ought to be safe, but perhaps I’m missing
> > > something.
> > > 
> > > Again, the existing code somewhat confusing and a bit hand-wavy.
> > > With
> > > that - regardless, I’m okay with introducing a dedicated lock, as
> > > this
> > > series does, to ensure safety / make the locking clear.
> > > 
> > > A couple nits below.
> > > 
> > > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for
> > > > Intel
> > > > GPUs")
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> > > 
> > > I’d also like Thomas’s input here before merging, as locking is
> > > difficult and the more eyes on it, the better.
> > > 
> > > > Assisted-by: GitHub Copilot:claude-sonnet-4.6
> > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_pt.c       | 47 ++++++++++++++++++++++----
> > > > --
> > > > ----
> > > >  drivers/gpu/drm/xe/xe_vm.c       |  3 ++
> > > >  drivers/gpu/drm/xe/xe_vm_types.h |  5 ++++
> > > >  3 files changed, 40 insertions(+), 15 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > > b/drivers/gpu/drm/xe/xe_pt.c
> > > > index 15ce77ce7793..2dada51469c9 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > @@ -919,10 +919,10 @@ static const struct xe_pt_walk_ops
> > > > xe_pt_zap_ptes_ops = {
> > > >   * Eviction and Userptr invalidation needs to be able to zap the
> > > >   * gpu ptes of a given address range in pagefaulting mode.
> > > >   * In order to be able to do that, that function needs access to
> > > > the shared
> > > > - * page-table entrieaso it can either clear the leaf PTEs or
> > > > - * clear the pointers to lower-level page-tables. The caller is
> > > > required
> > > > - * to hold the necessary locks to ensure neither the page-table
> > > > connectivity
> > > > - * nor the page-table entries of the range is updated from under
> > > > us.
> > > > + * page-table entries so it can either clear the leaf PTEs or
> > > > + * clear the pointers to lower-level page-tables. The function
> > > > acquires
> > > > + * vm->pt_lock (read) to protect against concurrent page-table
> > > > tree
> > > > + * modifications by xe_pt_update_ops_run() and
> > > > xe_vm_pt_destroy().
> > > >   *
> > > >   * Return: Whether ptes were actually updated and a TLB
> > > > invalidation is
> > > >   * required.
> > > > @@ -937,19 +937,24 @@ bool xe_pt_zap_ptes(struct xe_tile *tile,
> > > > struct xe_vma *vma)
> > > >  		},
> > > >  		.tile = tile,
> > > >  	};
> > > > -	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> > > > +	struct xe_vm *vm = xe_vma_vm(vma);
> > > > +	struct xe_pt *pt;
> > > >  	u8 pt_mask = (vma->tile_present & ~vma-
> > > > >tile_invalidated);
> > > >  
> > > >  	if (xe_vma_bo(vma))
> > > >  		xe_bo_assert_held(xe_vma_bo(vma));
> > > >  	else if (xe_vma_is_userptr(vma))
> > > > -		lockdep_assert_held(&xe_vma_vm(vma)-
> > > > > svm.gpusvm.notifier_lock);
> > > > +		lockdep_assert_held(&vm-
> > > > > svm.gpusvm.notifier_lock);
> > > >  
> > > >  	if (!(pt_mask & BIT(tile->id)))
> > > >  		return false;
> > > >  
> > > > -	(void)xe_pt_walk_shared(&pt->base, pt->level,
> > > > xe_vma_start(vma),
> > > > -				xe_vma_end(vma), &xe_walk.base);
> > > > +	down_read(&vm->pt_lock);
> > > 
> > > Style nit - can we use guards or scoped guards in this series?
> > > 
> > > > +	pt = vm->pt_root[tile->id];
> > > > +	if (pt)
> > > > +		(void)xe_pt_walk_shared(&pt->base, pt->level,
> > > > xe_vma_start(vma),
> > > > +					xe_vma_end(vma),
> > > > &xe_walk.base);
> > > > +	up_read(&vm->pt_lock);
> > > >  
> > > >  	return xe_walk.needs_invalidate;
> > > >  }
> > > > @@ -963,8 +968,9 @@ bool xe_pt_zap_ptes(struct xe_tile *tile,
> > > > struct xe_vma *vma)
> > > >   * SVM invalidation needs to be able to zap the gpu ptes of a
> > > > given address
> > > >   * range. In order to be able to do that, that function needs
> > > > access to the
> > > >   * shared page-table entries so it can either clear the leaf
> > > > PTEs
> > > > or
> > > > - * clear the pointers to lower-level page-tables. The caller is
> > > > required
> > > > - * to hold the SVM notifier lock.
> > > > + * clear the pointers to lower-level page-tables. The function
> > > > acquires
> > > > + * vm->pt_lock (read) to protect against concurrent page-table
> > > > tree
> > > > + * modifications by xe_pt_update_ops_run() and
> > > > xe_vm_pt_destroy().
> > > >   *
> > > >   * Return: Whether ptes were actually updated and a TLB
> > > > invalidation is
> > > >   * required.
> > > > @@ -980,14 +986,16 @@ bool xe_pt_zap_ptes_range(struct xe_tile
> > > > *tile, struct xe_vm *vm,
> > > >  		},
> > > >  		.tile = tile,
> > > >  	};
> > > > -	struct xe_pt *pt = vm->pt_root[tile->id];
> > > > +	struct xe_pt *pt;
> > > >  	u8 pt_mask = (range->tile_present & ~range-
> > > > > tile_invalidated);
> > > >  
> > > >  	/*
> > > >  	 * Locking rules:
> > > >  	 *
> > > > -	 * - notifier_lock (write): full protection against page
> > > > table changes
> > > > -	 *   and MMU notifier invalidations.
> > > > +	 * - notifier_lock (write): excludes concurrent MMU
> > > > notifier
> > > > +	 *   invalidations, but does NOT exclude
> > > > xe_pt_update_ops_run() which
> > > > +	 *   holds vm->lock (write).  pt_lock (read) is
> > > > therefore
> > > > required to
> > > > +	 *   serialise against concurrent xe_pt_commit() /
> > > > xe_pt_destroy() calls.
> > > >  	 *
> > > >  	 * - notifier_lock (read) + vm_lock (write): combined
> > > > protection against
> > > >  	 *   invalidations and concurrent page table
> > > > modifications. (e.g., madvise)
> > > > @@ -1000,8 +1008,13 @@ bool xe_pt_zap_ptes_range(struct xe_tile
> > > > *tile, struct xe_vm *vm,
> > > >  	if (!(pt_mask & BIT(tile->id)))
> > > >  		return false;
> > > >  
> > > > -	(void)xe_pt_walk_shared(&pt->base, pt->level,
> > > > xe_svm_range_start(range),
> > > > -				xe_svm_range_end(range),
> > > > &xe_walk.base);
> > > > +	down_read(&vm->pt_lock);
> > > 
> > > Should be assert vm->pt_lock in held in xe_pt_zap_ptes_entry or do
> > > we
> > > not have the VM there?
> > > 
> > > Matt
> > > 
> > > > +	pt = vm->pt_root[tile->id];
> > > > +	if (pt)
> > > > +		(void)xe_pt_walk_shared(&pt->base, pt->level,
> > > > +					xe_svm_range_start(range
> > > > ),
> > > > +					xe_svm_range_end(range),
> > > > &xe_walk.base);
> > > > +	up_read(&vm->pt_lock);
> > > >  
> > > >  	return xe_walk.needs_invalidate;
> > > >  }
> > > > @@ -1079,6 +1092,8 @@ static void
> > > > xe_pt_commit_locks_assert(struct
> > > > xe_vma *vma)
> > > >  
> > > >  	if (xe_vma_is_userptr(vma))
> > > >  		xe_svm_assert_held_read(vm);
> > > > +
> > > > +	lockdep_assert_held_write(&vm->pt_lock);
> > > >  }
> > > >  
> > > >  static void xe_pt_commit(struct xe_vma *vma,
> > > > @@ -2638,6 +2653,7 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> > > > struct xe_vma_ops *vops)
> > > >  	}
> > > >  
> > > >  	/* Point of no return - VM killed if failure after this
> > > > */
> > > > +	down_write(&vm->pt_lock);
> > > >  	for (i = 0; i < pt_update_ops->current_op; ++i) {
> > > >  		struct xe_vm_pgtable_update_op *pt_op =
> > > > &pt_update_ops->ops[i];
> > > >  
> > > > @@ -2645,6 +2661,7 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> > > > struct xe_vma_ops *vops)
> > > >  			     pt_op->num_entries, &pt_update_ops-
> > > > > deferred);
> > > >  		pt_op->vma = NULL;	/* skip in
> > > > xe_pt_update_ops_abort */
> > > >  	}
> > > > +	up_write(&vm->pt_lock);
> > > >  
> > > >  	if (xe_range_fence_insert(&vm->rftree[tile->id], rfence,
> > > >  				  &xe_range_fence_kfree_ops,
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > > b/drivers/gpu/drm/xe/xe_vm.c
> > > > index 080c2fff0e95..b711c12bf751 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > @@ -1580,12 +1580,14 @@ static void xe_vm_pt_destroy(struct xe_vm
> > > > *vm)
> > > >  
> > > >  	xe_vm_assert_held(vm);
> > > >  
> > > > +	down_write(&vm->pt_lock);
> > > >  	for_each_tile(tile, vm->xe, id) {
> > > >  		if (vm->pt_root[id]) {
> > > >  			xe_pt_destroy(vm->pt_root[id], vm-
> > > > >flags,
> > > > NULL);
> > > >  			vm->pt_root[id] = NULL;
> > > >  		}
> > > >  	}
> > > > +	up_write(&vm->pt_lock);
> > > >  }
> > > >  
> > > >  static void xe_vm_init_prove_locking(struct xe_device *xe,
> > > > struct
> > > > xe_vm *vm)
> > > > @@ -1644,6 +1646,7 @@ struct xe_vm *xe_vm_create(struct xe_device
> > > > *xe, u32 flags, struct xe_file *xef)
> > > >  	} else {
> > > >  		init_rwsem(&vm->lock);
> > > >  	}
> > > > +	init_rwsem(&vm->pt_lock);
> > > >  	mutex_init(&vm->snap_mutex);
> > > >  
> > > >  	INIT_LIST_HEAD(&vm->rebind_list);
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > > > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > index 635ed29b9a69..3bc45991f607 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > @@ -271,6 +271,11 @@ struct xe_vm {
> > > >  	 * VM
> > > >  	 */
> > > >  	struct rw_semaphore lock;
> > > > +	/**
> > > > +	 * @pt_lock: Protects page-table tree structural
> > > > modifications from
> > > > +	 * concurrent reads during page-table walks (e.g.,
> > > > xe_pt_zap_ptes).
> > > > +	 */
> > > > +	struct rw_semaphore pt_lock;
> > > >  	/**
> > > >  	 * @snap_mutex: Mutex used to guard insertions and
> > > > removals from gpuva,
> > > >  	 * so we can take a snapshot safely from devcoredump.
> > > > -- 
> > > > 2.43.0
> > > > 
