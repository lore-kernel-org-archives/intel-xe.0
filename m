Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC761C27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 04:30:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E2610E11C;
	Fri,  7 Jun 2024 04:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HLfxoCJ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236FC10E11C
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 04:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717734634; x=1749270634;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kBxA0BtF0bpmVtl4LxfU7l8wcNMm3yF1q3jK5kWNMj4=;
 b=HLfxoCJ/io43SziHFYlDjDOnHVutGDeHR9Yhku5Ymf495LZ7A7lK7ivJ
 Onn3FySYh/e6ivPh2G2gRBCAZQEld7SOPHWDx3WFog0YWKvrXLcm5GN37
 tRJ+epKsQ2xyWrq9G6rvU1kBDaGp1aQcY6Bant20GWvdXWlvDFBeibhtY
 cw/Hgjp1EpB3ZVBo4iLjY7XpDVvxR9Im0CtQtDhiQiuxCMmqvhXBLi/xB
 I1HYlNHtm8fttqxAvRNTrbEXF2jfVfFq7JkvAffcdiE6vJ93B3bYEl2Mg
 eO0NT3nDCgaf2Be4j7qIgVCBSHIujtayVqq1+dJVB65z8AoCaRDSz+vJN A==;
X-CSE-ConnectionGUID: NhUUsm4hRUOq+LTln+UQUQ==
X-CSE-MsgGUID: 6me7r5TjTJOGtYEEaRSdgQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14244704"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="14244704"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 21:30:33 -0700
X-CSE-ConnectionGUID: JJeqKixjSnGbAuYvF5qQ4A==
X-CSE-MsgGUID: 4ZSIdevXQbekJhkdsFFoiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="69366848"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 21:30:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 21:30:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 21:30:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 21:30:32 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 21:30:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECp0pKdzSzlklpRCSURKb32oK0JEbTntq86GcykJGm8iG+JJYK928OuCRjwF/hgTjpPrZkdOXQwodN9+XdEP/Qhd+L0wpkkL6QIJB94L0CZeBr9Sohth+6GBmJSRvSmTlhSGBQLHk5mPNQlR914Mjnvu1HKI8SxNVlEVfVFmrehM70d1Nyeq+RECX+WJ8aa9ZotbTTqtCNMUeM9GgApz216iipIw2A788RYR8H/uwjqJPnNKVFmjcGOQGWVVhoQeURAVjShgj7LFwitsIFd2QFPTJ3JU+bxglySBMZKDASQwevA47OIIPzP/Oh03cxcWvlxdIvgnECADye03SqRqvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cm38Ec0izLYMnXTULdKhqVy692uXwgMXZfvdJ4Xlga4=;
 b=k0rZnziUqpVaBU7ci86QkH6H+tR/c+9zgsMmgm7fcGB89xKD7Ufy3sGR1DsZAmE1um4tfZV1y8Dq0rY8clrEBp0U9hqNtsmyIuyhWwoXAfQMIampwW/j5KqVbQ4/UvOp886MdgJ0RpNFDx9x2YshB4wJGbMgTBxDB/+vp29vaU8ULxqpzYRDEC6WhWvvh0J4S/8G9fnQzBCNcvhBwsOPa2hqdXOYfvn9dDgXIN0w0jeLIAMAATX2WdInYQhdunqm996vvTWn65l5QAUyvdBDM9moTQpMAd0KfDiCTN3ZoTxce+XoGfFP/OK3e9BxqOCac2WlqDZzoyhZNv40FslbMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by CY5PR11MB6440.namprd11.prod.outlook.com (2603:10b6:930:33::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Fri, 7 Jun
 2024 04:30:29 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5%3]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 04:30:28 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Thomas.Hellstrom@linux.intel.com"
 <Thomas.Hellstrom@linux.intel.com>, "Welty, Brian" <brian.welty@intel.com>
Subject: RE: [v2 27/31] drm/xe/svm: Handle CPU page fault
Thread-Topic: [v2 27/31] drm/xe/svm: Handle CPU page fault
Thread-Index: AQHairlbYWseFE6xEUWVygHR4om6n7FiVI2AgFjOaTA=
Date: Fri, 7 Jun 2024 04:30:28 +0000
Message-ID: <SA1PR11MB69910B0BBF6B1B2F13150D6A92FB2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-28-oak.zeng@intel.com>
 <ZhdF33hVByZy0od2@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZhdF33hVByZy0od2@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|CY5PR11MB6440:EE_
x-ms-office365-filtering-correlation-id: 0a1d1af4-5d80-4e79-e306-08dc86aa8f59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?0OYjnYhUUcCnSL3xfQWCYWGvYuURLadhk88xYGo6lrTJIyUKcJ80REjaHo?=
 =?iso-8859-1?Q?PUvNAv9x5rvH3M5DPG5NflsvbIlbP5GouPc6QnR7cRXUFvvUuY+FmA5cDY?=
 =?iso-8859-1?Q?UbyL5xbgaqu9iX2jABniP0+YeLGqrGSKKKjSuvp0QLzw5H22akcKO5+Mt0?=
 =?iso-8859-1?Q?JNH91R3NNrgC3K5+9KBpAEESfHZAX56agC+upXJHieUWxi7O9lz3zBUvN6?=
 =?iso-8859-1?Q?GWxTW4IVgoBFPMI6GSDS37GZl4teBWK5li8E72cKRGr2j8zPccQJdKVcR4?=
 =?iso-8859-1?Q?O2lLbJ7YpegAckTirkhn2osWiGjY+h7vNIx+72o8E1aFl0M6QZPHave2HC?=
 =?iso-8859-1?Q?QTXGZMztXvmNrtnxC5OuYB1HQUP7ASD894o9axU0NO31Vh94fXN/TS3gdT?=
 =?iso-8859-1?Q?wDpx4idh4jefV/ahuhs+/oayM51kUyMPnXcK/v8nMB8K00W4qubtf9vsI6?=
 =?iso-8859-1?Q?S4iwOzM5SQGrVvYiyZDd3W9me6usily58Ngpteeo1VeOjvINI6YIf13dJm?=
 =?iso-8859-1?Q?4BTdt3BmyUujM7CWpbER2noR3duxOZNIKmYkL55U0w5wUib8NKcRvwLUgz?=
 =?iso-8859-1?Q?wUkjB4CuLS1Q5nQ0yBMvejqJsuPTcvA/oKAGLji1XRYX0IbaBpDUmiEcl5?=
 =?iso-8859-1?Q?re0bVho3HR7takIKBqmCbplGTR6loeFOR7297i+iMTIUbSGzPXfbcOHWEW?=
 =?iso-8859-1?Q?798OA+3qPhVAXYG0QYurtHuJDRi/yM9xrjdx6C1G/f12j2aHcBIUxVKdTq?=
 =?iso-8859-1?Q?/R6nbPnfr/YJZ0xY/cVBnS1r/xf73SwWb3q4b0xBSIDaHeZD6vbUbyBh8p?=
 =?iso-8859-1?Q?+nbpkTntjcPEogKKrmbCA6e0wyebVaLMsvgw2L8776cIC8F+h4okl7KQjc?=
 =?iso-8859-1?Q?SEoK7BOyzkPnhp40Io3zPxdS3TeS7vzMijkNk9ZfsDJ0LAL4E7yN2cf/gx?=
 =?iso-8859-1?Q?Ysh8pBppnvcVu0PE73C6vbMUcLHmxJVsRndID0zVkbG2/YJE4oaqvU+qCj?=
 =?iso-8859-1?Q?oNFO8DCW9qqEj67ljrA9tCxy7Tsj8delg+rkqG0itmCnjbu/b5XDL4TGH7?=
 =?iso-8859-1?Q?HQKkjPvPsyfZoyRc6kOZ+5jqXX/kfNeC4qBiYV4Vl0b07eVR2FtWJLUYim?=
 =?iso-8859-1?Q?79TelEqPYLA48GTiiOlKPQ4ZPX7GV9yoTAtYldO3KUEI9bQA+VJhxWcmKG?=
 =?iso-8859-1?Q?RmVYUoQ8iGx1IR9FsjmgefWZMGASWWLqLKdgR8oP7MHoQW818zOv8dYGDc?=
 =?iso-8859-1?Q?zeIgu6rfc27r8q3KieaFdzqVyVmZqO24AzgC9Y4ao0tcc7BsZoEFPAKyCA?=
 =?iso-8859-1?Q?5iVm2JgHKmNYpf+KPR3iayGasWKszL2DoY33QTLM3O1OtYIBtF3zGDMAbX?=
 =?iso-8859-1?Q?j7tBpAuoF+?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?9WjLRbnPca0J23f6jRnzUYWzFJIehrwsbggZVEs+d1wjz7/C/gueMVWn8n?=
 =?iso-8859-1?Q?agFrjgBp/t2t7cI+JjzxK9uWCgpu2CrxyBHqt9UmNfs/29WnGJns9SvtJr?=
 =?iso-8859-1?Q?PhKK6QkfeEqK5OpJ+PL9xzYmNP8fmc090clCGR9FTcBdBQnqWkXbIErw3p?=
 =?iso-8859-1?Q?FdpynqlTNzz0OIPVGn4xD2ghowVHkxLlpvKFlmxVI8jxN3Xvv5xp4V8dbT?=
 =?iso-8859-1?Q?f7HWVyKFxW4MNrJjGdNJysfZorQTgik/OmH2a/MnjofyRsEncyxICuswiT?=
 =?iso-8859-1?Q?X9+jSevP2aL6omkS0ivBFSEE3nt/lw+8a4aN/MHTAVrqXGIG/AwpOg/Z9W?=
 =?iso-8859-1?Q?xjzfbX+ArFyrBjX4XTdBwfEPoRyDlTsPi4fBGzH2vQQGRYVXo7jqXWEqDK?=
 =?iso-8859-1?Q?JTGYGIC/7DhNFilXoArL/Ps2Zlvl7O1Tw0JsrPBdZd8+PQSNAcYhzvxjuE?=
 =?iso-8859-1?Q?VS5b0nkTIfs3Z251590c8JqbcemjrexTGGXOWaVD8lSVeUgkGbVbsnqFGk?=
 =?iso-8859-1?Q?nkOAbuP5/ODw3mMMq0srKZs7r6vNFIdZh4y5OnS/sSeGczyhFGiXoXt4yx?=
 =?iso-8859-1?Q?/kZjONwk6N3Cjm5c7ARqtL28eHEB5X1FvS/5qDxs96fCTJY2L+aI0B2wFX?=
 =?iso-8859-1?Q?zUKcgBiV7HhkMbSIoSLx7w8tLTHswEAkxoHAGZdtNtm/CCqfLCHRQ0EymM?=
 =?iso-8859-1?Q?a0DSbszEqPgAcRxjKB++LAYMKjwGf4ItM/lZW8JNRu5sUGktwVMdB91n37?=
 =?iso-8859-1?Q?84Pp0mNLdiBqkJrcxm73uu03J8N4s3p6c/+W9VZwGIJqKD2ue4coEQoQEo?=
 =?iso-8859-1?Q?YfKdfJwAl4doU7RuTGY9atkxaVQuhXAgq5fgqJdWyTQ8l+3ycmyObU580j?=
 =?iso-8859-1?Q?YMUd0SP/CQoOpAJmsQ25DfSIrwRtR9nwRxxRNrTX2rixBWJAH9ZaGdYZg9?=
 =?iso-8859-1?Q?7YzuB02o/2hpheYfvO3TIbIAMRhEILpqx2mh4B7TtFL/uXrZ7ELk1l/7UI?=
 =?iso-8859-1?Q?OP5dQ9TK99OuxJmjZ49ewfZhtrmfT2i3kFNbaBx43r8MXxrjwL5IWOQjX8?=
 =?iso-8859-1?Q?k3RaTGVV/OnYICVtqHyS1pTJ2PgJRR6QhTYEGg6OaXXgzhBV9dy/lC5Nl/?=
 =?iso-8859-1?Q?TOZhgPt/F0zX0DOC9IoSLCGB97gQ9pq9YjMh5utjpiTS+Axd+lDWLiHEcH?=
 =?iso-8859-1?Q?DeYRXoVmUHPZn187OSaifLiIKocttj0k0lkAEWRGoAlP8Zw2geawR1g0k7?=
 =?iso-8859-1?Q?ksVLMDIEBUPoV0tR/auUcXHt9c0VVubA2+WR1cLaWiSuL1aV+YDPMyVN8j?=
 =?iso-8859-1?Q?nrS1vIZ313BCwemtX94f/F1Xn7tSRs0gFzqHaN7ppIuJh8niGIOp0FykA1?=
 =?iso-8859-1?Q?onND4ImEzUtM2vYEbYKVxtmB6F8rETZ/YHZsyCvnz3huFix726Og7y3KLG?=
 =?iso-8859-1?Q?jlhgndhsTljZSQV8hGhyiYR4i0+Pm+qOTNXGfqlxbGHSO0h4QrKzEzv75R?=
 =?iso-8859-1?Q?tcOjT9RBT1kc0/rSkGe5D178LURTNee83F7v4R60yA6S7kAgnHmRI3h9Fx?=
 =?iso-8859-1?Q?UbuQFFpY3saASJ3FYreUUY7k3MlbhiQjfbcXaZSzZE/a21yTBj0mBnCMBM?=
 =?iso-8859-1?Q?V0+Hm83/FABOE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a1d1af4-5d80-4e79-e306-08dc86aa8f59
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2024 04:30:28.7155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Ao2G/SHf5ieDaHmXZ6tQG1M48Y0Fq/b0hpwu6TA3R73CkLeWm09ChfNeLetZpoWs18omENxqX9oHhdnTA8cvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6440
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



> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Wednesday, April 10, 2024 10:07 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> <krishnaiah.bommu@intel.com>; Thomas.Hellstrom@linux.intel.com; Welty,
> Brian <brian.welty@intel.com>
> Subject: Re: [v2 27/31] drm/xe/svm: Handle CPU page fault
>=20
> On Tue, Apr 09, 2024 at 04:17:38PM -0400, Oak Zeng wrote:
> > Under the picture of svm, CPU and GPU program share one same
> > virtual address space. The backing store of this virtual address
> > space can be either in system memory or device memory. Since GPU
> > device memory is remaped as DEVICE_PRIVATE, CPU can't access it.
> > Any CPU access to device memory causes a page fault. Implement
> > a page fault handler to migrate memory back to system memory and
> > map it to CPU page table so the CPU program can proceed.
> >
> > Also unbind this page from GPU side, and free the original GPU
> > device page
> >
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > Co-developed-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> > Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Thomas Hellstr=F6m <thomas.hellstrom@intel.com>
> > Cc: Brian Welty <brian.welty@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile         |   1 +
> >  drivers/gpu/drm/xe/xe_svm.h         |   8 +-
> >  drivers/gpu/drm/xe/xe_svm_devmem.c  |   7 +-
> >  drivers/gpu/drm/xe/xe_svm_migrate.c | 222
> ++++++++++++++++++++++++++++
> >  4 files changed, 230 insertions(+), 8 deletions(-)
> >  create mode 100644 drivers/gpu/drm/xe/xe_svm_migrate.c
> >
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index f89d77b6d654..65289acdd563 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -131,6 +131,7 @@ xe-y +=3D xe_bb.o \
> >  	xe_step.o \
> >  	xe_svm.o \
> >  	xe_svm_devmem.o \
> > +	xe_svm_migrate.o \
>=20
> See comments about file org, same thing applies here. Let's put all of
> the svm implementation in a single file.

Did this in v3.

>=20
> >  	xe_sync.o \
> >  	xe_tile.o \
> >  	xe_tile_sysfs.o \
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> b/drivers/gpu/drm/xe/xe_svm.h
> > index f601dffe3fc1..c9e4239c44b4 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -7,11 +7,11 @@
> >  #define __XE_SVM_H
> >
> >  #include <linux/mm_types.h>
> > +#include <linux/mm.h>
> >  #include "xe_device_types.h"
> >  #include "xe_device.h"
> >  #include "xe_assert.h"
> > -
> > -struct xe_vm;
> > +#include "xe_vm_types.h"
> >
> >  /**
> >   * struct xe_svm - data structure to represent a shared
> > @@ -31,6 +31,9 @@ struct xe_svm {
> >  	struct list_head vm_list;
> >  };
> >
> > +#define xe_svm_for_each_vm(svm, vm)
> 	\
> > +		list_for_each_entry(vm, &svm->vm_list, svm_link)
> > +
>=20
> Don't think this is need, see below.
>=20
> >  extern struct xe_svm *xe_create_svm(void);
> >  void xe_destroy_svm(struct xe_svm *svm);
> >  extern struct xe_svm *xe_lookup_svm_by_mm(struct mm_struct *mm);
> > @@ -79,4 +82,5 @@ int xe_devm_alloc_pages(struct xe_tile *tile,
> >
> >  void xe_devm_free_blocks(struct list_head *blocks);
> >  void xe_devm_page_free(struct page *page);
> > +vm_fault_t xe_svm_migrate_to_sram(struct vm_fault *vmf);
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c
> b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > index 088ac209ad80..32ada458f1dd 100644
> > --- a/drivers/gpu/drm/xe/xe_svm_devmem.c
> > +++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > @@ -37,11 +37,6 @@ struct xe_svm_block_meta {
> >  	unsigned long bitmap[];
> >  };
> >
> > -static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
> > -{
> > -	return 0;
> > -}
> > -
> >  static u64 block_offset_to_pfn(struct xe_mem_region *mr, u64 offset)
> >  {
> >  	/** DRM buddy's block offset is 0-based*/
> > @@ -168,7 +163,7 @@ void xe_devm_free_blocks(struct list_head *blocks)
> >
> >  static const struct dev_pagemap_ops xe_devm_pagemap_ops =3D {
> >  	.page_free =3D xe_devm_page_free,
> > -	.migrate_to_ram =3D xe_devm_migrate_to_ram,
> > +	.migrate_to_ram =3D xe_svm_migrate_to_sram,
>=20
> Again single file so this will be static function, no reason to export
> this.

Agreed.

>=20
> >  };
> >
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_svm_migrate.c
> b/drivers/gpu/drm/xe/xe_svm_migrate.c
> > new file mode 100644
> > index 000000000000..0db831af098e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_svm_migrate.c
> > @@ -0,0 +1,222 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright =A9 2023 Intel Corporation
> > + */
> > +
> > +#include <linux/gfp.h>
> > +#include <linux/migrate.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/dma-fence.h>
> > +#include <linux/bitops.h>
> > +#include <linux/bitmap.h>
> > +#include <linux/kernel.h>
> > +#include <linux/slab.h>
> > +#include <drm/drm_buddy.h>
> > +#include "xe_device_types.h"
> > +#include "xe_device.h"
> > +#include "xe_trace.h"
> > +#include "xe_migrate.h"
> > +#include "xe_ttm_vram_mgr_types.h"
> > +#include "xe_assert.h"
> > +#include "xe_pt.h"
> > +#include "xe_svm.h"
> > +#include "xe_vm.h"
> > +
> > +
> > +/**
> > + * alloc_host_page() - allocate one host page for the fault vma
> > + *
> > + * @dev: (GPU) device that will access the allocated page
> > + * @vma: the fault vma that we need allocate page for
> > + * @addr: the fault address. The allocated page is for this address
> > + * @dma_addr: used to output the dma address of the allocated page.
> > + * This dma address will be used for gpu to access this page. GPU
> > + * access host page through a dma mapped address.
> > + * @pfn: used to output the pfn of the allocated page.
> > + *
> > + * This function allocate one host page for the specified vma. It
> > + * also does some prepare work for GPU to access this page, such
> > + * as map this page to iommu (by calling dma_map_page).
> > + *
> > + * When this function returns, the page is locked.
> > + *
> > + * Return struct page pointer when success
> > + * NULL otherwise
> > + */
> > +static struct page *alloc_host_page(struct device *dev,
> > +							 struct
> vm_area_struct *vma,
> > +							 unsigned long addr,
> > +							 dma_addr_t
> *dma_addr,
> > +							 unsigned long *pfn)
>=20
> Weird alignment, also I don't think we are want to allocate a page at
> time...
>=20
> Beyond that, can't say I'm a fan of 2 arguments being return and
> populated here either (dma_addr_t *dma_addr, unsigned long *pfn). I
> haven't seen a lot that style function in Linux.
>=20
> Probably makes more sense to have a function which allocates pages,
> locks them, and populates the pfn array (migrate_pfn) rather than doing
> this a page at a time.


Agreed. In v3, I adopted Nvidia's new dma-mapping API which also requires a=
 2 steps way: 1) allocate pages 2) dma-mapping

>=20
> > +{
> > +	struct page *page;
> > +
> > +	page =3D alloc_page_vma(GFP_HIGHUSER, vma, addr);
> > +	if (unlikely(!page))
> > +		return NULL;
> > +
> > +	/**Lock page per hmm requirement, see hmm.rst*/
> > +	lock_page(page);
> > +	*dma_addr =3D dma_map_page(dev, page, 0, PAGE_SIZE,
> DMA_FROM_DEVICE);
>=20
> The device is writing to these pages so I think DMA_BIDIRECTIONAL is
> needed, right?=20

We are copying from device memory to system memory here. Yes device writes =
to those pages, but the direction parameter is about the copy direction, no=
t about read or write. I think FROM_DEVICE is still correct.


As mentioned above I think this should be broken out into
> a different step too.


Agreed.

>=20
> > +	if (unlikely(dma_mapping_error(dev, *dma_addr))) {
> > +		unlock_page(page);
> > +		__free_page(page);
> > +		return NULL;
> > +	}
> > +
> > +	*pfn =3D migrate_pfn(page_to_pfn(page));
> > +	return page;
> > +}
> > +
> > +static void free_host_page(struct page *page)
> > +{
> > +	unlock_page(page);
> > +	put_page(page);
> > +}
> > +
> > +/**
> > + * migrate_page_vram_to_ram() - migrate one page from vram to ram
> > + *
> > + * @vma: The vma that the page is mapped to
> > + * @addr: The virtual address that the page is mapped to
> > + * @src_pfn: src page's page frame number
> > + * @dst_pfn: used to return dstination page (in system ram)'s pfn
> > + *
> > + * Allocate one page in system ram and copy memory from device
> memory
> > + * to system ram.
> > + *
> > + * Return: 0 if this page is already in sram (no need to migrate)
> > + * 1: successfully migrated this page from vram to sram.
> > + * error code otherwise
> > + */
> > +static int migrate_page_vram_to_ram(struct vm_area_struct *vma,
> unsigned long addr,
> > +						unsigned long src_pfn,
> unsigned long *dst_pfn)
> > +{
>=20
> We definitely don't want to copy 1 page at time. I touch on this in [1].
> Basically this going to perform poorly unless we use larger copies, the
> migrate code supports non-contigous sram addresses, and vram addresses
> will likely be contigous due to the buddy allocator.

Totally agreed we need to use one blitter command to copy many pages.. I wa=
s aware of this when I wrote this v2. And this is addressed in v3.

But also be aware, we might end up migrate multiple pages from system memor=
y to device memory on each gpu page fault. But on CPU page fault, we only w=
ant to migrate 1 page to cover the fault address. I know in this v2, I migr=
ated whole CPU VMA. I realized this is not correct after read more core mm =
and hmm code. The main reason is, the core mm only program one pte entry (c=
overs 4k), even if we migrate multiple pages. See logic in function handle_=
pte_fault and do_swap_page. So I switched to one page scheme on v3. At leas=
t this is my current understanding.

Regarding vram contiguous, I think if we don't pass DRM_BUDDY_CONTIGUOUS_AL=
LOCATION, we still have chance run into non-contiguous vram. Even if the or=
iginal allocation is contiguous, a portion of the contiguous vram can be mi=
grated to system memory (and freed from device side), then migrate back to =
vram. We end up with non-contiguous vram in such case.=20

I am thinking not using identity mapping for vram ppgtt mapping for this ca=
se, just like what we did for system memory ppgtt mapping. This way we don'=
t care whether vram is contiguous or not, one shot blitter command can do t=
he work. Otherwise, we will still have to split the copy task per contiguou=
s/non-contiguous vram. This is marked as FIXME in v3. What do you think?=20


>=20
> [1] https://patchwork.freedesktop.org/patch/588548/?series=3D132229&rev=
=3D1
>=20
> > +	struct xe_mem_region *mr;
> > +	struct xe_tile *tile;
> > +	struct xe_device *xe;
> > +	struct device *dev;
> > +	dma_addr_t dma_addr =3D 0;
> > +	struct dma_fence *fence;
> > +	struct page *host_page;
> > +	struct page *src_page;
> > +	u64 src_dpa;
> > +
> > +	src_page =3D migrate_pfn_to_page(src_pfn);
> > +	if (unlikely(!src_page || !(src_pfn & MIGRATE_PFN_MIGRATE)))
>=20
> I'm going to say this is a bug if !src_page ||
> !is_zone_device_page(src_page) || !(src_pfn & MIGRATE_PFN_MIGRATE)
> and
> we return -EFAULT (or another error code if that makes more sense). We
> are migrating from the device where we know we have backing store from
> the original fault.

Agreed under the context of this v2.

In v3, I am moving to a more page centric scheme. Think of this scenario: a=
 virtual address range, let's say 2M, is migrated gpu device memory. Now CP=
U accessed one page in the middle of this 2M range, this single 4k page wil=
l be migrate back to system memory. HMM also triggers a invalidation callba=
ck to driver to invalidate this 4k range. Now gpu access this 4k range. Let=
's say our GPU migration granularity is 2M (the concept of chunk in your se=
ries) and migration policy says we need to migrate back to device memory, t=
he migrate_vma_setup will be set up to cover a 2M range but hmm will tell u=
s there is only one 4k page in system memory need to be migrated while all =
the rest (2M - 4K) need no migration. In this scenario MIGRATE_PFN_MIGRATE =
is not set for the 2M-4k. of course this scenario doesn't apply to above vr=
am_to_sram migration.

>=20
> > +		return 0;
> > +
> > +	mr =3D xe_page_to_mem_region(src_page);
> > +	tile =3D xe_mem_region_to_tile(mr);
> > +	xe =3D tile_to_xe(tile);
> > +	dev =3D xe->drm.dev;
> > +
> > +	src_dpa =3D xe_mem_region_pfn_to_dpa(mr, src_pfn);
> > +	host_page =3D alloc_host_page(dev, vma, addr, &dma_addr, dst_pfn);
> > +	if (!host_page)
> > +		return -ENOMEM;
> > +
> > +	fence =3D xe_migrate_pa(tile->migrate, src_dpa, true,
> > +						dma_addr, false, PAGE_SIZE);
> > +	if (IS_ERR(fence)) {
> > +		dma_unmap_page(dev, dma_addr, PAGE_SIZE,
> DMA_FROM_DEVICE);
> > +		free_host_page(host_page);
> > +		return PTR_ERR(fence);
> > +	}
> > +
> > +	dma_fence_wait(fence, false);
>=20
> Even if we did want to migrate a page at a time, we only need to wait on
> the last fence due to the ordered nature of exec queues.

Sure. As said we migrate all pages in one shot in v3. Above comment doesn't=
 apply anymore.

>=20
> > +	dma_fence_put(fence);
> > +	dma_unmap_page(dev, dma_addr, PAGE_SIZE,
> DMA_FROM_DEVICE);
>=20
> With above, will likely unmap all dma pages in a single function once
> the last fence is signaled.

Yes, this was handled properly in v3.

>=20
> > +	return 1;
> > +}
> > +
> > +/**
> > + * xe_svm_migrate_to_sram() - Migrate memory back to sram on CPU
> page fault
> > + *
> > + * @vmf: cpu vm fault structure, contains fault information such as vm=
a
> etc.
> > + *
> > + * Note, this is in CPU's vm fault handler, caller holds the mmap read=
 lock.
> > + *
> > + * This function migrate one gpu vma which contains the fault address =
to
> sram.
> > + * We try to maintain a 1:1 mapping b/t the CPU vma and gpu vma (i.e.,
> create one
> > + * gpu vma for one cpu vma initially and try not to split it). So this=
 scheme
> end
> > + * up migrate at the vma granularity. This might not be the best
> performant scheme
> > + *
> > + * This can be tunned with a migration granularity for  performance, f=
or
> example,
> > + * migration 2M for each CPU page fault, or let user specify how much =
to
> migrate.
> > + * This is more complex due to vma splitting.
> > + *
> > + * This function should also update GPU page table, so the fault virtu=
al
> address
> > + * points to the same sram location from GPU side. This is TBD.
> > + *
> > + * Return:
> > + * 0 on success
> > + * VM_FAULT_SIGBUS: failed to migrate page to system memory,
> application
> > + * will be signaled a SIGBUG
> > + */
> > +vm_fault_t xe_svm_migrate_to_sram(struct vm_fault *vmf)
> > +{
> > +	struct xe_mem_region *mr =3D xe_page_to_mem_region(vmf->page);
> > +	struct xe_tile *tile =3D xe_mem_region_to_tile(mr);
> > +	struct xe_device *xe =3D tile_to_xe(tile);
> > +	struct vm_area_struct *vma =3D vmf->vma;
> > +	struct mm_struct *mm =3D vma->vm_mm;
> > +	struct xe_svm *svm =3D xe_lookup_svm_by_mm(mm);
>=20
> I don't think this is needed... More below.

Yes. I removed the xe_svm concept in v3.=20

In my v3, we have a mm_struct pointer in gpuvm. If a gpuvm participate svm,=
 the mm struct pointer will be set. This is from your PoC and I think this =
is the simplest implementation.

Depending on how people view it, we might still invite back the xe_svm or d=
rm_gpusvm (as in your new series) though. It not a huge deal. Let's see how=
 things go.

>=20
> > +	unsigned long addr =3D vma->vm_start;
> > +	u64 npages =3D vma_pages(vma);
> > +	struct xe_vma *xe_vma;
> > +	vm_fault_t ret =3D 0;
> > +	struct xe_vm *vm;
> > +	void *buf;
> > +	int i;
> > +
> > +	struct migrate_vma migrate_vma =3D {
> > +		.vma		=3D vmf->vma,
> > +		.start		=3D vma->vm_start,
> > +		.end		=3D vma->vm_end,
>=20
> So I know in my PoC I had the fault user pointer (xe_vma) =3D=3D struct
> vm_area_struct of the GPU fault. That is definitely wrong.=20

Can you explain why this is definitely wrong? I still think creating xe_vma=
/fault userptr to cover the whole struct vm_area_struct range is not a bad =
idea. Our mmu notififer is xe-vma based, so basically for each vm_area_stru=
ct/xe-vma we have a mmu interval notifier.

The migration and gpu page table update can be any sub-range of the xe-vma,=
 as long as the boundary of the sub-range is page aligned.=20

We likely
> want to allocate sub-range of vm_area_struct for the xe_vma, we can call
> this a chunk size. Logical chunks sizes would be aligned 2MB, 64k, and
> finally 4k in sizes trying the largest first... The chunk sizes are
> trivial as we likely can just have table with values, the key here is
> the vm_area_struct vm_start / vm_end are not what we want to use here
> rather xe_vma_start(vma) and xe_vma_end(vma).=20

This is cpu page fault handler. I think it is just fine to use vma_area_str=
uct.vm_start/end. In my opinion, referring to some gpu structure xe-vma-sta=
rt/end in cpu page fault handler is a little strange.=20

As said, I have moved to one-page based scheme in cpu page fault handling. =
But even if we migrate whole vma, I don't see a problem of above codes. Can=
 you explain why you want to use xe-vma here? My guess is, in your picture,=
 you want one xe-vma be either backed by system memory, or gpu device memor=
y but not a mixture. I am moving away from this scheme and adopting a page =
centric design where xe-vma can be backed by a mixture of sram and vram.


I think we get the
> xe_vma
> from the faulting page vmf->page->zone_device_data field unless you have
> another use that field...

I know this scheme works for you. But it is a design choice of how to use z=
one-device-data. In my v3, this is still used to hold buddy-block. I am not=
 saying we can't do what you did, just we can do it differently.

Struct page is all about physical memory management. Couple it with virtual=
 memory structure such as xe-vma is not a good sign to me.

>=20
> I also comment on my patch with my suggestion implement chunk sizes too.

I did look at your patch and basically you are creating svm-rang at chunk s=
ize...

In my v3, I am staying with the same concept of v2: create xe-vma per cpu v=
ma, but changed the migration/gpu pt mapping to be chunk size based, roughl=
y.


>=20
> > +		.pgmap_owner	=3D xe,
>=20
> Again helper for this.


Addressed in v3
>=20
> > +		.flags		=3D MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
> > +		.fault_page =3D vmf->page,
> > +	};
> > +
> > +	buf =3D kvcalloc(npages, 2* sizeof(*migrate_vma.src), GFP_KERNEL);
> > +	migrate_vma.src =3D buf;
> > +	migrate_vma.dst =3D buf + npages;
> > +	if (migrate_vma_setup(&migrate_vma) < 0) {
> > +		ret =3D VM_FAULT_SIGBUS;
> > +		goto free_buf;
> > +	}
> > +
> > +	if (!migrate_vma.cpages)
>=20
> This is an error, need to set a return value.

Agreed

>=20
> > +		goto free_buf;
> > +
>=20
> We probably should check migrate.cpages !=3D npages too as I also think
> this is an error.

In the scheme of "no mixture placement of vma", yes. As said, I am moving a=
way from this scheme. Let's see how well it moves.

>=20
> > +	for (i =3D 0; i < npages; i++) {
> > +		ret =3D migrate_page_vram_to_ram(vma, addr,
> migrate_vma.src[i],
> > +							migrate_vma.dst + i);
> > +		if (ret < 0) {
> > +			ret =3D VM_FAULT_SIGBUS;
> > +			break;
> > +		}
> > +
> > +		/** Migration has been successful, free source page */
> > +		if (ret =3D=3D 1) {
> > +			struct page *src_page =3D
> migrate_pfn_to_page(migrate_vma.src[i]);
> > +
> > +			xe_devm_page_free(src_page);
> > +		}
> > +
> > +		addr +=3D PAGE_SIZE;
> > +	}
>=20
> I touch on this above, this should be reworked to roughly:
>=20
> - alloc pages and populate migrate_vma.dst
> - dma map sram pages
> - migrate a chunk of contigous vram addresses at a time
> - wait on last dma fence from migrate
> - unmap dma pages
> - unlock and free all pages

In v3, I roughly have above process. But a lot of things have changed, let'=
s review it once it is ready.


>=20
> > +
> > +	xe_svm_for_each_vm(svm, vm) {
> > +		xe_assert(xe, vm->mm =3D=3D mm);
> > +		xe_vma =3D xe_vm_lookup_vma(vm, vmf->address);
> > +		if (xe_vma)
> > +			xe_vm_invalidate_vma(xe_vma);
> > +	}
>=20
> I've touched on why this isn't needed... I think one of these
> migrate_vma_* functions will trigger all MMU notifiers registered for
> the range. The notifier owns the invalidate then.
>=20
> Beyond this, maybe I'm confused about a few things and how this fits all
> together. Doesn't every user process have its own unique mm, fd, and vm
> (e.g. own address space)? If a user want a shared address space then use
> threads with a single mm, fd, and vm.
>=20
> So even if we had to resolve the xe_vma's here and do an invalidate here
> very confused what this is doing. This is this the case with multiple
> devices and each VM points to a different device? Again so that case I
> don't think a xe_svm structure would be needed, on GPU fault we should
> be to detect from the faulting page zone_device_data and pgmap owner
> if the fault already has a physical backing on another GPU and resolve
> how to map it into GPU with a fault... Jason suggests this in the
> following thread [2] and I think I agree with him.
>=20
> [2] https://lore.kernel.org/all/5495090e-dee1-4c8e-91bc-
> 240632fd3e35@amd.com/T/

Thanks, I agree with above analysis. Yes invalidation is already triggered =
during migrate_vma_setup, and above codes are deleted in v3.

>=20
> > +	migrate_vma_pages(&migrate_vma);
>=20
> This logic is going to change but ...
>=20
> On an error I think we only want to call migrate_vma_finalize to revert
> pages back to the original state (i.e. migrate_vma_pages commits the
> page changes which we don't want to do on an error).

Agreed. I found this logic in your series. I will fix it in v3.=20

>=20
> > +	migrate_vma_finalize(&migrate_vma);
> > +free_buf:
> > +	kvfree(buf);
> > +	return 0;
>=20
> I don't think 0 should blindly be return here, if there is an error
> return VM_FAULT_SIGBUS. We likely want a high level error message too.

That is correct. Fixed in v3.

Regards,
Oak
>=20
> Matt
>=20
> > +}
> > --
> > 2.26.3
> >
