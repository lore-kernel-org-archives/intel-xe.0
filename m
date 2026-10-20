Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E739D606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 09:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H83xI07V
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9878B10F479;
	Tue, 20 Oct 2026 09:55:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D483210F475
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 09:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792490153; x=1824026153;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qN5HLc0pMyh6L1SGp4c9fATAUzcwu4rCg8BnzdRplYU=;
 b=H83xI07VICm3I0z8D8qwCjhrovuiMnX2xRCAAw9cWPUjMNoKKVm4BgtY
 E8QCIzdK1cCjM/tzWlKfLKgeJK2ql29SoEUMaORYWVLP30rXZ/mZ0TEAs
 nWbmYlykF/3S7o1KF5PAqmSav8uRrfrXCDzcpSGJMnvWsPQIYeVbkUP1s
 H2j1rQHAzzxf430tfmhhn0JFGnnX2EGFAgr/IU8MAABsMm1QagFt6i/Cd
 3Cu3UESlyRxKWGpDGJiN/Z+HTQXi/aagm08sYblyhU/2JRIuVVv4145HQ
 qbdZ3cAzlicmavHWo6ZHERSBS1KQ9JoO2Nfcn00gqIlXPt40ihoel/s4D Q==;
X-CSE-ConnectionGUID: 37piQUOTS52keX7sTxB9Sg==
X-CSE-MsgGUID: DzERmdbMSf2tFB0ymp3jPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1216434"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1216434"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 02:55:53 -0700
X-CSE-ConnectionGUID: OxYuciAiTUivRGt75odeFg==
X-CSE-MsgGUID: tpUv3xcFSEyHKK3w6Bneow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2667702"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 02:55:52 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 02:55:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 02:55:51 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 02:55:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Br4209wGQhKwH6djtezTYm+mb2HTM1IN4S6dcVG7vVu+urFoCDuU2iy1L4AxSc3GSZeuvjUDKSDcuJOBF/4GlEAD8MyAzhUVYfOXa24GE9KUdXJo8geA6vhVV34wcEwoXk8/3mOcpOzbBVOhuQm3a690+2nk+EJhlffUrx96fvtKj1WeCual8sDHPaHHAaWGtL4hORhKWrxr4CK3jqzDWWQdTuAjaYTHC8bLhHkKk4PzU74eBzhNAWNmMsihMsZhc3TQLTJfcvKGWvjJ50P7fh8bFkYNUvrIGgIacrfWSh0Tdii7uXlPSIxtbnGMVWCkIKManRc49epkkbZgM0MVNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FhOKrhbdDJwpEiiYg/0JZIp4c3lFuEQMfxw+Spz8DdM=;
 b=iHNl/aeGQKsXyKwnH70+pM+YWD8lbEmge/9oLLk+YhlhpEuHxBypQmz2OclOJLqIQlUjtl4gEsvIGoVrJ9HACHgWyMVPxu6j7Sva1eaQnzOWFDBgaghvveKS1z57bedbGqkG+eKYdTxzTMArcS2HJ6PChIaVPcLieh7D1cTj1f5ksDzIIZojhd6r6tgwxNGN1zNuQU5fAUbPbL6Y567pHeFuaT+FommF+2EhLr7ddJ+mHNhljizC33yUdRwTUWGZ2NJBEw29aK2FgM4C52e1IYC/CT5kdIxAEl3DjTAJLyBqh+bh7WIB62VilzZ/arL1ERNmL65bHSAjCjD14yoHpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by MN2PR11MB4645.namprd11.prod.outlook.com (2603:10b6:208:269::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 09:55:49 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 09:55:49 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v6 2/4] drm/xe/ggtt: Split GGTT into usable and shareable pools
Date: Tue, 20 Oct 2026 11:55:30 +0200
Message-ID: <20261020095532.473609-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020095532.473609-1-piotr.piorkowski@intel.com>
References: <20261020095532.473609-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PAYP264CA0007.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:11e::12) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|MN2PR11MB4645:EE_
X-MS-Office365-Filtering-Correlation-Id: 5af7447e-49b8-469a-bd38-08df2e905206
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: MpZAHdRBGVmDe5+wCaYm8t5v28UK5Pjqewxm+1szVfLVLh7RNKj9YsdpG5sPu1BD9s0uuGKAtwiB1TM5e1Ve5Z41OYonxDRHNt1GvzM7lcZkuVJwiViBe6t9gRdcessmCCOZb/VIjiybrL3nBX73ClJh/DY9Xcumz+WpUm+T/Ohia2tabI4kdAtfuLbEUQ7TnTqe+L9hJW69J/Xq/uMPfDibJqxWsybShsvTEo1ITw8eKsDEAQ0PcN0ZHsDZm4F8KFU/RDhYTa3H3xwauU3K0JzFCTT6w+yCgWfmE0CX9FZK7kClUW7gJFcHx4OylY7lGlRLFU9CefY1AKIWJxAZFpfKvCX4hhMjLf81n4/RRhEl37/eBg5nYmROkCs7uPCriXoaB9lfyiCPpMq9PqEhvrQ36Ori5ZCf93G+sx2/DeeAZWqEytxe/eqGPE86XxiMsoMb9zyxfrEV4ZEB10ZW8KdxHGb98fIxu2qvfaUolEG57tEdGx9AQEqg/5BxT2951StxFfNwvF2wPg6w7+1XEtiPFniT7BDx2RCIfxEnFiw3d1WlE7YCW1C59nDQ0rkbueCltb3VXNJiHh5AaQ7t82qGbjxZXdJm49qjqU6G+NzCG+CWLCA84qZ2k3yCKVW+K3tVGcsbR9VSEQL00DYqwTTg8mHEqczz9p+RfG1xHO8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHFlL1ZaV0RyLzE4dzd3RlNCUDRtbUZKSFpvSEpMdGVGNk9SRWkxVmZsOThY?=
 =?utf-8?B?bVRSY2d3THluL213dkZoYmo3MEU4OVZ6WStVNlFuRjRISC9laVY0VXdtQVJQ?=
 =?utf-8?B?MGNHV3Ribnk4OUxFNW9IeGI5N0xKdzIrTys3cXc4N25KL3QrZWlTRmY5azgv?=
 =?utf-8?B?NDJuUGhHWXFiUExidVBIQ3MvLzNETGtaMTU1R2hvV1p0a05MWU45YW1BTkRS?=
 =?utf-8?B?cTBxSnU4cWNRR24rWUZydW0vWFFXNDNsSWpHc2dpdTkvSzFCQTZCRkg2UStS?=
 =?utf-8?B?aHRFalBrUE1ZOVhuSzJ4K01aeHlpTkEyZTlZSnY2NXlFMm5lQ0xFSHVwcURm?=
 =?utf-8?B?NnY2UU55Q1ZncmwxbGVrSVNQTzhSWmRXM2JJMjBvRlZRQmZOZVRaalNwQ21I?=
 =?utf-8?B?VDcxcldLcUNXVHQvV2taUHRXbDc0MEVQQWszbG54bkhQS3dTakJXTW1oNXJW?=
 =?utf-8?B?a1QwbWJsWTZtQ2U1VVF3bG1heEExNFg2R1ZsbU4xNnZ1ZC9EMG9MbnNkcTFL?=
 =?utf-8?B?ZnAvY09PZEo5OEdVRHNZemI1RWRJNkxTcE1vaXFJczJKT1ZMeElHb2o4ZEQv?=
 =?utf-8?B?WkgyVXlLOHQ0cXFFNG13OUNMOFBzSytNOUtZUi9YMjYyT2tNUFVXQVVjT2Zu?=
 =?utf-8?B?eEFQNW4rM205ZHJhYzYrMmxBc3Z1QkZYWkZtUS9Yd2FoN21VRUh3U1hGcU1E?=
 =?utf-8?B?YkgvclNHbHZNalJxODRqS0NibjNuOHhJa1FNM29HbW5zWlA1M1hkK3FScE5o?=
 =?utf-8?B?ZEZTMWVkVFdQc2o5T2t6dkJBVnBHaURrZnVaK3c4WTlUZUZEQjdJeVlLU3BJ?=
 =?utf-8?B?UmpOYVJsU0pxVDNOSmw0UnlSRFJFTHhhK0tjbFdFMmswNGhrbCsvUEQwcG4z?=
 =?utf-8?B?ckRXd0x6UWo1MTh5UzB6ZGxhNTB2b04rWTl6S0o2b1BCajVZTlFOSS9ud0tG?=
 =?utf-8?B?b1JhUExuVHN3MjFicnRCNHlsRWYySlIvU3NTbEtheTdaNVovNGJBUkpPdjRW?=
 =?utf-8?B?bGF4K0s4UUtPeVRvNXFkVlNNc0NTY1FJOVJuYm1ueFdVUmh0WUhuOFNRY01v?=
 =?utf-8?B?QnpZTVBZVnlrTDRkWTBKWE5TVEZnU3QzSERJNVFXaWJ0YWpKYWFMdWxUSnYz?=
 =?utf-8?B?WXVqQ25vTmt5YWZrN0d6U2xnY0hRV1V4Z1JFeURHNlpOQ01WM0pSeWNheXQ2?=
 =?utf-8?B?Q1B2M3lJWUcrekNNeGZmSjVLait6WjgvOVNEUzdOL0N6T09teUxmYkZLK0dL?=
 =?utf-8?B?VTFKekdlOGl3YXhaLzhJZ2I4WTRhTGtualFqZU9Qbm90cE05K21qc05abThj?=
 =?utf-8?B?YklmeE5IaGJMTUhMd3NlVFUyazJLNG91MStlVlFTVVhpd0ZkZDNjZW5nb0F0?=
 =?utf-8?B?RU9NZGNjMkVpVDBFcGNpcjlQSUN1dGpRZlFlRTdKREtUdlp0VW1BRC9oMkti?=
 =?utf-8?B?TlBCVjhPRExiYkdBWTZLbVBxNmVGbWFTVWF5UmhPeU5IWk93MFpuSS9JbFhs?=
 =?utf-8?B?SzI3YmJNc1pFUlZtai8vcTJCS1lEdGlvNGlFODdmekwwckE2dEZBeGNaSXBK?=
 =?utf-8?B?elEwek9qNlJNS29MaDF3bjJqb3E0MXJ2NitJSjdiMTFtYjZVUjNTVTZ2VUlk?=
 =?utf-8?B?bW4xVUhiN2EwYXhhM0pEeC9wNVcrd1gzTGtwcC93MTVtbFJVMFdyakJYY2pI?=
 =?utf-8?B?bEVub2I2WGtEa1A5M0t4ejV4K1N6VFVvZ1FhZlhQdGVZcU05MlhFaWlNS2Za?=
 =?utf-8?B?NEtYVW5iQnJsbkxXTkoxZHJMUVBOYVZtWkhtVHlOM3h1NzRhNXdldUc5RXE5?=
 =?utf-8?B?RWU1cHFhaE1XVWFTY0dIOHFIb0NpMjV4cnRUUGdCVmoxc25wdjFrWTR1Qjdx?=
 =?utf-8?B?K2hNenozbzZhbWJrUk1LS056aG85TzlKY1o2Vnp1YkhiR2tPcGFNWFc0eHlQ?=
 =?utf-8?B?RGhGYVROa0RqZDFhNStvZ3JkQXBPMWN4OTNubVBHU0doZHdzMjJocVVIVHRq?=
 =?utf-8?B?eFdSbzhWcGNLMnZOZXVUdXVTdlJMMTI2TTA3YzJGK2xicDExSS9IMW9BVkxK?=
 =?utf-8?B?WnIzUHk1T3N5dUppTXdGY3d2SmNPZnk4T0k0eVBuZ05IYnRoL0ttS2piYzE0?=
 =?utf-8?B?Q044THlQejZVZkxwV2ZrN2w2TTBzVHN0YmliaTBiUWE0UWdmS2IyOVFnU254?=
 =?utf-8?B?SFIybktCRmJJTXgydkoyTjZJTVhQZzR3T1ZVTEpOSmZ1QlkvcnZBVnBla2NZ?=
 =?utf-8?B?bjNMY2NiOG9qeStvRVBOa0tVQTdoMTAvajk1QUU1ZW5ialBwR3FKWVpLMFBN?=
 =?utf-8?B?cXpMNUxkV25nSjdCWFk4RzZLbm00c3VaeC9odU5Mdkx1OERyeis4MU8zNTJ4?=
 =?utf-8?Q?BctnSlHtvc5CF0dE=3D?=
X-Exchange-RoutingPolicyChecked: YilJY/DJLiZVqUKDryluDzc1oA/X8W0WvrQ7rfRuADXzzpeq8b0O7uqzQ2DNOm1uOJ9Hox3RpeQ2PpEK13+otCp5TQidc/ISBe5L8tBhhgbgGbpfoRgz8xaJMhtRdR5YMIPhCKcnUTOjPXh0Adc+qeCU+hesAeVGBXva9vvXO06gMkWLGzXaGsBzGigvRIP6GZYxNhWCGcbpeFMm416IiDbYdzG8jFP9X9L58TcJFSnEP0k6XzegZ6S+C46peURffbrWlS6W6K6aRwYylIpiRdyFeZOrZ1XaTsmnDgIfaOoYtdBiTDG4geZkeuy7p+c/0r6YHeTj9oYbk3pa9ECWyw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af7447e-49b8-469a-bd38-08df2e905206
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:55:49.8391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nkZppxt0H2DLpa0/LRDSED1jTb+ROzNR8ZEu4z6kf2ocS187ZWHbSC8xUPJ5f46znLOjeit+OfxLA3E1PDgfZpilzR/ZpnaqjwysaWj8Agw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4645
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Driver-owned GGTT allocations and VF provisioning currently use a single
GGTT pool. Split it into a usable pool for driver-owned allocations and a
shareable pool for VF provisioning.

The pools are separate logical ranges and may overlap, but allocations are
limited to the configured size of their corresponding pool. Allocate from
the bottom of the usable pool and from the top of the shareable pool when a
shareable pool is present.

Add separate insertion APIs for the usable and shareable pools.

v2:
 - Rename ggtt->usable_size back to ggtt->size.
 - Remove the ggtt_insert_node_in_range() helper.
v3:
 - Introduce the full_size struct field instead of the ggtt_accessible_size
   function.
v4:
 - Set the shareable pool size only for SR-IOV PF,
 - Return -ENOSPC instead of asserting when a large BO no longer fits after
   end is clamped to ggtt->size.
v5:
 - Move range initializer rename and full_size parameter here.
 - Use shareable_size and compute the shareable start on demand.
 - Constrain regular allocations to the usable pool.

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 166 +++++++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_ggtt.h |   4 +
 2 files changed, 143 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index abcc929c08535..8c8354d47782d 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -145,8 +145,19 @@ struct xe_ggtt {
 	unsigned int access_count;
 	/** @wq: Dedicated unordered work queue to process node removals */
 	struct workqueue_struct *wq;
+#ifdef CONFIG_PCI_IOV
+	/** @shareable_size: Size of the GGTT range reserved for sharing with VFs */
+	u64 shareable_size;
+#endif
 };
 
+#ifdef CONFIG_PCI_IOV
+static inline u64 ggtt_shareable_start(struct xe_ggtt *ggtt)
+{
+	return ggtt->full_size - ggtt->shareable_size;
+}
+#endif
+
 static u64 xelp_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
 {
 	u64 pte = XE_PAGE_PRESENT;
@@ -358,17 +369,30 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
-static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
+static void ggtt_init_ranges(struct xe_ggtt *ggtt, u64 start, u64 full_size,
+			     u64 usable_size, u64 shareable_size)
 {
+	struct xe_gt *gt = ggtt->tile->primary_gt;
+
+	xe_gt_assert(gt, full_size);
+	xe_gt_assert(gt, usable_size);
+	xe_gt_assert(gt, usable_size <= full_size);
+	xe_gt_assert(gt, shareable_size <= full_size);
+
 	ggtt->start = start;
-	ggtt->full_size = size;
-	ggtt->size = size;
-	drm_mm_init(&ggtt->mm, 0, size);
+	ggtt->full_size = full_size;
+	ggtt->size = usable_size;
+
+#ifdef CONFIG_PCI_IOV
+	if (shareable_size)
+		ggtt->shareable_size = shareable_size;
+#endif
+	drm_mm_init(&ggtt->mm, 0, ggtt->full_size);
 }
 
 int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
 {
-	__xe_ggtt_init_early(ggtt, start, size);
+	ggtt_init_ranges(ggtt, start, size, size, 0);
 	return 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
@@ -445,7 +469,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (!ggtt->wq)
 		return -ENOMEM;
 
-	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size);
+	ggtt_init_ranges(ggtt, ggtt_start, ggtt_size, ggtt_size,
+			 IS_SRIOV_PF(xe) ? ggtt_size : 0);
 
 	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
 	if (err)
@@ -639,6 +664,11 @@ static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
 	ggtt_invalidate_gt_engine_tlb(ggtt->tile->media_gt);
 }
 
+static inline u64 xe_ggtt_bottom(struct xe_ggtt *ggtt)
+{
+	return xe_wopcm_size(tile_to_xe(ggtt->tile));
+}
+
 /**
  * xe_ggtt_shift_nodes() - Shift GGTT nodes to adjust for a change in usable address range.
  * @ggtt: the &xe_ggtt struct instance
@@ -650,24 +680,63 @@ static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
  * This function may be called multiple times during recovery, but if
  * @new_start is unchanged from the current base, it's a noop.
  *
- * @new_start should be a value between xe_wopcm_size() and #GUC_GGTT_TOP.
+ * @new_start should be a value between the GGTT bottom and #GUC_GGTT_TOP.
  */
 void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_start)
 {
 	guard(mutex)(&ggtt->lock);
 
-	xe_tile_assert(ggtt->tile, new_start >= xe_wopcm_size(tile_to_xe(ggtt->tile)));
+	xe_tile_assert(ggtt->tile, new_start >= xe_ggtt_bottom(ggtt));
 	xe_tile_assert(ggtt->tile, new_start + ggtt->size <= GUC_GGTT_TOP);
+#ifdef CONFIG_PCI_IOV
+	xe_tile_assert(ggtt->tile, ggtt->shareable_size == 0);
+#endif
 
 	/* pairs with READ_ONCE in xe_ggtt_node_addr() */
 	WRITE_ONCE(ggtt->start, new_start);
 }
 
-static int xe_ggtt_insert_node_locked(struct xe_ggtt_node *node,
-				      u32 size, u32 align, u32 mm_flags)
+static int ggtt_insert_node_in_range_locked(struct xe_ggtt_node *node, u32 size,
+					    u32 align, u64 range_start,
+					    u64 range_size, u32 mm_flags)
+{
+	struct xe_ggtt *ggtt = node->ggtt;
+	u64 range_end = range_start + range_size;
+
+	lockdep_assert_held(&ggtt->lock);
+
+	if (!range_size || range_end <= range_start)
+		return -EINVAL;
+
+	if (range_end > ggtt->full_size)
+		return -ERANGE;
+
+	if (size > range_size)
+		return -ENOSPC;
+
+	return drm_mm_insert_node_in_range(&ggtt->mm, &node->base, size, align, 0,
+					  range_start, range_end, mm_flags);
+}
+
+/*
+ * When the shareable range is present, allocations start from the bottom
+ * to leave space at the top; otherwise they start from the top.
+ */
+static u32 ggtt_usable_insert_flags(struct xe_ggtt *ggtt)
 {
-	return drm_mm_insert_node_generic(&node->ggtt->mm, &node->base, size, align, 0,
-					  mm_flags);
+#ifdef CONFIG_PCI_IOV
+	if (ggtt->shareable_size > 0)
+		return DRM_MM_INSERT_LOW;
+#endif
+	return DRM_MM_INSERT_HIGH;
+}
+
+static int xe_ggtt_insert_node_locked(struct xe_ggtt_node *node, u32 size, u32 align)
+{
+	struct xe_ggtt *ggtt = node->ggtt;
+
+	return ggtt_insert_node_in_range_locked(node, size, align, 0,
+						ggtt->size, ggtt_usable_insert_flags(ggtt));
 }
 
 static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
@@ -684,12 +753,12 @@ static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
 }
 
 /**
- * xe_ggtt_insert_node - Insert a &xe_ggtt_node into the GGTT
+ * xe_ggtt_insert_node() - Insert a &xe_ggtt_node into the GGTT
  * @ggtt: the &xe_ggtt into which the node should be inserted.
  * @size: size of the node
  * @align: alignment constrain of the node
  *
- * Return: &xe_ggtt_node on success or a ERR_PTR on failure.
+ * Return: &xe_ggtt_node on success or an ERR_PTR on failure.
  */
 struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align)
 {
@@ -701,8 +770,45 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
 		return node;
 
 	guard(mutex)(&ggtt->lock);
-	ret = xe_ggtt_insert_node_locked(node, size, align,
-					 DRM_MM_INSERT_HIGH);
+
+	ret = xe_ggtt_insert_node_locked(node, size, align);
+	if (ret) {
+		ggtt_node_fini(node);
+		return ERR_PTR(ret);
+	}
+
+	return node;
+}
+
+#ifdef CONFIG_PCI_IOV
+/**
+ * xe_ggtt_insert_node_shareable() - Insert a new node in the shareable GGTT range
+ * @ggtt: the &xe_ggtt into which the node should be inserted.
+ * @size: size of the node
+ * @align: alignment constrain of the node
+ *
+ * Allocations always start from the top (DRM_MM_INSERT_HIGH).
+ *
+ * Return: &xe_ggtt_node on success or an ERR_PTR on failure.
+ */
+struct xe_ggtt_node *xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align)
+{
+	struct xe_ggtt_node *node;
+	int ret;
+
+	if (!ggtt->shareable_size)
+		return ERR_PTR(-ENOSPC);
+
+	node = ggtt_node_init(ggtt);
+	if (IS_ERR(node))
+		return node;
+
+	guard(mutex)(&ggtt->lock);
+
+	ret = ggtt_insert_node_in_range_locked(node, size, align,
+					       ggtt_shareable_start(ggtt),
+					       ggtt->shareable_size,
+					       DRM_MM_INSERT_HIGH);
 	if (ret) {
 		ggtt_node_fini(node);
 		return ERR_PTR(ret);
@@ -710,6 +816,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
 
 	return node;
 }
+#endif
 
 /**
  * xe_ggtt_node_pt_size() - Get the size of page table entries needed to map a GGTT node.
@@ -793,6 +900,7 @@ void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)
  *
  * This function allows inserting a GGTT node with a custom transformation function.
  * This is useful for display to allow inserting rotated framebuffers to GGTT.
+ * Allocates from the usable range only.
  *
  * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
  */
@@ -813,7 +921,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
 		goto err;
 	}
 
-	ret = xe_ggtt_insert_node_locked(node, size, align, 0);
+	ret = xe_ggtt_insert_node_locked(node, size, align);
 	if (ret)
 		goto err_unlock;
 
@@ -835,6 +943,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
 static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 				  u64 start, u64 end, struct drm_exec *exec)
 {
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
 	u64 alignment = bo->min_align > 0 ? bo->min_align : XE_PAGE_SIZE;
 	u8 tile_id = ggtt->tile->id;
 	int err;
@@ -852,16 +961,16 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (err)
 		return err;
 
-	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
+	guard(xe_pm_runtime_noresume)(xe);
 
 	bo->ggtt_node[tile_id] = ggtt_node_init(ggtt);
 	if (IS_ERR(bo->ggtt_node[tile_id])) {
 		err = PTR_ERR(bo->ggtt_node[tile_id]);
 		bo->ggtt_node[tile_id] = NULL;
-		goto out;
+		return err;
 	}
 
-	mutex_lock(&ggtt->lock);
+	guard(mutex)(&ggtt->lock);
 	/*
 	 * When inheriting the initial framebuffer, the framebuffer is
 	 * physically located at VRAM address 0, and usually at GGTT address 0 too.
@@ -880,28 +989,31 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	else
 		end = 0;
 
-	xe_tile_assert(ggtt->tile, end >= start + xe_bo_size(bo));
+	end = min(end, ggtt->size);
+
+	if (end < start + xe_bo_size(bo)) {
+		ggtt_node_fini(bo->ggtt_node[tile_id]);
+		bo->ggtt_node[tile_id] = NULL;
+		return -ENOSPC;
+	}
 
 	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
-					  xe_bo_size(bo), alignment, 0, start, end, 0);
+					  xe_bo_size(bo), alignment, 0, start, end,
+					  ggtt_usable_insert_flags(ggtt));
 	if (err) {
 		ggtt_node_fini(bo->ggtt_node[tile_id]);
 		bo->ggtt_node[tile_id] = NULL;
 	} else {
 		u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
-		u16 pat_index = xe_cache_pat_idx(tile_to_xe(ggtt->tile), cache_mode);
+		u16 pat_index = xe_cache_pat_idx(xe, cache_mode);
 		u64 pte = ggtt->pt_ops->pte_encode_flags(bo, pat_index);
 
 		xe_ggtt_map_bo(ggtt, bo->ggtt_node[tile_id], bo, pte);
 	}
-	mutex_unlock(&ggtt->lock);
 
 	if (!err && bo->flags & XE_BO_FLAG_GGTT_INVALIDATE)
 		xe_ggtt_invalidate(ggtt);
 
-out:
-	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
-
 	return err;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index c864cc975a695..59b2f02870195 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -24,6 +24,10 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt);
 
 struct xe_ggtt_node *
 xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align);
+#ifdef CONFIG_PCI_IOV
+struct xe_ggtt_node *
+xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align);
+#endif
 struct xe_ggtt_node *
 xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
 			      struct xe_bo *bo, u64 pte,
-- 
2.34.1

