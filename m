Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131CBCF9C6B
	for <intel-xe@archiver.kernel.org>; Tue, 24 Sep 2024 12:58:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B94C710E2B7;
	Tue, 24 Sep 2024 12:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RTHh3NrV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA32B10E2B7
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Sep 2024 12:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727182735; x=1758718735;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cgDG89U/plZsbmdXLtAEHLTvo7f9QoX7thDbwq4AjQU=;
 b=RTHh3NrVOjwXmFoRlJHIueLMLHJVUachPtE+qj1IFiUJgTPm21SOfmMl
 SKScxfaPqZhzwNxXjQYVeWSxMUpPOXEi/erzCAeekKzrw4M+nM1EivG91
 DaZXAIgzkE7FeJda4ZTrGmUCTuvbJcArI5OOg4FBcQvkMWujLeMetZHCu
 0FK80TQwWzhvlN88Y0vYLDVYOFnEMnOFz8i3/RYp036/3SexCCjZkKb0J
 zEH7RWgZBTeeOgWzFm4OHTSbGastQ5avV/yMwwMWzIFSq0qzuDNeg4b3r
 NSOkDtrwUI1WDKYOmnqjOD4bY4jids6pFihm9IGKWxOTQqL1fNSPpOd9+ w==;
X-CSE-ConnectionGUID: /KoX3pfVTr+7xX7dgZn8SQ==
X-CSE-MsgGUID: BjyQKp2pQvCm4bAaPGLdCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="36760090"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="36760090"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 05:58:55 -0700
X-CSE-ConnectionGUID: sVMY6GlyQJ2PY+PQlEUOnw==
X-CSE-MsgGUID: pwDgKKUvT5qPDSqOuS1fyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="72250189"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Sep 2024 05:58:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 05:58:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 24 Sep 2024 05:58:53 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 24 Sep 2024 05:58:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UsmPdAqHWncUCQXJEMoKa1Pa1hZxbZ77QLNQDrNgrXHEOBGJpv1BT/856EXIE1PKxmeP/fUqH5bQbI54otI64w0g6Y29UrGvDEI0Wxtl2RahprathPTzsmm8XjnQpkBfGe5U4l/acdMdTNoemmyGMiuqdB4wkg+ETdcNdAeEgdbKlzBu1uiQLspNMjA04BVMRViDEeg4cNWnzSrrTjn3DPnBTgBoBSgTIRjffm30hOKtwTkAOOUUw5rrQvf/38+1as0r+T0KdpOnEcHs9lJIJ1sidnR8sJKQ7nE7ZQpck778nvU7mSiIl8zodMwolTypJgyEMZuVWiFE94TWUhvMMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXzQbnObvZ0GTl1yeUD9AeUQJxfUcxVRaYqOim60CAo=;
 b=t6aarXQEPigyeUH3EqBrsptrDIK+S7t7q8rrEMxVIPiU0wC7u0RIQcWRp17Jlx7Kn9U22JeRo6uDQV6CYlWJWHxfc78s+0jhspJI9XzBcyAVYLXmb3swJnvNuA47CjwbVppO1lb+7f9ldsmmSQEeByfTGoRRzKMoYRvT6Yyw7NjhbAP080BQYX2VFGnFkShEDKWu2yhEwYem7kbqljB8KFIaK4R+d+ZMDET2w5LZ5NmymD6klEqIUMGRsQvi6lAJCUpDYMAj3J8Hl34H9PMqQvZxKlRhQTilo+rj0adN9Vz+pRSzYFxctcZWq8g2iR0gYHs1+DGFtPIiXYQWWpLiwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CY8PR11MB7033.namprd11.prod.outlook.com (2603:10b6:930:53::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.26; Tue, 24 Sep
 2024 12:58:51 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%3]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 12:58:51 +0000
Date: Tue, 24 Sep 2024 14:58:43 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2] drm/xe: Use fault injection infrastructure to find
 issues at probe time
Message-ID: <ZvK3g7x-K_wPmaiB@fdugast-desk>
References: <20240920131834.3368299-1-francois.dugast@intel.com>
 <ZvGtzSXTmacUx-HV@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZvGtzSXTmacUx-HV@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: WA1P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::24) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CY8PR11MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ee5a002-5f65-420f-b957-08dcdc98a34f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?25LgtrYUiSESWh395iGvQ2JTXBDF4t827LKgnkxsz07Wi6cg8riePJc2lo?=
 =?iso-8859-1?Q?RFLsZt59Y/mcm/6kv+hIv8WJOm9a0alfAgPG7fQSpm/Y2aZRfI6sfQe/vS?=
 =?iso-8859-1?Q?WFoddIES/+QJVZ+8xFHdZs4WCZbaEcNvncADMyrhzw7G4zltfBoxW3gp+P?=
 =?iso-8859-1?Q?Tns6vKSybzVDoivq/36FZm2oEP0aToKiE9hw+NLtYTPCIHqbOOFlZIyLqW?=
 =?iso-8859-1?Q?Ns8k6Cg9Lrc6ElWU174Uq/h8ziO3aZlhYFH7vbDgfEtMaYLqYNHUkxbN70?=
 =?iso-8859-1?Q?txsXaCuAYyPnoPhxIjJKHCabb1rWsxwLbx8u+yZyDoNdCJmlwC1SX7bZph?=
 =?iso-8859-1?Q?4mHTQ/vek3TnX7DEhpdyrIrWcqsEjGLyx5HGbhu4p6pvgwnHs0eGPFG76X?=
 =?iso-8859-1?Q?dw1Xuia7mq3zBb9L3zR+MievstSV/jJ4xFW/weSSvD48CjhqdT2U6ov6ra?=
 =?iso-8859-1?Q?/A5uOsKXNdAvcick/OBiVDsosLqudg+OyzdKmFuRHmT9CYSFWWN8CX8THC?=
 =?iso-8859-1?Q?pIotks5feUFB8dH4xsiNX+we16/AnDgi5ogh/WoBXepDYl8pFElPBCG0//?=
 =?iso-8859-1?Q?4TLQwn0wala2M50cvcWBeJ67T9mr5MDNFY/BJoU4QjoNe4ILH8zaKvFsr4?=
 =?iso-8859-1?Q?FSXPWNlSsGHEvf7VRfxnPqyhO0x4c6yWUHCtVNd3FriTrhJD3OiAQVa+BW?=
 =?iso-8859-1?Q?gM1bOZnIjnJMnqfw1RoyC+X9hZfHLUFe2L5xRuwbYTcH1U2qbAbVphSS3r?=
 =?iso-8859-1?Q?pIQ9K6Cy6Wb9tMFef6YTkPozp19L+1ng/5KDHaE+Mxa8QmeJtJGGlfQnPz?=
 =?iso-8859-1?Q?3f36RBxyxstt9I2l2L37/R6mA13f3SdoagjnO1Tu3cS1xfS1xgpcWFOMY3?=
 =?iso-8859-1?Q?2ZcFUXCUk6diKcCzsFRu+xatG8jfhdyXASDKyR5nrNj+fAqWYwuadAgB8q?=
 =?iso-8859-1?Q?MoXpOswG3kf9SMdKhsaJZTc4a7LnXdQqZpbNc3gr0hKuZBi8a3aVNh0jAN?=
 =?iso-8859-1?Q?xWpYX1DSVa0SkHwdqUjEeYlBZHJVyufIuxPUEBG1T0N7HaG3dkOQu4a+zk?=
 =?iso-8859-1?Q?idthKthX0VoREJ6z2/rqlmpoJH5YiWrgO013s9SmpAoxaiSx4A4o26Bz6A?=
 =?iso-8859-1?Q?deM5hNKBEqYIDtJbhVZl/ajZqO9pWjpN4jg8XhFbYrF+rRKsqHk3aJEFwm?=
 =?iso-8859-1?Q?JCk4nrkCPjCLCC+W/NwteFxDG5yqAJzeRgPu2PN7kAWR1l7Des3BS2/+pW?=
 =?iso-8859-1?Q?757LHG1Kwx7jW1x4L8jNzm6/yWYlpwD0QD7iyJ1bQoL9R5eJxVs6XNAOpv?=
 =?iso-8859-1?Q?oAKYzChjhljBPSLlGXT0uIY8e3zqcr43dfAKr+9ggRqYMVRw5WpYQPppxN?=
 =?iso-8859-1?Q?JDqgwS7ZE2pz1LBNh1pEbWNip6kVPNkwZC/hNnRneJ0uNt5sQCqfc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mWaMOAdQVbITT2Is5STwnwnIjqZtL+Ioy/fbTPj89lRFxXfnUZmV/nWPy7?=
 =?iso-8859-1?Q?I2B+5WFy6ywmwPkOpUg/kBjYN4jVIo/rHaQFC6K5rG06QCPoMM9v9TOCyj?=
 =?iso-8859-1?Q?o/2iEd95+ae/TCbdEsl5WCNafDzBUeKm/7wrun0c/c7DSDulcMY8fBuc8o?=
 =?iso-8859-1?Q?exramLFNDlDwfX0oSmOJv+lyIE2na0Mhsg8eB04ScMS81g+OANp4arHzjY?=
 =?iso-8859-1?Q?Qr8m0oHgwDcWRVUqLw54hwqErc5s1QEITeUqq0mDIYkFQoE/sLpjioV5OQ?=
 =?iso-8859-1?Q?Cp9b+NJDZC0ifIZ7kRbDhPP0auNAXfC1IgNrxizqDYNnRs/uXNH9XkZX+W?=
 =?iso-8859-1?Q?+Hhl/vSONs8TdxS3DlpISIdHnK5XEZse7+I3FwWrcjsD+6heQwtBaBf2cw?=
 =?iso-8859-1?Q?P8y4d9WwXPyUbDNHWSZ5PwRNzf2ZbQSRca6gErAMP80fHiFBhrXMQYS5ZK?=
 =?iso-8859-1?Q?togiQMtZWRyGncF7PH6/BVxbLU2oTstXS/cO8+eMNiaXEXX2JPGTgiAnbn?=
 =?iso-8859-1?Q?c3s0XlfrJ+CwJzRafAY8acjFhKEhSYdAYW/0cZCJql7KMR/VZ3PZDEUkvL?=
 =?iso-8859-1?Q?jsBym22EhVAcSfbWjVhfX/iyge1TOw+IVqKrjUtLRCBCu2fGDZPg/P8V8/?=
 =?iso-8859-1?Q?n/nTlz4S1n5jWrag6s6OZl5wo73+2f5qAfMl8Ctcih+3zqc0xRGDE6eqXu?=
 =?iso-8859-1?Q?eyEEEFqe6kNCXDdVeg7Q+xNOsMLDYeW1Y6YexkipsfWLx389Cm4rroGTxk?=
 =?iso-8859-1?Q?9n3bMbwEPMrAsZL6iuPuqmMfRY/iuZt4BumyEniSYKFv9IfLT4J+dMs8fh?=
 =?iso-8859-1?Q?nGEJ8lkE/yaCweR+wktcKWn1UJrA55TdP+nCeUAMfOgTrEoRjVantRmiRV?=
 =?iso-8859-1?Q?kU8epQy4BARJo3FRKXlDN+CKkN6CAK5YUx49cDsdgnbziZzzzMVxGjCEGF?=
 =?iso-8859-1?Q?2zysTZYL5r3F6+HkwCfmk0+Xu0at6gUnJuzrlRKayuHh2sPMHQZDauQMVI?=
 =?iso-8859-1?Q?fkXp8ZzHDkCa4eqmnDnQ3Ppx4WDAPEgZJ8DQkVf9ONXHwOnJ/JU68CWlQk?=
 =?iso-8859-1?Q?4R1a6KJEOSs1SApZZ+zEecNQzAUYVhmsj/F+tfGKXnKDcfcJBapfzH/EJJ?=
 =?iso-8859-1?Q?YjdDAjjUkNKw2k7kleBVVakMM200tNmXvV4ModJ/4jOCYYhqSImfMFqATj?=
 =?iso-8859-1?Q?LOBxA9Qe1J44JE+ArwKLVi1z26OiASwHzA/fpHlO+Ml2QEBxeSbzMBxrUl?=
 =?iso-8859-1?Q?YhZXPc2XgqbaFupn2DsGIUP0KJ6wYWHm6at3jSSG9OutpKUOYlLFZhbxGC?=
 =?iso-8859-1?Q?zI/6Sex/WxcGkUe1WCw130IOxFJ90JmFN3qgi67jXG0wlkeWNWAw+U5rCa?=
 =?iso-8859-1?Q?MtSbgC0kPM2UfeGlPBUKRAb2I0qjHwBWGjS+wZevqgYh4tdnDGqgDJYjVP?=
 =?iso-8859-1?Q?ADwQqWoAGCEH5HGMm24zqhwTTfRYMxRR8+Ow7ApHRHHRncPRRQFr0hIs7j?=
 =?iso-8859-1?Q?BSkp5IF/mIc8Q1veB9fdkCAXOWIpeBy7ww3PwGS2ikxwyp1URqQ6QO17FK?=
 =?iso-8859-1?Q?s/jLcUhKPWvHALx69OTw7GzLr9o98kU8y1Whszagf+gdqKhC40Ut3SB/f0?=
 =?iso-8859-1?Q?4FEAIb2Tzh9xpeMwO61U45KQuCQmSDu/7aQf6YVbPlb+rvlmL/aVFyVw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee5a002-5f65-420f-b957-08dcdc98a34f
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 12:58:51.5513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4yJcr0UMLWpkYB7Tc+QeG3eCcj+8t7fkWX7TF3LQjxAXpXOoiQUwO0LewdEZjHbc09wZVoAGSDB/SWIYxa21asrDF1B05+EcQwR6nQrSzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7033
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

On Mon, Sep 23, 2024 at 02:05:01PM -0400, Rodrigo Vivi wrote:
> On Fri, Sep 20, 2024 at 03:18:34PM +0200, Francois Dugast wrote:
> > The kernel fault injection infrastructure is used to test proper error
> > handling during probe. In particular, ALLOW_ERROR_INJECTION() is added
> > directly to functions which fullfill the injectable functions
> > requirements:
> > fault-injection.html#requirements-for-the-error-injectable-functions
> 
> Okay, I read this. This was my biggest initial question here...
> 
> > 
> > Otherwise a helper function is added and called in the beginning of the
> > function where the fault is to be injected.
> > 
> > The return code of the functions using ALLOW_ERROR_INJECTION() can be
> > conditionnally modified at runtime by tuning some debugfs entries. This
> > requires CONFIG_FUNCTION_ERROR_INJECTION (among others).
> > 
> > One way to use fault injection at probe time by making each of those
> > functions fail one at a time is:
> > 
> >     FAILTYPE=fail_function
> >     DEVICE="0000:00:08.0" # depends on the system
> >     ERRNO=-12 # -ENOMEM, can depend on the function
> > 
> >     echo N > /sys/kernel/debug/$FAILTYPE/task-filter
> >     echo 100 > /sys/kernel/debug/$FAILTYPE/probability
> >     echo 0 > /sys/kernel/debug/$FAILTYPE/interval
> >     echo -1 > /sys/kernel/debug/$FAILTYPE/times
> >     echo 0 > /sys/kernel/debug/$FAILTYPE/space
> >     echo 1 > /sys/kernel/debug/$FAILTYPE/verbose
> > 
> >     modprobe xe
> >     echo $DEVICE > /sys/bus/pci/drivers/xe/unbind
> > 
> >     grep -oP "^.* \[xe\]" /sys/kernel/debug/$FAILTYPE/injectable | \
> >     cut -d ' ' -f 1 | while read -r FUNCTION ; do
> >         echo "Injecting fault in $FUNCTION"
> >         echo "" > /sys/kernel/debug/$FAILTYPE/inject
> >         echo $FUNCTION > /sys/kernel/debug/$FAILTYPE/inject
> >         printf %#x $ERRNO > /sys/kernel/debug/$FAILTYPE/$FUNCTION/retval
> >         echo $DEVICE > /sys/bus/pci/drivers/xe/bind
> >     done
> > 
> >     rmmod xe
> > 
> > It will also be integrated into IGT for systematic execution by CI.
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c    | 12 ++++++++++++
> >  drivers/gpu/drm/xe/xe_ggtt.c      |  2 ++
> >  drivers/gpu/drm/xe/xe_guc_ads.c   | 13 +++++++++++++
> >  drivers/gpu/drm/xe/xe_guc_ct.c    | 11 +++++++++++
> >  drivers/gpu/drm/xe/xe_guc_log.c   | 13 +++++++++++++
> >  drivers/gpu/drm/xe/xe_guc_relay.c | 11 +++++++++++
> >  drivers/gpu/drm/xe/xe_pm.c        | 11 +++++++++++
> >  drivers/gpu/drm/xe/xe_sriov.c     | 15 ++++++++++++++-
> >  drivers/gpu/drm/xe/xe_tile.c      | 12 ++++++++++++
> >  drivers/gpu/drm/xe/xe_uc_fw.c     | 11 +++++++++++
> >  drivers/gpu/drm/xe/xe_wa.c        | 12 ++++++++++++
> >  drivers/gpu/drm/xe/xe_wopcm.c     |  3 +++
> >  12 files changed, 125 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index cb5a9fd820cf..d26352ecf75e 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -6,6 +6,7 @@
> >  #include "xe_device.h"
> >  
> >  #include <linux/delay.h>
> > +#include <linux/fault-inject.h>
> >  #include <linux/units.h>
> >  
> >  #include <drm/drm_aperture.h>
> > @@ -300,12 +301,22 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
> >  	ttm_device_fini(&xe->ttm);
> >  }
> >  
> > +static noinline int fault_inject_device_create(void)
> > +{
> > +	return 0;
> > +}
> > +ALLOW_ERROR_INJECTION(fault_inject_device_create, ERRNO);
> > +
> >  struct xe_device *xe_device_create(struct pci_dev *pdev,
> >  				   const struct pci_device_id *ent)
> >  {
> >  	struct xe_device *xe;
> >  	int err;
> >  
> > +	err = fault_inject_device_create();
> 
> But then I don't understand here. To me it looks like this function would
> fulfill the criteria. It is not doing any clean up on the err goto,
> nor changingn any state before the first error return.

I believe the second requirement for error injectable functions [1] is
not fullfilled:

    "The function does not execute any code which can change any state
    before the first error return. [...] For example, [...] set a flag"

Before this code change, the first return statement comes after the call
to xe_display_driver_set_hooks() which sets some flags. After this, the
call to drm_aperture_remove_conflicting_pci_framebuffers() continues to
change the state.

But for the sake of keeping the code simple, maybe in such cases we do
not need to take this requirement so strictly and could go with using
ALLOW_ERROR_INJECTION() directly, without the wrapper, as long as the
caller function does not expect something to be done in the called
function. For example, this can be the case when in the caller function
the return code is propagated without the need for cleanup. It seems
to be the case here.

[1] https://docs.kernel.org/fault-injection/fault-injection.html#requirements-for-the-error-injectable-functions

Francois

> 
> Why can't we go directly?
> 
> Perhaps we should add a comment on each of this new fault_inject
> functions to explain why that was chosen instead of the direct
> macro assignment?
> 
> > +	if (err)
> > +		return ERR_PTR(err);
> > +
> >  	xe_display_driver_set_hooks(&driver);
> >  
> >  	err = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver);
> > @@ -548,6 +559,7 @@ static int wait_for_lmem_ready(struct xe_device *xe)
> >  
> >  	return 0;
> >  }
> > +ALLOW_ERROR_INJECTION(wait_for_lmem_ready, ERRNO);
> >  
> >  static void update_device_info(struct xe_device *xe)
> >  {
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > index f68af56c3f86..4906e3f3150b 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -5,6 +5,7 @@
> >  
> >  #include "xe_ggtt.h"
> >  
> > +#include <linux/fault-inject.h>
> >  #include <linux/io-64-nonatomic-lo-hi.h>
> >  #include <linux/sizes.h>
> >  
> > @@ -264,6 +265,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
> >  
> >  	return 0;
> >  }
> > +ALLOW_ERROR_INJECTION(xe_ggtt_init_early, ERRNO);
> >  
> >  static void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> > index 66d4e5e95abd..e366043eb4b8 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > @@ -5,6 +5,8 @@
> >  
> >  #include "xe_guc_ads.h"
> >  
> > +#include <linux/fault-inject.h>
> > +
> >  #include <drm/drm_managed.h>
> >  
> >  #include <generated/xe_wa_oob.h>
> > @@ -396,12 +398,23 @@ static int calculate_waklv_size(struct xe_guc_ads *ads)
> >  
> >  #define MAX_GOLDEN_LRC_SIZE	(SZ_4K * 64)
> >  
> > +static noinline int fault_inject_guc_ads_init(void)
> > +{
> > +	return 0;
> > +}
> > +ALLOW_ERROR_INJECTION(fault_inject_guc_ads_init, ERRNO);
> > +
> >  int xe_guc_ads_init(struct xe_guc_ads *ads)
> >  {
> >  	struct xe_device *xe = ads_to_xe(ads);
> >  	struct xe_gt *gt = ads_to_gt(ads);
> >  	struct xe_tile *tile = gt_to_tile(gt);
> >  	struct xe_bo *bo;
> > +	int ret;
> > +
> > +	ret = fault_inject_guc_ads_init();
> > +	if (ret)
> > +		return ret;
> >  
> >  	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
> >  	ads->regset_size = calculate_regset_size(gt);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 4b95f75b1546..61967ddd319f 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/bitfield.h>
> >  #include <linux/circ_buf.h>
> >  #include <linux/delay.h>
> > +#include <linux/fault-inject.h>
> >  
> >  #include <kunit/static_stub.h>
> >  
> > @@ -165,6 +166,12 @@ static void primelockdep(struct xe_guc_ct *ct)
> >  	fs_reclaim_release(GFP_KERNEL);
> >  }
> >  
> > +static noinline int fault_inject_guc_ct_init(void)
> > +{
> > +	return 0;
> > +}
> > +ALLOW_ERROR_INJECTION(fault_inject_guc_ct_init, ERRNO);
> > +
> >  int xe_guc_ct_init(struct xe_guc_ct *ct)
> >  {
> >  	struct xe_device *xe = ct_to_xe(ct);
> > @@ -173,6 +180,10 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> >  	struct xe_bo *bo;
> >  	int err;
> >  
> > +	err = fault_inject_guc_ct_init();
> > +	if (err)
> > +		return err;
> > +
> >  	xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
> >  
> >  	ct->g2h_wq = alloc_ordered_workqueue("xe-g2h-wq", 0);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> > index a37ee3419428..a3e54f1bb0c3 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_log.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> > @@ -5,6 +5,8 @@
> >  
> >  #include "xe_guc_log.h"
> >  
> > +#include <linux/fault-inject.h>
> > +
> >  #include <drm/drm_managed.h>
> >  
> >  #include "xe_bo.h"
> > @@ -77,11 +79,22 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
> >  	}
> >  }
> >  
> > +static noinline int fault_inject_guc_log_init(void)
> > +{
> > +	return 0;
> > +}
> > +ALLOW_ERROR_INJECTION(fault_inject_guc_log_init, ERRNO);
> > +
> >  int xe_guc_log_init(struct xe_guc_log *log)
> >  {
> >  	struct xe_device *xe = log_to_xe(log);
> >  	struct xe_tile *tile = gt_to_tile(log_to_gt(log));
> >  	struct xe_bo *bo;
> > +	int err;
> > +
> > +	err = fault_inject_guc_log_init();
> > +	if (err)
> > +		return err;
> >  
> >  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
> >  					  XE_BO_FLAG_SYSTEM |
> > diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
> > index ade6162dc259..ede7fd3e7785 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_relay.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_relay.c
> > @@ -5,6 +5,7 @@
> >  
> >  #include <linux/bitfield.h>
> >  #include <linux/delay.h>
> > +#include <linux/fault-inject.h>
> >  
> >  #include <drm/drm_managed.h>
> >  
> > @@ -320,6 +321,12 @@ static void __fini_relay(struct drm_device *drm, void *arg)
> >  	mempool_exit(&relay->pool);
> >  }
> >  
> > +static noinline int fault_inject_guc_relay_init(void)
> > +{
> > +	return 0;
> > +}
> > +ALLOW_ERROR_INJECTION(fault_inject_guc_relay_init, ERRNO);
> > +
> >  /**
> >   * xe_guc_relay_init - Initialize a &xe_guc_relay
> >   * @relay: the &xe_guc_relay to initialize
> > @@ -335,6 +342,10 @@ int xe_guc_relay_init(struct xe_guc_relay *relay)
> >  	struct xe_device *xe = relay_to_xe(relay);
> >  	int err;
> >  
> > +	err = fault_inject_guc_relay_init();
> > +	if (err)
> > +		return err;
> > +
> >  	relay_assert(relay, !relay_is_ready(relay));
> >  
> >  	if (!IS_SRIOV(xe))
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index 33eb039053e4..87075aed885d 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -5,6 +5,7 @@
> >  
> >  #include "xe_pm.h"
> >  
> > +#include <linux/fault-inject.h>
> >  #include <linux/pm_runtime.h>
> >  
> >  #include <drm/drm_managed.h>
> > @@ -247,10 +248,20 @@ static void xe_pm_runtime_init(struct xe_device *xe)
> >  	pm_runtime_put(dev);
> >  }
> >  
> > +static noinline int fault_inject_pm_init_early(void)
> > +{
> > +	return 0;
> > +}
> > +ALLOW_ERROR_INJECTION(fault_inject_pm_init_early, ERRNO);
> > +
> >  int xe_pm_init_early(struct xe_device *xe)
> >  {
> >  	int err;
> >  
> > +	err = fault_inject_pm_init_early();
> > +	if (err)
> > +		return err;
> > +
> >  	INIT_LIST_HEAD(&xe->mem_access.vram_userfault.list);
> >  
> >  	err = drmm_mutex_init(&xe->drm, &xe->mem_access.vram_userfault.lock);
> > diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> > index 69a066ef20c0..f1dafcfd4eae 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov.c
> > @@ -3,6 +3,8 @@
> >   * Copyright © 2023 Intel Corporation
> >   */
> >  
> > +#include <linux/fault-inject.h>
> > +
> >  #include <drm/drm_managed.h>
> >  
> >  #include "regs/xe_regs.h"
> > @@ -91,6 +93,12 @@ static void fini_sriov(struct drm_device *drm, void *arg)
> >  	xe->sriov.wq = NULL;
> >  }
> >  
> > +static noinline int fault_inject_sriov_init(void)
> > +{
> > +	return 0;
> > +}
> > +ALLOW_ERROR_INJECTION(fault_inject_sriov_init, ERRNO);
> > +
> >  /**
> >   * xe_sriov_init - Initialize SR-IOV specific data.
> >   * @xe: the &xe_device to initialize
> > @@ -102,11 +110,16 @@ static void fini_sriov(struct drm_device *drm, void *arg)
> >   */
> >  int xe_sriov_init(struct xe_device *xe)
> >  {
> > +	int err = fault_inject_sriov_init();
> > +
> > +	if (err)
> > +		return err;
> > +
> >  	if (!IS_SRIOV(xe))
> >  		return 0;
> >  
> >  	if (IS_SRIOV_PF(xe)) {
> > -		int err = xe_sriov_pf_init_early(xe);
> > +		err = xe_sriov_pf_init_early(xe);
> >  
> >  		if (err)
> >  			return err;
> > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> > index dda5268507d8..c82b4278c03e 100644
> > --- a/drivers/gpu/drm/xe/xe_tile.c
> > +++ b/drivers/gpu/drm/xe/xe_tile.c
> > @@ -3,6 +3,8 @@
> >   * Copyright © 2023 Intel Corporation
> >   */
> >  
> > +#include <linux/fault-inject.h>
> > +
> >  #include <drm/drm_managed.h>
> >  
> >  #include "xe_device.h"
> > @@ -99,6 +101,12 @@ static int xe_tile_alloc(struct xe_tile *tile)
> >  	return 0;
> >  }
> >  
> > +static noinline int fault_inject_tile_init_early(void)
> > +{
> > +	return 0;
> > +}
> > +ALLOW_ERROR_INJECTION(fault_inject_tile_init_early, ERRNO);
> > +
> >  /**
> >   * xe_tile_init_early - Initialize the tile and primary GT
> >   * @tile: Tile to initialize
> > @@ -114,6 +122,10 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
> >  {
> >  	int err;
> >  
> > +	err = fault_inject_tile_init_early();
> > +	if (err)
> > +		return err;
> > +
> >  	tile->xe = xe;
> >  	tile->id = id;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> > index eab9456e051f..8fff0fd7c675 100644
> > --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> > +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> > @@ -4,6 +4,7 @@
> >   */
> >  
> >  #include <linux/bitfield.h>
> > +#include <linux/fault-inject.h>
> >  #include <linux/firmware.h>
> >  
> >  #include <drm/drm_managed.h>
> > @@ -776,11 +777,21 @@ static int uc_fw_copy(struct xe_uc_fw *uc_fw, const void *data, size_t size, u32
> >  	return err;
> >  }
> >  
> > +static noinline int fault_inject_uc_fw_init(void)
> > +{
> > +	return 0;
> > +}
> > +ALLOW_ERROR_INJECTION(fault_inject_uc_fw_init, ERRNO);
> > +
> >  int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> >  {
> >  	const struct firmware *fw = NULL;
> >  	int err;
> >  
> > +	err = fault_inject_uc_fw_init();
> > +	if (err)
> > +		return err;
> > +
> >  	err = uc_fw_request(uc_fw, &fw);
> >  	if (err)
> >  		return err;
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > index 22c148b1e996..121443b790bf 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -8,6 +8,7 @@
> >  #include <drm/drm_managed.h>
> >  #include <kunit/visibility.h>
> >  #include <linux/compiler_types.h>
> > +#include <linux/fault-inject.h>
> >  
> >  #include <generated/xe_wa_oob.h>
> >  
> > @@ -818,6 +819,12 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
> >  	xe_rtp_process_to_sr(&ctx, lrc_was, &hwe->reg_lrc);
> >  }
> >  
> > +static noinline int fault_inject_wa_init(void)
> > +{
> > +	return 0;
> > +}
> > +ALLOW_ERROR_INJECTION(fault_inject_wa_init, ERRNO);
> > +
> >  /**
> >   * xe_wa_init - initialize gt with workaround bookkeeping
> >   * @gt: GT instance to initialize
> > @@ -829,6 +836,11 @@ int xe_wa_init(struct xe_gt *gt)
> >  	struct xe_device *xe = gt_to_xe(gt);
> >  	size_t n_oob, n_lrc, n_engine, n_gt, total;
> >  	unsigned long *p;
> > +	int err;
> > +
> > +	err = fault_inject_wa_init();
> > +	if (err)
> > +		return err;
> >  
> >  	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
> >  	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
> > diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> > index 93c82825d896..88a201122a22 100644
> > --- a/drivers/gpu/drm/xe/xe_wopcm.c
> > +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> > @@ -5,6 +5,8 @@
> >  
> >  #include "xe_wopcm.h"
> >  
> > +#include <linux/fault-inject.h>
> > +
> >  #include "regs/xe_guc_regs.h"
> >  #include "xe_device.h"
> >  #include "xe_force_wake.h"
> > @@ -268,3 +270,4 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
> >  
> >  	return ret;
> >  }
> > +ALLOW_ERROR_INJECTION(xe_wopcm_init, ERRNO);
> > -- 
> > 2.43.0
> > 
