Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805DACED275
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 07:45:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D6610E484;
	Tue,  8 Oct 2024 07:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zm1FMa2r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B8C10E484
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 07:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728373519; x=1759909519;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RsebXnJJ5FYNcyly8WSZozD2Arw6bbugY1FNGwvfkAw=;
 b=Zm1FMa2rYBvL8znSCJg38HofAWVyptumVKMhQXk7f/3P58BUIKnXb6fm
 ZNmZIJd2OSKrmPnxmpmGhLM2gUXrgUEaKGp+/RO5b10k9Wzkv37kplAIR
 O2k9yo0j5mLXgJpWYs4XZ/oJGj/z0pzBP4zFpuw7jQyRPEMkqZP7AyGqs
 cZfp33TBeN8T3FADcaqDXH/EFQfct/34UOozpwOTVryA5jNZZUVunIhfC
 LanFHyT9i3funlTSE1YbQRs6Mt6ewC7hjMaiuQ13gfwfX6sCdf2+JyS/8
 cRycEntiSa+ZNSN7sYQ6Ye/KiES0Cqv4pBkgbtCQCfENC4VTcI+zvqB+f g==;
X-CSE-ConnectionGUID: FNWLfzvTQ42Aa2UcJZUl4g==
X-CSE-MsgGUID: BfZtq+FpRYKs+lana7KcUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38940167"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="38940167"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 00:45:17 -0700
X-CSE-ConnectionGUID: i05tTczST0mJrc9ghe+iMw==
X-CSE-MsgGUID: /ArHMCb0SIu+1hP7X23WMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="75602625"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 00:44:41 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 00:44:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 00:44:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 00:44:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R7jK7SXr2plToXAj+V1kw2WNiXd4HMqHxazGSa+cXmCLufQTu+xisgTOmWbwhxiqbAE41jpW8V/0uqK5bo7AsBC9bm/nhAOrgmLok7mxnEKPtFoLaeHBV2bUQyVEWdhPqozXJrZ4iNsdk1YVrmdMkxb3OZawxMgRm5d1Zb4zD/PbYqWLf14UHaHtx5QpC8cHxMZvrT/0fG5dBvXY0D2U2pnp2ynHkkPSwLb8a5ATnMbhDHk9KXDx8vCjmYPOpvUrikshY70MzXQMTQ3M7sOyskDkEiUorGH0XWGThVJo42wXeGzN42eGMXNXqeodvBvEXR/VdBt5+vL2YP/gT6jWqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmJ/PCGZJoFB23gwXzkDKXca/b78BbZFLsFxl6fG8iQ=;
 b=EApMtGgEQFljYGbt4tIGzyBlJKP39Q5oL3i392tZqn5t30QPe9t+X825IX29ibmbe+WUr3oGYC77GZU8UvSSEd0HvzH16mBs4aBkMGkq6EEi30qKZnZoRMSKfdgG624aXV4Ac0XrBMlKJP374ruxQrkJMmI991yOewjIuq+2MfrT5LMPCRVHf7Fug/srjQ94HDnHrDnWMmAaZByH+LEs12uGtUUUL8VVH4pHmYskphLa/4YPy1/fF2GbH8YcFnNbjCu9l07PIGLj6HrXD0lcp53NwfMUu/8Wn60inj3C5rmVdNUbJWupn+lM/Y8UyBa0r2SJfWXw5Xho1LyS11QE4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 07:44:37 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 07:44:37 +0000
Date: Tue, 8 Oct 2024 13:14:27 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Nerlige
 Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH] drm/xe: Decrement client count immediately on file close
Message-ID: <ZwTi234MKHzaIZsn@bvivekan-mobl1>
References: <20240918081150.280055-1-balasubramani.vivekanandan@intel.com>
 <SJ1PR11MB6204E9E9031470ED7D32AF5281622@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <ZuqlWzSaEso1RgI1@bvivekan-mobl1>
 <SJ1PR11MB6204F9F42C3C6C7344C4777A81622@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <fmn7yawuj6t2o6iwlwftyrxyjefkx2sicow6ynpb3evsdzluwi@vtamjjybuavm>
 <ZuveeB0xRivXDe4H@bvivekan-mobl1>
 <kyebnlz3e5oa2jys5doywbtf6d5vuy3zlvfpyf42sajegrkzyu@xop4wwa5hddv>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <kyebnlz3e5oa2jys5doywbtf6d5vuy3zlvfpyf42sajegrkzyu@xop4wwa5hddv>
X-ClientProxiedBy: MA0PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::7) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|IA0PR11MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: d056f14e-d8d7-4bf4-f28e-08dce76d0ef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2JIRC84cHFiRjhFVC9kbFR5ckhid2VBREh1bkRQaTEwZmFiTVlJVENXTTl3?=
 =?utf-8?B?MGJ2MERMYnhSdGZpS3lhc1l0ekhMbkdUV3Y2TnRIdFdDN01ZTk9OTDRXbDZz?=
 =?utf-8?B?ZFZhQjlzMzI3YWJVeTdyRHArTWhRZzl2czZVZDVWM1hSNzZWdTA5WEp0djVL?=
 =?utf-8?B?L2Ixa1VhNmQxeWRIMTlwU3dXejdFTTlYbURuNGgxZ1BWeURlU293TFpyWUNw?=
 =?utf-8?B?VkRHV0VxbFFqYlJ2NzAwb2QvSkdVVW1UMWd5NmFUQ0FEY0tyRlRabWl2aHBY?=
 =?utf-8?B?RUNlMkJOenZyb1Y2R1NCUUJYNHdJaHZUWlVjeHRvRG9yK0o0bHh3QW01aGZN?=
 =?utf-8?B?L3I2SG1pNC9QL0Jzb3ljUzlpeVlDQkFGZ0xidlZZbDArWG9TMlZWbTVnVWR5?=
 =?utf-8?B?emZodGNHTmYxTzdrc1Z3NjdwZG9jRXFXL1E4TkJIZ0JKbTlSTE5PQkhjZlhE?=
 =?utf-8?B?ZGR6RmRtNlM4SnV4TTNoa3VIUE93SlZvOFNNaHFydEc0MzVLUWVKNlB0TWJG?=
 =?utf-8?B?a3RuRTRsdzZDQklkNk84N1ZPbXd5S3VsOTdoT0dHUzlDanhKdVBCaGoxWENW?=
 =?utf-8?B?bVpaVU0yRlUxZnVROEV1c2hYUVBJY1ovZDcrT2JtZ3hnZVB4VlVvdXZaalo5?=
 =?utf-8?B?MVFCcEZ4dHhXRUptYU1WZlBCL2JQU2o1eUYvblpLL1dqT1Y3NlNJOW9sS0JZ?=
 =?utf-8?B?NGlkVDJUdDNYN1hzWmZuRm40dWZYV0NSN28vbGVUcnY2b3VCUGtZQkNibXdE?=
 =?utf-8?B?bFM3d1dheUZCaDJ0REtZUzdtQ1FzdUNPRHorYnJqUk9CV3F6K21vWGlNekhT?=
 =?utf-8?B?RWV5WGV0QmlEZmxtQVB4RFhnOWlaTEJKUWU0TGpFa00wYk1LTys5aDdkZmlk?=
 =?utf-8?B?SzdwV0dLSktOTWVrVDVQMm9zMHY2SUZFc1ZCTFJDQ1UzdVJrcEYyMkdtN0FJ?=
 =?utf-8?B?enZnWEpSNTJ5NjFOZFVmWlEwS0hOSG1YOUtrbVFmN2l3TFBidnE1aGx4RGVO?=
 =?utf-8?B?aGxDTFM3Z1dzMkF3enZCWWxSZStHdmlnMzl2a1FiWVFhMzVZSDRkVHNwNjBT?=
 =?utf-8?B?VUErREZvRTFSc1ZpV2MyRGFCU0UyWitvK0EvRTJGZGFDV0YvelZvbStEM1hj?=
 =?utf-8?B?SkJXY3Z1cm1RQ3NlOWJpVm1zaTRyUFBKUys5czRSSmd5OTIxSFpRYTR1c0hm?=
 =?utf-8?B?bUU4bWFjQmtiOHYwQjJLQVM1THFGOEQ5bG9YbkVOclNUeUlrejhNL1FLSDE2?=
 =?utf-8?B?WlNSazZpSXlvbDArYitaYU5DdnNVWVg0R0ZtUWVFMjBwN3VlRDI4K055VHg1?=
 =?utf-8?B?MmhJVXZlQytFWjc2NjhrS28wSjFLcTVqTnBWNGZ1MHVGM0JrdUxGQUJlKzlH?=
 =?utf-8?B?ck9IMDU5b0cxK2pxNDRaQWs0U1NnQnlqVTR1WUR6QzZuK2xGSnp0K1A4QVBO?=
 =?utf-8?B?KzM3L29wS3d3cmI2clU1L0JvenZlRlZjZkVNbDF2L3kyWGZENW5JYUkvOTZE?=
 =?utf-8?B?ejdaNHFiZVFVOXFTUlVoaWtpOG5ENnZOK1pjZjRKQk5UcFQ1cFNkSk9SQ0tH?=
 =?utf-8?B?Q1JHZkh2ZEozN3VCazQwRHpWUHFadkcwR00zUHoyTkZ2R01JUzFLcmlYSVZx?=
 =?utf-8?Q?dkW4kD4DGwl7EGYDFdNPNpyfO+Rc8tVtQjv2T4v0EdBM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1BLcHNXNkxDUVJyWmRabGJ0V0hKTXJ0MXJ6S0l3cy9MZjR5RUNMd3BFblQ2?=
 =?utf-8?B?dE40LzA5SVcyNC8xbTRaKzliNUE0S1ErdkdDRTUyK0tUOVRhMExFMG1tODhh?=
 =?utf-8?B?RlRzWFBRVVpCcUUreGkwV0MyT1g4V0JQVmsweHErU1BQdFJwL2Z3Zkd2N2l4?=
 =?utf-8?B?SUdiNXdDb2pUZG9hMUl2UVM1dUxGZkZpcENScSt4aHV0bk0vVjROdnFBZmpy?=
 =?utf-8?B?NTRGTHFudGQ0TWJFK0xhQkNZYjR3SEQwbzRha01tQUJ3NXQrU2hZTFRIMFhu?=
 =?utf-8?B?UklvaE1jL1dkcnpnRDNZRmRtLzhDV0Q4WTVZZVFLWVg0RkJYMjJJdDVaU0c0?=
 =?utf-8?B?SzNodFZCMlpKbGNWZmRMa0FVVlZDa2JaczR5akdrWGhtcXZYbUZkTUJUZXBx?=
 =?utf-8?B?djEzbWpOYXRDdVZUOVlqaHdTVlVZWmFGU1UrVnRCQzFVRGpUKzYrejZvd0h6?=
 =?utf-8?B?R3pxQkVTSUdyNWFIekVET0toNjRKU0E0dzJERlBvZWJGa2FVOVhqNVNTcEdl?=
 =?utf-8?B?NWFlN0VEL2s0WS95ZGdMQ1RCSGV5bHF2czdpVEloNlcyK05FYWVRck5kTVVG?=
 =?utf-8?B?U0wraTZkTGZ4V2dLK0NqVG1xeHkwaWdiUmVxRlpmM0RBeWFZU21LdFNOZCtG?=
 =?utf-8?B?WHA3RUFaU1NzWWZMSjlUUUh2RkhwS0lTL1ROSzZzSzE0TUpIRVBvZG1pdlZz?=
 =?utf-8?B?ZXdUYkZNZlFvcVRhWUZwdDdXbWpDdWM0UW05aGNlbGdaaklUZ1ZVS3FZMHVT?=
 =?utf-8?B?SVNWVE0rNERWdFM4Vnl1RnVPWnUwYTRoQ2NHZmVmQS83Z3p5MlBhTTJRNVhq?=
 =?utf-8?B?NzBCTHBaL2Nqd2pma2RVTzlJR2p4MGdlSFJoK2hpbUhieHduNGl5QWMyL0R2?=
 =?utf-8?B?OStUWXl2VlFKZVJsSTdObGtFcmJsS2Z4Q2ZDV3VpbFp5T1lMWEdqUTVPc09Y?=
 =?utf-8?B?eG5aU1hsQVJGMzUra2xsVkg2Z2JVaUlmM1NJVmtzWTJUZzFDUlYwcGpIUFhh?=
 =?utf-8?B?cUN0dXhEck1JNXorWnFuM1ZSd2Jnd2V6ZUJ3akhlbHdLYWNYUXhMTFBPYlMz?=
 =?utf-8?B?WFFlQlh3aEg5dWNYSUpOUjFqSnF6OW9PUWJPa25iRDkvTDVIMU1pdlVxaGxz?=
 =?utf-8?B?MWpvQ2FqTmxWTFF3MERocm5CLzZVK3BVdWlBZm4ycEwvd1FBODBCNjhSdGk5?=
 =?utf-8?B?WlhmNkRVK1h2QVJRUnppUjVOWlVMV3JkQUoxK3Y4NW4vM0JEUlZHUlhiV1Np?=
 =?utf-8?B?RHRMekl2UEhlR3JDMHU5c1RETGtKeTQ1U2RWNTF5M2RwYmxDUlBrTTIrTTM1?=
 =?utf-8?B?RWNudmV6L3lyNTh5dnhSNW1iWlFpSFJKSmdVQkUxaEZhSE1VQVlDOEszdzJy?=
 =?utf-8?B?U0xMTE1leFlmbTFzc3RjRGFxVC9QbmZtU0R2OW0yeE94bkhnaTIvbEZ6MnpC?=
 =?utf-8?B?VEZOQmtkQnFlRHdxUVlOTVd5bFdyUmZvQWF5ZUh1RWJUb2s5M3dCTTBsa25u?=
 =?utf-8?B?US80MUorSVU3VVJiWkY3OU00QU1pOGRhSURLL2lmQVJkb3ZaTWp6SCtIYldB?=
 =?utf-8?B?ZG9XS2NyM2hmdDhGMUFBelcvOXJ1RDlHdUs5TzRtYzJrdjBiS1prVXFsbHA1?=
 =?utf-8?B?UmtnZ0ZpL2VQWjdKUG1JUFdOMVVHMXJpMktLVHkxYjA4ZWFndlI0aUhZK3E2?=
 =?utf-8?B?N3lseWNSY2lBUmRabytKMWJ0NG1nZFNXSERvVTJrUHBsU0FrVXZmUGJOVVpm?=
 =?utf-8?B?a05DcytrVmtsQXlOTDVta3kxRHNiNkxMUWRrVE5pYU1xKzQ1aXZ4NjJjZ1Fp?=
 =?utf-8?B?MUd6NXBXS1FkWlpGMVJabnNPd3lYTkx4SXVCSWFDRGZ3YzE3VlVlcjZ4cWhK?=
 =?utf-8?B?OENZdTVRRGhPMXJ4TXBsbi84NG90eGViTU03cUNZeWxORThhMWR4YWNQbzBD?=
 =?utf-8?B?KzZRNGoxaUYxVlEwa0NjU0RxYmh0ekFLdHJiTTlJSlBOdGZqL0NrVkFuU3lC?=
 =?utf-8?B?a0x3Mk5CNERUMkJQcUZSSUZSbzRnbjR2bnlxbFdDN0ZEUmMvV1h5SytqR3hU?=
 =?utf-8?B?MlVFOWwxWk9rNU5nUllRZkwxaXFHcktNVFFPWVV6Y0JaSDVPUDJTcjM5Tkg3?=
 =?utf-8?B?cVlEa1FrNlZQTW5BdFFhQ0JFbW50MEZmQ2o1aVJjeVA3YkZIc21XcnphUjQx?=
 =?utf-8?Q?sx6iGpS8dXPSzTqJrB3xg74=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d056f14e-d8d7-4bf4-f28e-08dce76d0ef9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 07:44:37.1971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ftOA1hAqlzVm0n/DbIONPrD9geesyTcxEQt6zelU4POeJ/YdA/Re6RorBZtV40+dX/B3j25mQhv1mFyRk6WVWldlxDxjHKFqVTW4lpvFgPLkj2znDciV6RICE/7wggPt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7862
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

On 19.09.2024 06:55, Lucas De Marchi wrote:
> On Thu, Sep 19, 2024 at 01:49:04PM GMT, Vivekanandan, Balasubramani wrote:
> > On 18.09.2024 15:43, Lucas De Marchi wrote:
> > > On Wed, Sep 18, 2024 at 11:11:10AM GMT, Upadhyay, Tejas wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Vivekanandan, Balasubramani
> > > > > <balasubramani.vivekanandan@intel.com>
> > > > > Sent: Wednesday, September 18, 2024 3:33 PM
> > > > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > > > > xe@lists.freedesktop.org
> > > > > Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>;
> > > > > Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; De
> > > > > Marchi, Lucas <lucas.demarchi@intel.com>
> > > > > Subject: Re: [PATCH] drm/xe: Decrement client count immediately on file close
> > > > >
> > > > > On 18.09.2024 15:09, Upadhyay, Tejas wrote:
> > > > > >
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > > > > > > Balasubramani Vivekanandan
> > > > > > > Sent: Wednesday, September 18, 2024 1:42 PM
> > > > > > > To: intel-xe@lists.freedesktop.org
> > > > > > > Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>;
> > > > > > > Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; De
> > > > > > > Marchi, Lucas <lucas.demarchi@intel.com>; Vivekanandan,
> > > > > > > Balasubramani <balasubramani.vivekanandan@intel.com>
> > > > > > > Subject: [PATCH] drm/xe: Decrement client count immediately on file
> > > > > > > close
> > > > > > >
> > > > > > > Decrement the client count immediately on file close. It is not
> > > > > > > required to be deferred to the resource cleanup function. Otherwise
> > > > > > > there will be a small time window, where there will be a non-zero
> > > > > > > client count even after closing all open file handles.
> > > > > > > This affects ccs_mode(xe_compute) igt tests as these tests try to
> > > > > > > change the ccs_mode immediately after closing all file handles, but
> > > > > > > the driver rejects the ccs_mode change request as it sees a non-zero client
> > > > > count.
> > > > > > >
> > > > > > > Fixes: ce8c161cbad4 ("drm/xe: Add ref counting for xe_file")
> > > > > > > Signed-off-by: Balasubramani Vivekanandan
> > > > > > > <balasubramani.vivekanandan@intel.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/xe/xe_device.c | 9 ++++-----
> > > > > > >  1 file changed, 4 insertions(+), 5 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > > > > > > b/drivers/gpu/drm/xe/xe_device.c index 4d3c794f134c..3bccea6212ff
> > > > > > > 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > > > > @@ -107,17 +107,12 @@ static int xe_file_open(struct drm_device
> > > > > > > *dev, struct drm_file *file)  static void xe_file_destroy(struct kref *ref)  {
> > > > > > >  	struct xe_file *xef = container_of(ref, struct xe_file, refcount);
> > > > > > > -	struct xe_device *xe = xef->xe;
> > > > > > >
> > > > > > >  	xa_destroy(&xef->exec_queue.xa);
> > > > > > >  	mutex_destroy(&xef->exec_queue.lock);
> > > > > > >  	xa_destroy(&xef->vm.xa);
> > > > > > >  	mutex_destroy(&xef->vm.lock);
> > > > > > >
> > > > > > > -	spin_lock(&xe->clients.lock);
> > > > > > > -	xe->clients.count--;
> > > > > > > -	spin_unlock(&xe->clients.lock);
> > > > > > > -
> > > > > > >  	xe_drm_client_put(xef->client);
> > > > > > >  	kfree(xef->process_name);
> > > > > > >  	kfree(xef);
> > > > > > > @@ -178,6 +173,10 @@ static void xe_file_close(struct drm_device
> > > > > > > *dev, struct drm_file *file)
> > > > > > >
> > > > > > >  	xe_file_put(xef);
> > > > > > >
> > > > > > > +	spin_lock(&xe->clients.lock);
> > > > > > > +	xe->clients.count--;
> > > > > > > +	spin_unlock(&xe->clients.lock);
> > > > > >
> > > > > > The file_close here is sychronus and serialized call with respect to
> > > > > userspace. Any settings done through sysfs post file_close should not required
> > > > > this change as far as I know. Would please explain scenario better?
> > > > >
> > > > > In the current code, the client count is decremented in the function
> > > > > xe_file_destroy which is not invoked synchronously from xe_file_close.
> > > > > It is called when all references to xe_file are lost.
> > > > > References to xe_file are held during creation of vm and exec_queues. So the
> > > > > somebody might still be holding reference to xe_file while xe_file_close is
> > > > > called. Therefore the invocation of xe_file_destroy might be deferred.
> > > > > As of result, driver might see a non-zero client count even after all file handles
> > > > > are actually closed which is incorrect. We can defer only the freeing of
> > > > > resources to xe_file_destroy but the client count can be immediately adjusted
> > > > > in xe_file_close.
> > > >
> > > > If whoever has hold ref, might still use ccs, why would we allow changing ccs mode in that case!
> > > 
> > > if the file is closed, there wouldn't be any submission at all. ref is
> > > kept alive for the data to be available for updates on the sw side only.
> > > 
> > > but I'm wondering on the value of this client tracking... this is so
> > > uncommon that we maybe should rely just on the list of open files being
> > > empty?
> > 
> > Using this client count also blocks changing the ccs mode even when any
> > display activity increments the client count. During module load, fbdev
> > initialization increments the client count. ccs_mode change should be
> > independent of display.
> 
> hum... so also kernel clients? But I'm not sure it's required for kernel
> clients as kernel itself is aware of when/if it's changing.
> 
> > 
> > I am thinking does it make sense to confirm if the all ccs engines are
> > idle before attempting the ccs_mode change.
> > @Niranjana your thoughts?
> 
> 
> I think the problem is.... it changes the number of CCS engines. What
> happens if a client doesn't have something active on CCS, but was
> expecting it to match the value from a few seconds ago, before someone
> changed CCS_MODE.

Posted a new series replacing this one -
https://patchwork.freedesktop.org/series/139679/.
Please ignore this series.

Regards,
Bala

> 
> Lucas De Marchi
> 
> > 
> > Regards,
> > Bala
> > 
> > > 
> > > Lucas De Marchi
> > > 
> > > >
> > > > Tejas
> > > > >
> > > > > Regards,
> > > > > Bala
> > > > > >
> > > > > > Tejas
> > > > > > > +
> > > > > > >  	xe_pm_runtime_put(xe);
> > > > > > >  }
> > > > > > >
> > > > > > > --
> > > > > > > 2.34.1
> > > > > >
