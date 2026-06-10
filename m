Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE89CD8CB9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 16:23:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192DC10E4C5;
	Wed, 10 Jun 2026 16:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AaT8eNLh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B169A10E4C5
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 16:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781108605; x=1812644605;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dNWaG2fwVsfYy+RSGXvFWHoOGoMIbV2n32YXxpNb5mI=;
 b=AaT8eNLhfS5pwD874r+n1y/k5mJ0v5aefM+oQRw4YfFi0F1oRByWuwEW
 7Y53AdJj33KtNhRU9CasWrU6ivhUG8sy0CqT8Gp1AaNJGfruzkoONPRhD
 8rO1OwxTCTIkX1KmrU4RlSpvJqYn+2TBC2MF8X23OH7WC46DFrcprZ4Ck
 V/sEF1VxOvKAlJwDCbEFWPA5XjIIehuNKY+LxlgtaqO22OgFBM2Vo6NEF
 P6exTdDRFdUZrl0R+6BO8Mxwu4RRPlqcNfe3DSX/2/PsuwtJv9fZsHdH5
 XYXcypFSSTgSRwvWP3s2Ns6WNIxmGPxjWRXaXjVqUyLW5H5FtYdrTFfc7 w==;
X-CSE-ConnectionGUID: tNsGHjh+RCiEDiy3X9opEg==
X-CSE-MsgGUID: ZgDfr1A8Rb29fqCFpzL7vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81755352"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="81755352"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 09:23:22 -0700
X-CSE-ConnectionGUID: IK4kiGCMQpKenfw044M/pg==
X-CSE-MsgGUID: XquDNpYESNGrcjj/BJmxiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="270218896"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 09:23:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 09:23:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 09:23:21 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.17) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 09:23:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QA28kFaeIJCN4H+70SL53eKZZypsUiISz3bq3zZB3g+gaG5mnVbZXXhOWCfTtkx+EkUZ5lJzab5lupWMZxzh53coaIq5BQ4TaeNVPXrwn7oChkFpn2v1ZqYTcnlbx49Exad5s5laBYZE7vUwx/J/0AEAhQlJJ3rlKubfDluFsErhdqdOXCBAil8v2AJNdcoTRiyBTdapC//IGbEZJ3W3gGiL0oDdk2eNTHmDKmivZVvJBrtdmEqcC73m7jV/gpHok4KQSuqEtf0lbpEiEy0HnAhyK3Iq5wnNA+aslDIxQz9RSKhT1E5mI+BX//WcgNV2ym55K9pzhQd5X2esoagQ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjIjqFPIWc8PqEFK9AeqGXtchPd1o1oJ+kJPpRln1LI=;
 b=fsQgpQhmnv1CBsLOdVwkwwdOFQ0cYePZ2u3UXhslJUdYWI/MT0vdSbjY6FTBPxIwnE5Svte5f3Q7TgKkSCCjBGiu2qGrtmnvYzAgYbxYMhwiOs78mURpwkdneQz/KSKGW59fgiEdJJROhpTv6nZddP/I0mR2mtxz6e/GHahbS7AcAEF+hSms9B3cua2XD6kZnKQ6ML0eSAdzExQg8PvG09LNK9n05GLtQx6TNiJBS5lzbO71fj7XQBaOCNTmhFfJ46LvitkyfDLxriu5KmIqYchukJ2dAGd6yI6771Sj2uUlBxnspG3CQzdzWIJh/Hl7f6/VjG6DycAPq9Pch6CBhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6881.namprd11.prod.outlook.com (2603:10b6:510:200::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 16:23:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 16:23:16 +0000
Date: Wed, 10 Jun 2026 09:23:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2] drm/xe/guc: Avoid self-deadlock in queue destruction
Message-ID: <aimPcuW9zjRuFOzD@gsse-cloud1.jf.intel.com>
References: <20260610120945.1726638-1-arvind.yadav@intel.com>
 <aimLsPSqWY7rUjCS@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aimLsPSqWY7rUjCS@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: BY5PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: 225dccfe-df38-4703-67c2-08dec70c93e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|6133799003|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: zCRQ7goB22UVRYlMUA8S/e5zrOpv4rfqzgeT1h7O3XONXvL1mg+pQ40Fqf6hoQg82QttBt8c90MAa4q/BEmKqDQ8qL0tfFuXHC8G+BiIXlkJLPVAULL3T8nj8/mkRND+EQvyfPWKuouIbBaLlxxYZNRRze4n6N5s6cis8bx3jGhVtDrJ/BEvXoxxL/dNsKFQedk3/M5PaADAJFtnM6gSm+G5tGV/LbtQbBUix1r2t+Cplx/CLdQ2wSpF869ZYLXr0U92LvCFb0QSS1ZkgPY84Bf9+qaSGRsPHADaf0wL/u9cZlqtMqJVKvjDkTdAN7uqKPYUhynqbMHrsaSapXEyTgMJYIl8QA0H2/VhxkTaI4wWUUJ/9EsHs/VL4KMZ8j7vZ7vie37yBTrwOYp/Pw2Mvx9qX4CaEps6eCznwyBMi0ZfnGOevDWeGrAgyk9y1k8pYi2GlPTwQUfu4Eq5FyLxU6QTd8ID9UDwV4TTVUC5cJpB+ZAhyqTvY0FlwOqdvQivKJ49SNEbz1AxiKu9sKpKAWPqHYT5Zwoab2kOb1WFZCDfqKSSD0d5oZ3cb5E8iwxiljitLHtpDYnR/RW769kcp2kLzm+t1Z685DF2J0wf8s0dUQy3eVmv6JF+I8FxrW2hWPM87xQI767GKnREf6s5Yg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmJCaVE2OFR1YlJtb0cwUENhUzlYbG40eXF5MUZRN0NldGdhSzlrcmswenVU?=
 =?utf-8?B?b0R1VzBSU29vYmRiS3lsQVBlVjhROGUxckJlT2RMTDBGNGpONHRVZE5yVU56?=
 =?utf-8?B?VklLMTBCSFdidVRZZjNKZHp5QXdaTGRMTmtxbm5EcGRuR09kSjQvNGJBQ2Vj?=
 =?utf-8?B?THFyRG1vVE8wanRYMkRvVmQ0Y2hMUnFMVlp5MWwza2drNTdhWlhQcEplU1Zz?=
 =?utf-8?B?Z3hzOFdXQzc0TGtVUG1SZkdVL2tCTjNrck4xQUNBdFdBTzZrajdjdW9CUWhK?=
 =?utf-8?B?cXRBVFBTMXJPRVg2QXhpUjd3emF5YTVyT1VJTjJPRC9ZMUkrclc4WFM2OFg1?=
 =?utf-8?B?bmthTWNxcUp2ajlKQWhQSzU3R2U2dGNIUENyZE82OG5IZDB2R1V2RnlGeWdx?=
 =?utf-8?B?a1N1S25BREY5SElqeHgyTUdnSVVHRmlSV1JFUkI2TmN5cE9tWlZQNjBzQmUv?=
 =?utf-8?B?OEJMNkUySEh4VUhnTnpHVzNFZUNzNE9GR2dFY1U0THVaenVycmtOaHVmZk9S?=
 =?utf-8?B?WEtqWVB2SjdDVTZOR1h2cGJyc2FHckUwTTUvdFp6NjZVZy9YckNEbEIwNFhr?=
 =?utf-8?B?bmlnVkhxOTIxbWlpb1lvaFV3RXR3VEJMbjNyUCtsNTlRTENCTnhmM05VTmU1?=
 =?utf-8?B?a296TmJqUDZtU3IreDRRQmVXVVpuVVYzUEVyL3ZkQXNtdEpnS1RJOU56UTNO?=
 =?utf-8?B?YSt2bVRDd2lmUmJHcDZaRVRzUlQrWm5mbUlBV0NXTTYwUFA1Z29oZTZDcG1v?=
 =?utf-8?B?bytSUU4vNkJqcS9COFM0M0dmcGt1dGJseHByZFlOeXBMaittdE5GU0grR2VH?=
 =?utf-8?B?R050ZnNGbHdnVHhTNUtYeVFKR0svVkF4YlllSFdPRzFRTGYxODBJZGJ6VlVl?=
 =?utf-8?B?RFFvclNUbWFNL2l4dkt3a29RVlFpbEhCZnpHSStwSlU3RDNHa2RtTkpjT2Vz?=
 =?utf-8?B?SWlyeDhuNWlwVTU5RURHMFlWTGI2RmdKb0dpNEQ4RWgvWVgvRmVOU2czeUUy?=
 =?utf-8?B?dUVnZGVETWhveElyK0srZWhVSUZPZ3p5eWpIZGZYTFFJTWxxclpMb1RyMlJh?=
 =?utf-8?B?QWZEdDQ3eGNWWG9kdHlianNRRlpLWkJxRmQwOGduMjUxc3NVUVc1eHI1cGRF?=
 =?utf-8?B?NnRzcEVlNU8vei9CUm9rdzJSYlI3UDlJS0N4QnVoRWFUNTVNczNoc2ViMUow?=
 =?utf-8?B?eDV5SW1vbm1QU2ZOUzRMOEV6V2RnV1V4ZHdTUWFQSm1aUm53WVlacVFMeHkv?=
 =?utf-8?B?NDhxWEs5LzlTQSttcW96Y2xTSnhKZy9WRmFLWS9mN1lyYytBUE9lQ2llTVFh?=
 =?utf-8?B?QVhaODRoWmhqcHpmeFNwYUFaV3A4Z05UZXZSU3NXRG1nY0Y2V21ZSCs0ZDZ0?=
 =?utf-8?B?dncrRFVFUFFnaGpjMkdHSmtYYlEreW95Y05Fa0xSVkRuNEc4UHhqaVVLdXdz?=
 =?utf-8?B?V0loRDBDaXAyNCtWcG1LRE8rS0F6aitOVXJ1ek9pVjdXVzVCcnFSRUgvNC9E?=
 =?utf-8?B?NmhaYWsyRlBNQURXYndKalBkeU96N2lVRUk5SUpYblh5M3IvK0pHZ1pYNVoy?=
 =?utf-8?B?NnBjYUpvRzRVSW9wQXdtTk5mVlR3aFEwSGp4Qy9BTUpTMGpNaWdNN3FaYk5k?=
 =?utf-8?B?U1R6SWdKMzI0cEh2NXV5MFVOdGhLUWE3eXBBNDBmR01VSlo5R0IvTy9LYVg2?=
 =?utf-8?B?VHFHdkdzSE4wSy9VYWNZMC84TEY3SjFHemk0UHNvQ3FvSmJLUFlZT1RHc1U0?=
 =?utf-8?B?UnRSQ0M0OGlkdTIwVmFUSFArY0tpbEVlYkhkbXJqVnBmbG5BVHNVa2NIODQ0?=
 =?utf-8?B?U0xRaUFwSEkxVC90ZDVEeEhhejl5MWxTQlpsenNyLzJCYnArOTVjcmE5SlVV?=
 =?utf-8?B?RGJOdlgvRWNUWmx0QnNxTDUyYllBeGg0S1prNXNKTkhsbkRPbkdMNEViNGtM?=
 =?utf-8?B?R0JOb1RsM1FSVk4yK3FpTVJSWlNzNmRadE5SZVJaWXcvOWtSM0xSNkNaNXRk?=
 =?utf-8?B?Q0t4ZEdIRDc4Q1E3b09nVXUxdUQ0YkgzSG5QMlU2NDRCaHRZUENCUjNYdk9k?=
 =?utf-8?B?b2UreXZ1ZjVOSlJpVnJQOGJ1bHNPanJGZmNoaVE0V2xZQzIzRjB0d01ibFdn?=
 =?utf-8?B?YTV2anprMkxvOTA5OVRabDFnOGNCempRYXF5Y0ZtOTBxQmV6UTNNN3dUMVBI?=
 =?utf-8?B?Snc1YVNRNkFPUnNGRlFFMWJyLzF4OTFuYTcxMm1wWDZBTjdzVy9TVGlZTmVB?=
 =?utf-8?B?ZDZWSXV1U2NHQmxxdGpMbmxFdGRkLzJqVzNPR0RRL2hpTGVPT25HaUF2VVlB?=
 =?utf-8?B?dEFvdFpJTzhwQ2R4Zlhla2R0TWVCQktwdzFNNWovNk1tbnhQb25xZz09?=
X-Exchange-RoutingPolicyChecked: WQVjP7z1VzbVtA0e8FVK/ERe8WAF1pUXrzgJFauNa8lOUzcAFFbUOS94vf68cTmZ9O900MTTvi2zv4Q3gTKQBvMr3RlCkHppphi+MWCmUJX9Yud9wKy1PuwYTVFhRWoXNvWETDL7Qr8WPCuXEda6SQq708fjRsw9IZdxg6lOYIpbI77U4p/tTnXNeNXVjWZnWB3/hpnPTRXdR3vfN8CEqeMhlpfaK142Pj4aLO7pGI6QqX+I4B4rIcULgeslKbTI892LFljvp0LXEOnoia4mJP2mQyNQG9pMylkURiTjdQeEHQdZPLTPJdlV8glJkCgBPOigp1LqUiX47EjRaoIxhw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 225dccfe-df38-4703-67c2-08dec70c93e8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 16:23:16.9414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1QosO2kM/CU0/lVHKR9GN9KxpVrkzuhRycZFPVSZJnyUbQ0T8n56kDnVHs8VMEG5EKBiGBqNmkgQyhMwK+K6rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6881
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

On Wed, Jun 10, 2026 at 09:07:12AM -0700, Matthew Brost wrote:
> On Wed, Jun 10, 2026 at 05:39:45PM +0530, Arvind Yadav wrote:
> > GuC exec queue destruction can run on xe->destroy_wq. During queue
> > cleanup, xe_exec_queue_fini() can drop the last reference to objects
> > which eventually release the DRM device and run drmm cleanup actions.
> > 
> > guc_submit_sw_fini(), registered as a drmm action, drains
> > xe->destroy_wq. If the final drm_dev_put() happens from an
> > xe->destroy_wq worker, teardown can try to drain the same workqueue
> > the current worker is running on, causing a self-deadlock.
> > 
> > Fix this by taking an extra drm_device reference across async exec queue
> > cleanup and dropping it from system_dfl_wq. The deferred put work is
> > preallocated during queue init, so the destroy path does not need a
> > failing or nofail allocation.
> > 
> 
> I’m convinced an extra worker is required here.
> 
> The teardown sequence is a mess, but in the DRM dep work [1] I was able
> to move xe->destroy_wq into the DRM dep layer [2] (see
> drm_dep_queue_free_work). I also called drm_dev_get on each queue
> creation and dropped it in drm_dep_queue_free_work via
> drm_dep_queue_free(). It all seemed to work without an additional
> worker.
> 
> In [3], I refactored the Xe object model on top of DRM dep using the DRM
> worker. I was also able to drop the wait_event_timeout in
> guc_submit_sw_fini [4] around the async release of GuC IDs, because the
> drm_dep_get on the queue prevented guc_submit_sw_fini from running until
> all queues had dropped their drm_dev reference.
> 
> I do plan to respin DRM dep in the next few weeks, but given that this
> is common DRM code, it may take a while to merge.
> 
> That said, I don’t see why we can’t merge the DRM dep drm_dev_get/put
> model ahead that, hook a drm_dev_get into exec queue creation, drop it
> as the final action of guc_exec_queue_fini, and remove the
> wait_event_timeout in guc_submit_sw_fini. I think that would work and is
> simpler than what this patch is doing (i.e., it should only be 2 lines
> of code for drm_dev_get/put + delete some unused code).
> 

Sorry for the double reply—I missed a key part of this.

The DRM dep worker that executes drm_dep_queue_free_work is a DRM dep
module worker (see dep_free_wq in [1]), which is created and destroyed
during module load/unlaod. We would need to move xe->destroy_wq into the
Xe module as well, or simply drop it and use system_dfl_wq for the async
queue teardown step. So I guess it’s a little more than two lines of
code, but still relatively straightforward.

Matt

> Matt
> 
> [1] https://patchwork.freedesktop.org/series/163245/
> [2] https://patchwork.freedesktop.org/patch/711933/?series=163245&rev=1
> [3] https://patchwork.freedesktop.org/patch/711937/?series=163245&rev=1
> [4] https://patchwork.freedesktop.org/patch/711934/?series=163245&rev=1
> 
> > This keeps the final drm_dev_put() out of xe->destroy_wq while preserving
> > exec queue teardown ordering.
> > 
> > v2:
> >    - rebase
> > 
> > Fixes: 2d2be279f1ca ("drm/xe: fix UAF around queue destruction")
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  3 +
> >  drivers/gpu/drm/xe/xe_guc_submit.c           | 62 ++++++++++++++++++--
> >  2 files changed, 59 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > index e5e53b421f29..b5dfc9c9092d 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > @@ -13,6 +13,7 @@
> >  
> >  struct dma_fence;
> >  struct xe_exec_queue;
> > +struct xe_drm_dev_put_work;
> >  
> >  /**
> >   * struct xe_guc_exec_queue - GuC specific state for an xe_exec_queue
> > @@ -35,6 +36,8 @@ struct xe_guc_exec_queue {
> >  	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
> >  	/** @destroy_async: do final destroy async from this worker */
> >  	struct work_struct destroy_async;
> > +	/** @dev_put_work: deferred drm_dev_put worker to avoid self-deadlock */
> > +	struct xe_drm_dev_put_work *dev_put_work;
> >  	/** @resume_time: time of last resume */
> >  	u64 resume_time;
> >  	/** @state: GuC specific state for this xe_exec_queue */
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index b29cc08e6291..d1ae4339f375 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/circ_buf.h>
> >  #include <linux/dma-fence-array.h>
> >  
> > +#include <drm/drm_drv.h>
> >  #include <drm/drm_managed.h>
> >  
> >  #include "abi/guc_actions_abi.h"
> > @@ -47,6 +48,11 @@
> >  
> >  #define XE_GUC_EXEC_QUEUE_CGP_CONTEXT_ERROR_LEN		6
> >  
> > +struct xe_drm_dev_put_work {
> > +	struct work_struct work;
> > +	struct drm_device *drm;
> > +};
> > +
> >  static int guc_submit_reset_prepare(struct xe_guc *guc);
> >  
> >  static struct xe_guc *
> > @@ -1674,6 +1680,8 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
> >  	xe_sched_entity_fini(&ge->entity);
> >  	xe_sched_fini(&ge->sched);
> >  
> > +	kfree(ge->dev_put_work);
> > +
> >  	/*
> >  	 * RCU free due sched being exported via DRM scheduler fences
> >  	 * (timeline name).
> > @@ -1681,20 +1689,55 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
> >  	kfree_rcu(ge, rcu);
> >  }
> >  
> > -static void __guc_exec_queue_destroy_async(struct work_struct *w)
> > +static void xe_drm_dev_put_work_func(struct work_struct *work)
> >  {
> > -	struct xe_guc_exec_queue *ge =
> > -		container_of(w, struct xe_guc_exec_queue, destroy_async);
> > -	struct xe_exec_queue *q = ge->q;
> > +	struct xe_drm_dev_put_work *put =
> > +		container_of(work, struct xe_drm_dev_put_work, work);
> > +
> > +	drm_dev_put(put->drm);
> > +	kfree(put);
> > +}
> > +
> > +static void guc_exec_queue_do_destroy(struct xe_exec_queue *q, bool defer_dev_put)
> > +{
> > +	struct xe_guc_exec_queue *ge = q->guc;
> >  	struct xe_guc *guc = exec_queue_to_guc(q);
> > +	struct xe_device *xe = guc_to_xe(guc);
> > +	struct drm_device *drm = &xe->drm;
> > +	struct xe_drm_dev_put_work *put_work = NULL;
> >  
> > -	guard(xe_pm_runtime)(guc_to_xe(guc));
> > +	if (defer_dev_put) {
> > +		put_work = ge->dev_put_work;
> > +		ge->dev_put_work = NULL;
> > +
> > +		put_work->drm = drm;
> > +		INIT_WORK(&put_work->work, xe_drm_dev_put_work_func);
> > +
> > +		/*
> > +		 * Avoid running the final drm_dev_put() from xe->destroy_wq,
> > +		 * since guc_submit_sw_fini() drains that queue.
> > +		 */
> > +		drm_dev_get(drm);
> > +	}
> > +
> > +	guard(xe_pm_runtime)(xe);
> >  	trace_xe_exec_queue_destroy(q);
> >  
> >  	/* Confirm no work left behind accessing device structures */
> >  	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
> >  
> >  	xe_exec_queue_fini(q);
> > +
> > +	if (put_work)
> > +		queue_work(system_dfl_wq, &put_work->work);
> > +}
> > +
> > +static void __guc_exec_queue_destroy_async(struct work_struct *w)
> > +{
> > +	struct xe_guc_exec_queue *ge =
> > +		container_of(w, struct xe_guc_exec_queue, destroy_async);
> > +
> > +	guc_exec_queue_do_destroy(ge->q, true);
> >  }
> >  
> >  static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
> > @@ -1706,7 +1749,7 @@ static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
> >  
> >  	/* We must block on kernel engines so slabs are empty on driver unload */
> >  	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
> > -		__guc_exec_queue_destroy_async(&q->guc->destroy_async);
> > +		guc_exec_queue_do_destroy(q, false);
> >  	else
> >  		queue_work(xe->destroy_wq, &q->guc->destroy_async);
> >  }
> > @@ -1914,6 +1957,12 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
> >  	if (!ge)
> >  		return -ENOMEM;
> >  
> > +	ge->dev_put_work = kmalloc_obj(*ge->dev_put_work, GFP_KERNEL);
> > +	if (!ge->dev_put_work) {
> > +		kfree(ge);
> > +		return -ENOMEM;
> > +	}
> > +
> >  	q->guc = ge;
> >  	ge->q = q;
> >  	init_rcu_head(&ge->rcu);
> > @@ -1989,6 +2038,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
> >  err_release_id:
> >  	release_guc_id(guc, q);
> >  err_free:
> > +	kfree(ge->dev_put_work);
> >  	kfree(ge);
> >  
> >  	return err;
> > -- 
> > 2.43.0
> > 
