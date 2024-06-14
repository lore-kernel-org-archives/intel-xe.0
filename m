Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CB5C27C77
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 18:38:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D616710EE26;
	Fri, 14 Jun 2024 18:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y1UjhimE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79AD910EE25
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 18:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718390302; x=1749926302;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=KaFShrVqLpTIZVK4lvGeQ6pN6lNy6diMqpJ9eiIcNxw=;
 b=Y1UjhimELfKhCVqFflzy1fSHTPqRWPOR00gaFLJgU2BFuWB6fVSdwsYH
 OBB08TvUjzShKnfGIRIyy5ms4FCNJswWJqZFREkiEjlvdY2Ml8/ZNP+aZ
 VQYp+z311GtgN9NzQXVTsclhcNaNUjCJ7FyGx4/LFfoU8iZ7oM1nGvjQW
 tfNLO0nQd9YbP/Bx/HWpgYBYv9dNYip+QGqxn7W0O5jqMkeR56oefCwA0
 Er+Bc358iE7HD5wztV3TQIKyJKcQ/wE+b3RAMdgvHuNMFfR/lCVNs6rJk
 thiY2HtNlI4O+Fnj+ploxfEaqzIWD++H3OPGtfpn+C0aiaTKT6CrgAioF w==;
X-CSE-ConnectionGUID: WdZvRpdCQB6Fjw8bWbB5Sw==
X-CSE-MsgGUID: lu5c74x7QB+rNhIEioID/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15129003"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="15129003"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 11:38:21 -0700
X-CSE-ConnectionGUID: t7OfokBESjezAdE4Lgb58w==
X-CSE-MsgGUID: yXVGaomyRjixvIMaMn0XDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="40453976"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jun 2024 11:38:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 11:38:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 14 Jun 2024 11:38:20 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 11:38:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVpNRSUQ0yATDAkC0WXegdwzzjnHjNiLtzFpht6ceA2aTBF1kdqvDKSV3OAa2CbbDVcazQK0VystskfIPCXBOH0h5unY5XwQRKpKktPdfuBZzpbAHQcMrRL8Mehw6L9VLpLBC+Cs72ECChIXNLXCLwfctXKECifMg8/10sO0d5ZQmAO5jdlzq0rDcTS3FhgYOAvQhqmNNTuqs8cCQK/QgVAe+pLRP5C5fbNVSbZPQV31EH6bdllwOMBkWnGP7tp+g8ElrZmcBZQ9EkNZ6w/rr4i2HEWb0vMhJNTS97oBGKc2J6W6TM6IIixYEkeUGKrDz22W74VWwXnSFivbsUjzag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Txpt8x1DWM6Bnf/2roUDSQqz6SQ0DzD/AtAiSntVhsg=;
 b=B5gzhkv1XeTxQZmtIp3eJOme2k0183qWXwREucYOkuyxtWwqOFRYk8CnzvguP2IlP5EtVNpykldJL+iRfUJZsDHqAnb+m0p/HFdpNYe226Ft9xdBZxxsinAvK22iT/mKUgh5KHtdcouGWXndrrw/X94fUfg/VehWLgpGv++eAXLTt0ATmVQWve0skLJ1bnq/6FHnehKRwky8NpSApC1I0VWX6XWnSF5bqtvg+nQuHMFg4tLwbyiWHAhFPfFiZjPh/01qDWscITAR2B35rAb8UuJgrT1SfxD64pv0o1jT1iW6FRNSQDfD3WDfzcxUCHlmz/MwGw1z6rlQ6TkB1w6NYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB7431.namprd11.prod.outlook.com (2603:10b6:510:273::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Fri, 14 Jun
 2024 18:38:18 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 18:38:18 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Paulo Zanoni <paulo.r.zanoni@intel.com>, "Francois
 Dugast" <francois.dugast@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Fix missing runtime outer protection for
 ggtt_remove_node
Date: Fri, 14 Jun 2024 14:37:58 -0400
Message-ID: <20240614183758.77736-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0083.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::28) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b0972dd-52fd-4e99-823b-08dc8ca128ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlhDZlducjI0TEFSdjZyUmRDTnFxNG1UMlpHR2U0djB5Yk9OY0pDSFAzKyto?=
 =?utf-8?B?a0JlckI3dVhSRXpYQmtrd0N4T1JJYnI2dUowbGlFNUJ2UTU1NkZHRndwakJQ?=
 =?utf-8?B?aDdYK3o0K3JWQ1R1M0pWRnVPcVJnN0JEd3BmY0ZCVTRtN0FJMVZiNFVRY3Zo?=
 =?utf-8?B?S0tKZGpDalhLSHBOeGo4K2JyVGRxVndFUEl6VXhqaStQai9pUm94akZCaG1q?=
 =?utf-8?B?SmtyVnlWS1k0WGxYYmpweDJPNG5FaGpqMHg4bmdyUWZJRGlzbG16SE84ZU8x?=
 =?utf-8?B?ckcyVmxsL0NRNEk0NTVnRVFEeGJpR2VxelUyYWVRUG5oUm44WTRsM2pMUWZo?=
 =?utf-8?B?QXhmbjdIL3VmbGs2M1JHZkt1RVo4ZzZHRjcyV1NyYUI0VGZPU24zRTdxY2VL?=
 =?utf-8?B?emh3ck53cDMwNnNWZVMwRVVBVm9FdTNEWVlWWDRIb1JiTzhmQ0hMeFZ3YzRO?=
 =?utf-8?B?d2JTeHJGODlUc1BBVmxBL1pudXloR2lNMFkrbUZubUVLRStGTHVDS09JbGQ2?=
 =?utf-8?B?K2QxaDlqTHEyamJQdTVZLzNSdWw3SzVBQkdsWld2QnlCdFR6Q2JBTFNPN21O?=
 =?utf-8?B?T0Y1Yjg2QWIwRXlBQ1RId3VjWlFyd1I3Ri80ZXBNZm11QVZJVndHVUN6ZmNT?=
 =?utf-8?B?aFE3Z1J3WXJOMTViNm8zcGd6YUw1RENTOGtUV001K1ovd1NkV1F4UXBCYjNZ?=
 =?utf-8?B?M2tzSmJKSXF1VmtWb0hTaWVBUTY2Z1NPNEZXV1NjQ0lyeVJIelZsRXpYdDN5?=
 =?utf-8?B?aFptOU13bXVwaTMwaEkrWGtpTnBtVlRhbnRYc29WdFY2RU1GWFEvbDhLaUNB?=
 =?utf-8?B?cmkvZ2o2Z3lURFFoVTd0eVNJN3ZoZ0YyNFJFc3NEZHN6TlZXYmxlb1BZNkw3?=
 =?utf-8?B?bWdKUnFjbWRqSldvRDhsVk9KUnkvM2dmaVZOdjU3MlA3czlhaER5bXhNS0Zy?=
 =?utf-8?B?UzZjelJMencxTzAyY1VtaEtMWWEwdCtRem4wYldOcTZqemt1cUZWSVI1OElV?=
 =?utf-8?B?b2EzTWNGVFZvVmhIZkRPTlEveWxvTnUybEx6TzNncTEvcEsza1hLWnVYOGlQ?=
 =?utf-8?B?ck9LVXJjdjg0bmlwRyt6Y3dLcEhnZkV0YWtqSGo4YXM0NjVqSmErWDlqaDhj?=
 =?utf-8?B?MEdJbDllbFdvenJyYzQzU0h3YUxOK0pHUEpGbVBLcEljTkxxc1RmaTRvRTFC?=
 =?utf-8?B?cEtwbVhYVnR4QXVBaDhodWJ1RlYrRXhxVWJCeENLS1hFSzBBQWlINmpLaW1N?=
 =?utf-8?B?dnNvdVplM3NPN3oveUpQSHlUdGFMMGFVRVJiUnd1Q3N4RkVRL2VWaXNoblhu?=
 =?utf-8?B?b0FaUkI3UnJIN003dGE4aGNNeXFuZXB4aHdxVm1ldUdwbGVrenNsVXkwTUJ0?=
 =?utf-8?B?VmZtK3BkRXllWVplZ2hNRFg5enl5RDFCS0gvb25IYlJVYi9XQUtDZWl4R21J?=
 =?utf-8?B?RmM0cGpoT2ZkaU9TM2c2dTRBUmNMR3IyZ2N2UTh0MVl1QjJscGVpcGFibEpG?=
 =?utf-8?B?UzBxd2lSd1lpRGFNWk5ubFRHWFJ3cWUxT2Jja2I3cm9VcE9YYVdDZ2Y3L1ZZ?=
 =?utf-8?B?Z0RJK1R1L2Z0SWJ5WjYvSkh5OTllWDh1bU1LUFMvNDdwZTA3cWF0OUthQ2k4?=
 =?utf-8?B?WEZuTzNTY1VtUmUrR1VJcTRNRFJmZXcxSXdyYUFNeUZhVnU5ZTJoYTN1dkVQ?=
 =?utf-8?B?KzR6eEloMThOR1FSOFlESkhnc0JVOWJFNFhPWEg0S2t1SDZsU3RPZ3NSTjd2?=
 =?utf-8?Q?nPWI8aSTzrCsRjwBoee6JCk7Wvkl7VPWNss2vq9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXJ3eEk4S3plTVRsVmcvVjhUUVNuSkxhMVZhYVF4OHkzNVpwWGRaeEpmZmdZ?=
 =?utf-8?B?N2N5RzJpQjhpdGtrWmRmZkNEMXJnZnV0ajdCUzdyQk43SHAyWHFUbDJINUx1?=
 =?utf-8?B?aW5OeFhDc0l6Wnl3TUFTQ3k2cUJya05uOGcyZHA0TmFvdVV3dDdNYzR0bWtK?=
 =?utf-8?B?R3Avc3RnV2ROdGpCWVRWWGRGMnFZVjloL2VNeE9uckdIY292Z0tVOVJKZ2hm?=
 =?utf-8?B?V3FzMzBqbUJzblYzQ3VtLzc2dXZreWhvV1R6UFVjKzFTQXJDU0R5enY4c1FB?=
 =?utf-8?B?M2tOU3l0RWdvWjVyQy8rWFhZZjJQWVgzaVIydWpvQmxlRzlrYmVIa0JSd1JM?=
 =?utf-8?B?dVBzN2JOSUVEdWlBVklmZkxoRU9OWWR3dkhHdmtXRGcxUDEvU3NCQ2k1d3E3?=
 =?utf-8?B?LzZTd21EbFkzaHdocklYM0V6L0FpUXY3SlJSdG50ZXJTaTJvT3pubkk2T2RQ?=
 =?utf-8?B?MU1hYmdHTy82K1JzT0FhTlNqQ2tDSVM2c0F5b2ZOYXBDSEhrSjZ6cWNmaTZK?=
 =?utf-8?B?Nk1sQ1pUa2pnaDVIVnkyRkxDczdPWEo1c3hIL010V3gyOWFiMjEvbi9OZFEw?=
 =?utf-8?B?dUJkQ1ExMG1mdndlaUI2d2J2N3NJTWtKSjZnYk9ySnU1L2dBUkpGR2tSUHFQ?=
 =?utf-8?B?aXFYRWFFNnMwejIyYjFnbU5GY2RRWTdqTEJVRzMyUTYyMTBNcmplVW93NU5k?=
 =?utf-8?B?bEFoQUkxb09Gd0ZlZ3ZJRTVWTzc5WlpBdUlLa0hoNWQ5M1J0djhOMndzOGpJ?=
 =?utf-8?B?MXpTcVUyUXhmUG5KQXI4NkgwcTZUQ1JmSU1Xb2UvSVZZMnpoOVVjUFNKaEZF?=
 =?utf-8?B?U20xOU1BRFNKZmQ1Y04zdVNseFRBODBqSHFSdnVrWHcwNk5uR3F1S1NGTGVw?=
 =?utf-8?B?ZlAyMXRJUzRnNGFJT1hxa0hER1dHdkxJRE9BQ21renhBUlIwTGJ1Z3BhK2VH?=
 =?utf-8?B?RFN4MzJoSExtZWhsSG9kNU1oWTNNM1BWQlFnOW5kTkN6UEYyUkJWdFJFVHJD?=
 =?utf-8?B?Ry84SkZrMkJIdUZGbmZqTlNFZk11Uk94VFNNdEdsM2Jnbm90TDF6NGlPOCt0?=
 =?utf-8?B?cGhXM0U1ekRtOXRpYVViZzFJMERsVFFtd2FCYis3LzFmcDNtdFBnWlJCVm8w?=
 =?utf-8?B?c3UwZFNoMW1jalIvS0VvMXg4WlIwSHpsQWhyRjl3cXdCKzNqeUdNUmtLQTdh?=
 =?utf-8?B?MHNRckRBVjZLeElxMFl6bkI3OFdHUUVaQnByVTZOZVh2bVhjYjdUS05qSHBV?=
 =?utf-8?B?MDZHN1NwTHNBVnBxQ3JGNlkwU3U1c2x6NkxjalA0MFIrYUh4djBFamEzKzBP?=
 =?utf-8?B?cExSdEpDZ0dBaHgrWngxOXQxT2tRbWpEczVJSnU1TkhBdS9XNzI3RDQzU3Q4?=
 =?utf-8?B?RmRUNVp4RVY4Vk02eEttTlExRFhEaEFBVldCQ1VhZERqR2tBcEdnL3FaSFlS?=
 =?utf-8?B?SnpTc3oxcTQ2cFBQWkpxZXBOMkdpM3hsb3lhem1NTGYzMVMvV1BQVC96OHAx?=
 =?utf-8?B?cWRHS2o1TGdZcjdMZ2Y4aTFpQ2J0NURjM29FMThnVldHdlc3MmgxcnY0dVF3?=
 =?utf-8?B?RlFnWUZCb0h5ZDJCazdNV1VzdStIYjJYZW1WaHRMN2I5ZzBJdHdjTmxsbjZC?=
 =?utf-8?B?b1BsZ0REeTNnUUxBZ2JDUTNZNXVkSGxjQkh0QjFMS2twTEJ6NXBRbldNcnph?=
 =?utf-8?B?NXBBdWpweEkyK0RKSFVLSzdXYVBWWWM5cGZ1RllMTWtCN3p0RHRPK1BhRS9m?=
 =?utf-8?B?aXNGUXd0Vlk0T0RuQVdoUytGWHlGMzVxSnlQV0VZM3NUdkNMOU41YXVYRDZP?=
 =?utf-8?B?ZjVtUlo4eWZDeG9tdVhaQTNEbmhvNUdrNGI4SGRMUGtWZDFFV0ZFOW9kRlZa?=
 =?utf-8?B?aVpOMUNVL2RxS3NkeXlWbngzWW9DVEdPOEYwR292WnNBSVRMUDh5aVdTenNL?=
 =?utf-8?B?clZFZWVTK2xqelJhOFMwMHRrc1ZMUkRaN1ZjbThYQUdRVnZoM2N6SndQSXFO?=
 =?utf-8?B?dXhvdEpSSUg2aUJ5ODJveTNHMGQxKzhOTjh5UXBJdEg3OWRTanVPYzJZUU00?=
 =?utf-8?B?clJQdjVKVjQ2RUZhVWlYM2haeHFIZ1FJYUNQYVVVRmFTQUdyOWltaWJnRGZk?=
 =?utf-8?Q?q07+F3FM42iCx1KNY96ZcFXur?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b0972dd-52fd-4e99-823b-08dc8ca128ad
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 18:38:18.5810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1lf5P3fTVjHQQ6a+JSNGSeVNadOxGAYDC4OUXRE85zSz3Jjr5R/j4ey9utM0WkOcOvtWeE8QcwV3IyHjrVsSUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7431
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

Defer the ggtt node removal to a thread if runtime_pm is not active.

The ggtt node removal can be called from multiple places, including
places where we cannot protect with outer callers and places we are
within other locks. So, try to grab the runtime reference if the
device is already active, otherwise defer the removal to a separate
thread from where we are sure we can wake the device up.

v2: - use xe wq instead of system wq (Matt and CI)
    - Avoid GFP_KERNEL to be future proof since this removal can
    be called from outside our drivers and we don't want to block
    if atomic is needed. (Brost)
v3: amend forgot chunk declaring xe_device.
v4: Use a xe_ggtt_region to encapsulate the node and remova info,
    wihtout the need for any memory allocation at runtime.
v5: Actually fill the delayed_removal.invalidate (Brost)
v6: - Ensure that ggtt_region is not freed before work finishes (Auld)
    - Own wq to ensures that the queued works are flushed before
      ggtt_fini (Brost)
v7: also free ggtt_region on early !bound return (Auld)

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c |  10 +-
 drivers/gpu/drm/xe/xe_bo.c             |   2 +-
 drivers/gpu/drm/xe/xe_bo.h             |   6 +-
 drivers/gpu/drm/xe/xe_bo_types.h       |   6 +-
 drivers/gpu/drm/xe/xe_ggtt.c           | 130 ++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_ggtt.h           |   1 -
 drivers/gpu/drm/xe/xe_ggtt_types.h     |  23 +++++
 7 files changed, 131 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index a2f417209124..b84139b27970 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -153,7 +153,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 	}
 
 	vma->dpt = dpt;
-	vma->node = dpt->ggtt_node;
+	vma->node = dpt->ggtt_region->node;
 	return 0;
 }
 
@@ -203,8 +203,8 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
 		align = max_t(u32, align, SZ_64K);
 
-	if (bo->ggtt_node.size && view->type == I915_GTT_VIEW_NORMAL) {
-		vma->node = bo->ggtt_node;
+	if (bo->ggtt_region->node.size && view->type == I915_GTT_VIEW_NORMAL) {
+		vma->node = bo->ggtt_region->node;
 	} else if (view->type == I915_GTT_VIEW_NORMAL) {
 		u32 x, size = bo->ttm.base.size;
 
@@ -322,8 +322,8 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
 
 	if (vma->dpt)
 		xe_bo_unpin_map_no_vm(vma->dpt);
-	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node) ||
-		 vma->bo->ggtt_node.start != vma->node.start)
+	else if (!drm_mm_node_allocated(&vma->bo->ggtt_region->node) ||
+		 vma->bo->ggtt_region->node.start != vma->node.start)
 		xe_ggtt_remove_node(ggtt, &vma->node, false);
 
 	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 74294f1b05bc..0bfd6d1eb0be 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1072,7 +1072,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 
 	xe_assert(xe, list_empty(&ttm_bo->base.gpuva.list));
 
-	if (bo->ggtt_node.size)
+	if (bo->ggtt_region->node.size)
 		xe_ggtt_remove_bo(bo->tile->mem.ggtt, bo);
 
 #ifdef CONFIG_PROC_FS
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 6de894c728f5..aeb1ebc0d3fc 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -194,9 +194,9 @@ xe_bo_main_addr(struct xe_bo *bo, size_t page_size)
 static inline u32
 xe_bo_ggtt_addr(struct xe_bo *bo)
 {
-	XE_WARN_ON(bo->ggtt_node.size > bo->size);
-	XE_WARN_ON(bo->ggtt_node.start + bo->ggtt_node.size > (1ull << 32));
-	return bo->ggtt_node.start;
+	XE_WARN_ON(bo->ggtt_region->node.size > bo->size);
+	XE_WARN_ON(bo->ggtt_region->node.start + bo->ggtt_region->node.size > (1ull << 32));
+	return bo->ggtt_region->node.start;
 }
 
 int xe_bo_vmap(struct xe_bo *bo);
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 86422e113d39..f45b1c4bbb6d 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -14,6 +14,8 @@
 #include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/ttm/ttm_placement.h>
 
+#include "xe_ggtt_types.h"
+
 struct xe_device;
 struct xe_vm;
 
@@ -38,8 +40,8 @@ struct xe_bo {
 	struct ttm_place placements[XE_BO_MAX_PLACEMENTS];
 	/** @placement: current placement for this BO */
 	struct ttm_placement placement;
-	/** @ggtt_node: GGTT node if this BO is mapped in the GGTT */
-	struct drm_mm_node ggtt_node;
+	/** @ggtt_region: GGTT region node if this BO is mapped in the GGTT */
+	struct xe_ggtt_region *ggtt_region;
 	/** @vmap: iosys map of this buffer */
 	struct iosys_map vmap;
 	/** @ttm_kmap: TTM bo kmap object for internal use only. Keep off. */
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 8ff91fd1b7c8..0d8de8a1e189 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -101,6 +101,7 @@ static void ggtt_fini_early(struct drm_device *drm, void *arg)
 {
 	struct xe_ggtt *ggtt = arg;
 
+	destroy_workqueue(ggtt->wq);
 	mutex_destroy(&ggtt->lock);
 	drm_mm_takedown(&ggtt->mm);
 }
@@ -191,6 +192,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	else
 		ggtt->pt_ops = &xelp_pt_ops;
 
+	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, 0);
+
 	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
 		    ggtt->size - xe_wopcm_size(xe));
 	mutex_init(&ggtt->lock);
@@ -389,7 +392,7 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
 	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
-	u64 start = bo->ggtt_node.start;
+	u64 start = bo->ggtt_region->node.start;
 	u64 offset, pte;
 
 	for (offset = 0; offset < bo->size; offset += XE_PAGE_SIZE) {
@@ -398,18 +401,98 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 	}
 }
 
+static void ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+			     bool invalidate)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	struct xe_ggtt_region *ggtt_region = container_of(node,
+							  typeof(*ggtt_region),
+							  node);
+	bool bound;
+	int idx;
+
+	bound = drm_dev_enter(&xe->drm, &idx);
+
+	mutex_lock(&ggtt->lock);
+	if (bound)
+		xe_ggtt_clear(ggtt, node->start, node->size);
+	drm_mm_remove_node(node);
+	node->size = 0;
+	mutex_unlock(&ggtt->lock);
+
+	if (!bound)
+		goto out;
+
+	if (invalidate)
+		xe_ggtt_invalidate(ggtt);
+
+	drm_dev_exit(idx);
+out:
+	kfree(ggtt_region);
+}
+
+static void ggtt_remove_node_work_func(struct work_struct *work)
+{
+	struct xe_ggtt_region *ggtt_region = container_of(work,
+							  typeof(*ggtt_region),
+							  delayed_removal.work);
+	struct xe_device *xe = tile_to_xe(ggtt_region->ggtt->tile);
+
+	xe_pm_runtime_get(xe);
+	ggtt_remove_node(ggtt_region->ggtt, &ggtt_region->node,
+			 ggtt_region->delayed_removal.invalidate);
+	xe_pm_runtime_put(xe);
+}
+
+static void ggtt_queue_remove_node(struct drm_mm_node *node, bool invalidate)
+{
+	struct xe_ggtt_region *ggtt_region = container_of(node,
+							  typeof(*ggtt_region),
+							  node);
+
+	queue_work(ggtt_region->ggtt->wq, &ggtt_region->delayed_removal.work);
+}
+
+void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+			 bool invalidate)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+
+	if (xe_pm_runtime_get_if_active(xe)) {
+		ggtt_remove_node(ggtt, node, invalidate);
+		xe_pm_runtime_put(xe);
+	} else {
+		ggtt_queue_remove_node(node, invalidate);
+	}
+}
+
+static struct xe_ggtt_region *ggtt_region_init(struct xe_ggtt *ggtt)
+{
+	struct xe_ggtt_region *ggtt_region = kzalloc(sizeof(*ggtt_region),
+						     GFP_KERNEL);
+
+	if (!ggtt_region)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_WORK(&ggtt_region->delayed_removal.work, ggtt_remove_node_work_func);
+	ggtt_region->ggtt = ggtt;
+
+	return ggtt_region;
+}
+
 static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 				  u64 start, u64 end)
 {
 	int err;
 	u64 alignment = XE_PAGE_SIZE;
+	struct xe_ggtt_region *ggtt_region;
 
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
 		alignment = SZ_64K;
 
-	if (XE_WARN_ON(bo->ggtt_node.size)) {
+	if (XE_WARN_ON(bo->ggtt_region->node.size)) {
 		/* Someone's already inserted this BO in the GGTT */
-		xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
+		xe_tile_assert(ggtt->tile, bo->ggtt_region->node.size == bo->size);
 		return 0;
 	}
 
@@ -417,9 +500,14 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (err)
 		return err;
 
+	ggtt_region = ggtt_region_init(ggtt);
+	if (IS_ERR(ggtt_region))
+		return PTR_ERR(ggtt_region);
+	bo->ggtt_region = ggtt_region;
+
 	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
-	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, bo->size,
+	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_region->node, bo->size,
 					  alignment, 0, start, end, 0);
 	if (!err)
 		xe_ggtt_map_bo(ggtt, bo);
@@ -443,43 +531,15 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
 }
 
-void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
-			 bool invalidate)
-{
-	struct xe_device *xe = tile_to_xe(ggtt->tile);
-	bool bound;
-	int idx;
-
-	bound = drm_dev_enter(&xe->drm, &idx);
-	if (bound)
-		xe_pm_runtime_get_noresume(xe);
-
-	mutex_lock(&ggtt->lock);
-	if (bound)
-		xe_ggtt_clear(ggtt, node->start, node->size);
-	drm_mm_remove_node(node);
-	node->size = 0;
-	mutex_unlock(&ggtt->lock);
-
-	if (!bound)
-		return;
-
-	if (invalidate)
-		xe_ggtt_invalidate(ggtt);
-
-	xe_pm_runtime_put(xe);
-	drm_dev_exit(idx);
-}
-
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
-	if (XE_WARN_ON(!bo->ggtt_node.size))
+	if (XE_WARN_ON(!bo->ggtt_region->node.size))
 		return;
 
 	/* This BO is not currently in the GGTT */
-	xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
+	xe_tile_assert(ggtt->tile, bo->ggtt_region->node.size == bo->size);
 
-	xe_ggtt_remove_node(ggtt, &bo->ggtt_node,
+	xe_ggtt_remove_node(ggtt, &bo->ggtt_region->node,
 			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 4a41a1762358..75511b5f43eb 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -30,7 +30,6 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 			 u64 start, u64 end);
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
-
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
 
 #ifdef CONFIG_PCI_IOV
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index d8c584d9a8c3..202d7f3085ba 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -34,6 +34,29 @@ struct xe_ggtt {
 	const struct xe_ggtt_pt_ops *pt_ops;
 
 	struct drm_mm mm;
+	/** @wq: Dedicated unordered work queue to process node removals */
+	struct workqueue_struct *wq;
+};
+
+/**
+ * struct xe_ggtt_region - GGTT region node
+ * It needs to be initialized before the drm_mm_node insertion in the GGTT.
+ */
+struct xe_ggtt_region {
+	/** @ggtt: Back pointer to xe_ggtt where this region will be inserted at */
+	struct xe_ggtt *ggtt;
+	/** @node: The drm_mm_node itself */
+	struct drm_mm_node node;
+	/**
+	 * @delayed_removal: Information for removal through work thread when
+	 * device runtime_pm is suspended
+	 */
+	struct {
+		/** @delayed_removal.work: The work struct for the delayed removal */
+		struct work_struct work;
+		/** @delayed_removal.invalidate: If it needs invalidation upon removal */
+		bool invalidate;
+	} delayed_removal;
 };
 
 #endif
-- 
2.45.1

