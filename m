Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8770FEEC28D
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 21:48:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2225610E316;
	Mon, 23 Feb 2026 21:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G9QDT8oP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE6810E316
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 21:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771883282; x=1803419282;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sf4TCV/s5aTQXp9S9Hr9erB4RoRse0demAeUNSx2kzs=;
 b=G9QDT8oPrBdGJX2zIPrlPRFsuy+RLuxxHJOlZ8XR4Jf+o2C1XpbAy1wK
 rxcNDvR6LXPXVciriXE60wqMtlrB1axQfeBYoDrDvq+qp01I4HQLc5gO/
 mKdby3qXfw5H5S71QWYkO9PPhSzT8IGnOhsp3bov7lLnJUFv4N5CvG+xP
 lHjCg5pWxHuW/w0ilOoGul+Rv7n5bDK9AkXMqBVOalNmpFZYmc3pjlhY+
 pGVH/AftqTU1w6l0P7+FMuRy5PDlpNXXCEYnLqD724G4GlXIbMShfbeo2
 A9/QkFUSGgb5VDRsQWpkYEnRsGH8NngorxzTxRGSd+kWjdZOhGfZ3v8vU w==;
X-CSE-ConnectionGUID: tcPbU4RFTX64Ce8SBMlbRQ==
X-CSE-MsgGUID: Cko4WeR2QBiBRUQVmP8OJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72793166"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72793166"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 13:48:02 -0800
X-CSE-ConnectionGUID: GcmyJOpyTc6CvPSnJ7hTPg==
X-CSE-MsgGUID: PVzPX5kqQYCdrehS0GTpjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="220216071"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 13:48:02 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 13:48:01 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 13:48:01 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.14) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 13:48:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBlZLbto20Rbs5GEhyjbfymp9IQ8mR3I4mTzXf6ppV7TyWzSXHabEHS9S708c88DhrIwTUqN48cpCa8HOmGBQ0Ta1PkzUrJOJAI/grEHZguoNUygzT4V0e/kEzIuN951swzTUZDET/eWRTIgzQXUDz5x5My4zd7MkQLY7mhjZ5Ul5eAFxqF/1OIPNRzR3vWoLTBCesHHX2qUVbEElyv4agxvH9XiNss9rTdLMYp1uV9aqSvUdqzdIUvVBcRuigY43xQkZ7ovEb48fpfMHBIInpHElCw7wbOoGY7W66ndt/19A73DO1F/GGlsUs6Fpu0hdfbP1SXXkQD6SPJwtZZfLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sf4TCV/s5aTQXp9S9Hr9erB4RoRse0demAeUNSx2kzs=;
 b=s8VO4r+/dIKI1jREa24tbF46f36Bjif604UWQH+n5puCZPipZC3YkHPNRhQDcSiCTzWS6emqoWlecxwZKSVrwEvlHWuzcebuoePjnBKYuSxL/IjxmGu5OqZlSi2VzVeUy7qTkd4KyxoerqUSQAqDZ3AeRB6z+vh9C8pP+865/WiH1hVZgntCeTI7MIiE18N30rpsjUTv7HsHItLrIUi37y4IFNUiA67R4tCwBdlkwXlXgDLzsORmYJjLulfZ7hpA6huC1N1a8V5JO0AEZtTRmL0AkwXsPoOJzoUucULNgqIArwueZuhrMrPn6uOjQHtgAz83o7x2gSIOvhzn71CvYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SJ0PR11MB6672.namprd11.prod.outlook.com (2603:10b6:a03:44c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 21:47:58 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 21:47:57 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v2 15/23] drm/xe: Consolidate workaround entries for
 Wa_18041344222
Thread-Topic: [PATCH v2 15/23] drm/xe: Consolidate workaround entries for
 Wa_18041344222
Thread-Index: AQHcoo5idW7YEA+Jvkik463qHVM8qLWQ1O9Q
Date: Mon, 23 Feb 2026 21:47:57 +0000
Message-ID: <DM4PR11MB54563B692648704D815EE401EA77A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
 <20260220-forupstream-wa_cleanup-v2-15-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-15-b12005a05af6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SJ0PR11MB6672:EE_
x-ms-office365-filtering-correlation-id: 3a86809b-c7ef-4c91-b903-08de73253555
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?NU5kVVlMcGRZZGE2VTZXRlVCQ3J4UzVHTjdmVk83bnJTL2pKZ29WRlV1K1hr?=
 =?utf-8?B?aHo0VzVoU2wvbE51WG9KUWE0dTlrSmNUK1ZJc2VqY1VHaGc2UE9HZ1pOWU1q?=
 =?utf-8?B?MW5oOUZLa21DN3g3U2NzWUphbmdVcjlsVDV4S1YvNXo2UEpsRTM4eVVYVGFX?=
 =?utf-8?B?cHhrWnZSUHRnV1gwdFVkMFdMNjZQMXA0NU9KOHZzM0JYT0IrWUF6OWJKOEdR?=
 =?utf-8?B?VytUN0xNL3VnYTRjWGwrMXN5T21lQVJFMlFHNHFpbDdnNFVzeFA3dGdQNnN4?=
 =?utf-8?B?cnJmcElobHlSd2I0bURyQnMwOHhhQ1VxbERhbGRwMjg2ZWdMZnU4UHIrblBV?=
 =?utf-8?B?Q0VEN0dPZHRnK3dOSnhhQmM3V2lqWllrRU1lU0pKaDc5NVl2bGhhamFFYTZY?=
 =?utf-8?B?QjZHeXd5b3BVMUxCUXNTN3VzRXdVSWthejhnbjBqQ2VaWEp3d25xVzVCeTdt?=
 =?utf-8?B?WGIyWWVxSmZubEJjaDRPckR1REhzT1p3Wmw1UkcrUHg0T1ZUSjNsQ1EzSXFo?=
 =?utf-8?B?ak83MXBIRUhiNXlDWHRwMldWSjVuckZLaWZFNlM4WVBDT1JnUTBHRU1xdWxT?=
 =?utf-8?B?MXh4VXNNUkhmazhPckQ4QUFRcitsRnRvSCs5R0doNnNHcjVRRlFCb1VCNFox?=
 =?utf-8?B?SFlDbmR6T1BhWUFlajZYeDVVYnAzbjVUTE5oRzVERXdkb3ZEOW0vVnV3SEhY?=
 =?utf-8?B?aHd1Q2Rhc3FkZUJhOVc2a2pBUVJJUmlmekxBd0JSN1pvOXovNWV1WDEyS29Y?=
 =?utf-8?B?R29VYW1EVzhpRk9aUXpZNTV4UGh3TXRuLzV1eC9IY0pXSmlSTFU0QlRRcFg2?=
 =?utf-8?B?emc0TjBXRmdmL1RxMC9iZFgyN0N5VyszbGpRNFVqM3AwUjNCbmY1ZWxLN0o3?=
 =?utf-8?B?SGtONXNsdTZCMmUwcGpHTTJ4VkIweFlYVWVocUJiSGwyWWkvaU5EMUE2ZkhH?=
 =?utf-8?B?dVQ3Rm1MNDRESkFqZXJmQkNEOWFuMnhNYkVaaStFSVF4dWllQVhPc3E4elY0?=
 =?utf-8?B?cmpKSXoxQVpHamxQakQzYlA3OWk2R2s3aU5lNWhhRzVnazlkY2RTRXJyZCt2?=
 =?utf-8?B?K3V6c0FkWTI2STl1M2xhdEN3QVQva0N1a1pRSTZGUmpJNTdhWnJ6d2dzMjNR?=
 =?utf-8?B?VXVCUy9BRHBaVmM1andmd3ZOOVR2QVF5VmNvemF2QWRUWUcyb1BIZjVIejlE?=
 =?utf-8?B?L0V4Z1BTZlJ2cnJwZXlRTTZuck9qZExxeUw2ZXhJTDNrZHN3ZzE2YlBFTnBZ?=
 =?utf-8?B?cWdqV1dMbUxvYWFndTkzS1o3SVF5QmFjNkZONVUxYmhRY0xaREhGMkRDTGFi?=
 =?utf-8?B?a3dXOTlqQnhhT1lkcmRQbFVZRDROWmVWZVp1TjBucmNhQWRmdmpza3ExcGR2?=
 =?utf-8?B?bm9SL1ZzYzR5Y09rS0djRGZuaWZHcys2Q3VMTk5NTjlWeFpSQnVHTW5zT05Y?=
 =?utf-8?B?ai9DNGlEWXZCd3ozUktyTVozWWNSKzgrUkdldlNHWGtnNWtkTWMyUWMxQkU5?=
 =?utf-8?B?YVYvVHd2OGdJckhVTlozZCtBQ2JDeE9GL0Y0Ui9BVUZ0OG1hYjRuQmpVbE83?=
 =?utf-8?B?ZWh0QWtIT1VDcStyNlJFVjVsV0J2TkRxMDgxVGZnaHBGdWx2MkhLM2VZRGls?=
 =?utf-8?B?NTROTGM2ZlZXUkJWR1Joa1cvT29PZm5uRHNOQVpZT1JPQlRxTFhZTDFmWURT?=
 =?utf-8?B?TDNLZVFYZEppQ0loOElVUHJYQmhOaWdFeExoalhUbVB5aE9BOVRaaFIvRkJ1?=
 =?utf-8?B?SjJ2VXhjelVsY1daUi9EV0Z5a0pXWUpaNGhQc3BOZE1DTTRyc0xucVVsYVYv?=
 =?utf-8?B?aExGajByZGxJbUVuYTA4dWZzRmRwSWl4bW54dnl6WDZKeE44ODlCQThpL1dJ?=
 =?utf-8?B?OFJmVk85QTZEY1pWMlpZaDUwWEZ4QjNIWjJCTmtaQmhzbUlhYU5CRUs5K0k3?=
 =?utf-8?B?QjBlNVA4bUZGclBJQzBJVThBS1pqeHJySE5iZUFLMlUyRzVweEpiMlJSZDdy?=
 =?utf-8?B?ZXdHOC9QcWxGZDNZeVdlbDJJejVlQ2ttZVVGNWdEMnVKdjNZUFNsd1BZdWp3?=
 =?utf-8?B?TWFLRTBXNWQzMG9GdEo5OXRrZjJWcGJWNzk4RzFHU005b3JJck80SEtMS1Iv?=
 =?utf-8?B?NmlMOWdqbTJHTUFST2RlMWEyeEM0RnZpMlNDV043TS9RNzFVVC9GT1A1eUZL?=
 =?utf-8?Q?Yr5YhSzUKZSA7ygopkWmwgU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2NjZXE0T05nNHNjOFlZSlU2KzZvaUdnOGxWSWtIU0FSY244b0FwU0trWU1K?=
 =?utf-8?B?RCtUcDJoMmlJSThRNmZjL2NQUFQwOU5BSDF4TDZyNWlVVERwSVQ5TFQ1TlFx?=
 =?utf-8?B?RGtDNVpWZkpjZHovQlA1UWhVblNVSFRsbjk2QXB4cGhzTWR0WjllOUlVcHhI?=
 =?utf-8?B?cHVTdWN6eEpubTlSd0YvL2plNUJXc0pvUzhuRjhjV01GNUJreFBqdlBRRHVG?=
 =?utf-8?B?LzhmcTFFOWo0NnBIaXdMbkVoQjlWUmJ2bnRhUHFpL2RwNjZ4Z3VhQ1ZCcXBn?=
 =?utf-8?B?UnlJaThMQXoyUVR1S1ZHWExZelB4M2hsTWFBcUREWlpEYUt0Qm9DUGt5d08y?=
 =?utf-8?B?YnpBV1dmTHlYQ2FnRGd1SnE3OW81c1RGekF3cVVKYkY1WmJKK0RWZEZSaTJW?=
 =?utf-8?B?NTBlMDRxRW52cEQ2ZmlsK0tiN1R1WmRHcmVIT1RIWFVVOEV6T1oxTkZ0bGIr?=
 =?utf-8?B?UEJVYVNxRmNIWTJZUUtrby9TeTFiS25ldnlVT3c2Ry83UlgvNS80RVVsY3Nv?=
 =?utf-8?B?RXh6czdRWmFzcVFSaTVsdjV6RkxERWp5d2M0aFMrbFpQYmtuNTFkNC96OUs5?=
 =?utf-8?B?UnN5MEtEVXNjRkV5QUxKYmZ4NzRBMGFvdnlXWTg5UEFuTy9wV0tVMWl0RVM1?=
 =?utf-8?B?OFhQWFlYOTk1WjFDdGExTXl5Ri9TblBuMkIxWUYzdGRFNWJyK083K3kwb1lT?=
 =?utf-8?B?VWM2THoxZjYzZ2R0Q2g4dkZLMG5lYndId2Q0c25FSE9Wd1pqYTJoWTRqSmRC?=
 =?utf-8?B?LzhtNndZa0pVRGo1YlduTmlYc2RkWkpqeWE2V01Fd0UwZVJoNitKTGRyRnVw?=
 =?utf-8?B?ZndyRjNMZkxRK0trcElqQXcrRTRxVjlZSC9MaVRMOWg2MVFGUEY3UEY0U0VW?=
 =?utf-8?B?dkxXWHBreTdUS1pMR0xkVHNUN0d4YlFzaVNGRjBmaU1mcFF5VUxmZWVkekpM?=
 =?utf-8?B?SHN0aFNVcWdCWDJ5b0dBek5RM2M2MjQxVThUWGJXUkQ5UGFlK3gwWko0Nzkv?=
 =?utf-8?B?U1JwLzdNUHZ2VE11a1NYOFFWc2lIdUg0OUNHRUcvSFRpMWQ5dUhlT2FCSUc3?=
 =?utf-8?B?dWJJN0pWRmNRSkxJMTBrcFRqNzB4QVRvWGJJQnV6T0FjM1MyNGN2WGUzR3kw?=
 =?utf-8?B?NTExL2VRcDRuelVuK093UmFudVF5aDFTcDd1cFQrNXg1ZUVXcCtuMTQwZ2xi?=
 =?utf-8?B?RnpySXFHeGRSNnhxV05pbVVncDFTcGxxRGo4RUxQcFA3OUs1eXIxeng0ZVVq?=
 =?utf-8?B?ZG56WjVZZ0dWRGFxcnpZRk1Lb3VJNDZZdnhWWEo1VUpuNTJ0V01qRVF5YW8z?=
 =?utf-8?B?YU9mYmQ0dWlDMFBCZjJIb083eGExblA4S3VwQVB5MThmN294eGMva1JTTVZ2?=
 =?utf-8?B?Y1R3SU1rMk9YNk9nS0VlQTl3S25WNStIREoxWjlFeStNdzBkdTB0L0tpQlpp?=
 =?utf-8?B?WlBlMlJWMmYvRVdLOWFDc2MzZVpaRlNpajF6bkFHNXBZSE4yb1pQRU5peHZP?=
 =?utf-8?B?cS9xMkxNSUJEMGhDRWF0K2Vwa0J3V1dRWE1La3pmZWxyZjlodit2VVd3UHNC?=
 =?utf-8?B?WS9IYlBHQUlEakZGOXdVd2lWNkNLSlZuQ1V6K2d5OHdhWkZkdXBteDl0OHRv?=
 =?utf-8?B?U3pWUVBMM29JUWdtaWFCajJrSWNrR25lV01QazQxRmN1dU5UUVFzRG1PY2xL?=
 =?utf-8?B?WjA5WlFvbGI0ditjUVBjNVc2SEw3SkxTQkFhKzZzYzVZZ0tPZlhUa1RYSldT?=
 =?utf-8?B?VTkyS1ZJazJ0SUVCUTVnajBIWGVWYk9iaFNhL29GN1RDV0dWeDBPY2ppaGFP?=
 =?utf-8?B?VzV0UExqYTlMb04rc3QxdFFSeW43ZnppWjJNblhtMFUyZ0NFNGNxT05XUFhQ?=
 =?utf-8?B?R0xGSnFSWCtGak41alpUem1FVDg3NEVYSXFub0hnS1JoT3ZEUWlMa0dPUzZh?=
 =?utf-8?B?VFF4OGp5bXNwdlF0TzA5U3Q4SjR5Y0krc2d3bFc0WlNHK29Pdm9ia0hsOHNV?=
 =?utf-8?B?V05QcGRiTGYxUTVBUzV3M283MC9weFF6Q2xmVURLNzN3NEtENVZxYm14aHlD?=
 =?utf-8?B?Y0w3Ykl4QVRLVFJ0cGoxV2ZvN2JVd0R3ODQ1KzhBUE5vYnJ2ODl6cDNWa1M2?=
 =?utf-8?B?MitKNm50MThqdkVxYkJwbHlkcXZMdjVnRHR2Q1NrOHRONzhmMVN0Zmd3aTVW?=
 =?utf-8?B?WVppUnF6b29WNmVmRjlXYWtZVHJZU3RwMDNXMVp1NFVUVmk0R0g5aStNOWRN?=
 =?utf-8?B?SjJrVllvNFArK1VCY0JDT2ttTHFUTTJER0VRTzZPQ3ZNYjR6bzd6UUlnMTRE?=
 =?utf-8?B?NUFmRGsxUXhHQ0Z5eVp6Wkh0anRncFM0RUtSbWVsQXNnR2Z2WXVIQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a86809b-c7ef-4c91-b903-08de73253555
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 21:47:57.8820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NXD8imrh0JH8ZlRG9Rxi6HdFba5mfr37L8SQHvT8a4sQtPrHluGSM91Efm5h2LsowLntGSfCfnSOZeaHrbzL5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6672
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

T24gRnJpLCBGZWIgMjAsIDIwMjYgOToyOCBBTSBNYXR0IFJvcGVyIHdyb3RlOg0KPiBXYV8xODA0
MTM0NDIyMiBhcHBsaWVzIHRvIGFsbCBncmFwaGljcyB2ZXJzaW9ucyBmcm9tIDIwLjAxIHRocm91
Z2ggMzAuMDANCj4gKGluY2x1c2l2ZSkuICBDb25zb2xpZGF0ZSB0aGUgUlRQIGVudHJpZXMgaW50
byBhIHNpbmdsZSByYW5nZS1iYXNlZCBlbnRyeS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHQg
Um9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3dhLmMgfCAyNSArKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2EuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93
YS5jIGluZGV4DQo+IDE5MGIzMWE5ZDQ5ZDMzZTdmYjgwMTc0YmU3YmE5Y2JmNzI2YTgyMjQuLjgz
MzE4YTRlYmNiNTFlMDA0NDk3DQo+IGUyY2I5NDYwZTk1NjkxYjVkOWZmIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2EuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfd2EuYw0KPiBAQCAtMzg1LDYgKzM4NSwxMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX3J0
cF9lbnRyeV9zciBlbmdpbmVfd2FzW10gPSB7DQo+ICAJCSAgICAgICBGVU5DKHhlX3J0cF9tYXRj
aF9maXJzdF9yZW5kZXJfb3JfY29tcHV0ZSkpLA0KPiAgCSAgWEVfUlRQX0FDVElPTlMoU0VUKFRE
TF9UU0xfQ0hJQ0tFTiwgUkVTX0NIS19TUFJfRElTKSkNCj4gIAl9LA0KPiArCXsgWEVfUlRQX05B
TUUoIjE4MDQxMzQ0MjIyIiksDQo+ICsJICBYRV9SVFBfUlVMRVMoR1JBUEhJQ1NfVkVSU0lPTl9S
QU5HRSgyMDAxLCAzMDAwKSwNCj4gKwkJICAgICAgIEZVTkMoeGVfcnRwX21hdGNoX2ZpcnN0X3Jl
bmRlcl9vcl9jb21wdXRlKSwNCj4gKwkJICAgICAgIEZVTkMoeGVfcnRwX21hdGNoX25vdF9zcmlv
dl92ZiksDQoNCkkgZG9uJ3Qgc2VlIHRoaXMgZnVuYyBpbiB0aGUgcmVtb3ZlZCBydWxlcy4gSXMg
aXQgaW50ZW5kZWQ/IA0KSWYgeWVzLCBjb3VsZCB5b3UgZXhwbGFpbiBpdCBpbiB0aGUgY29tbWl0
IG1lc3NhZ2U/IA0KVGhhbmtzLg0KDQpTaHVpY2hlbmcNCg0KPiArCQkgICAgICAgRlVOQyh4ZV9y
dHBfbWF0Y2hfZ3RfaGFzX2Rpc2NvbnRpZ3VvdXNfZHNzX2dyb3VwcykpLA0KPiArCSAgWEVfUlRQ
X0FDVElPTlMoU0VUKFRETF9DSElDS0VOLA0KPiBFVVNUQUxMX1BFUkZfU0FNUExJTkdfRElTQUJM
RSkpDQo+ICsJfSwNCj4gDQo+ICAJLyogVEdMICovDQo+IA0KPiBAQCAtNTMxLDEyICs1MzgsNiBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX3J0cF9lbnRyeV9zciBlbmdpbmVfd2FzW10gPSB7DQo+
ICAJICBYRV9SVFBfUlVMRVMoR1JBUEhJQ1NfVkVSU0lPTigyMDA0KSwNCj4gRlVOQyh4ZV9ydHBf
bWF0Y2hfZmlyc3RfcmVuZGVyX29yX2NvbXB1dGUpKSwNCj4gIAkgIFhFX1JUUF9BQ1RJT05TKFNF
VChURExfVFNMX0NISUNLRU4sIFNMTV9XTVRQX1JFU1RPUkUpKQ0KPiAgCX0sDQo+IC0JeyBYRV9S
VFBfTkFNRSgiMTgwNDEzNDQyMjIiKSwNCj4gLQkgIFhFX1JUUF9SVUxFUyhHUkFQSElDU19WRVJT
SU9OKDIwMDQpLA0KPiAtCQkgICAgICAgRlVOQyh4ZV9ydHBfbWF0Y2hfZmlyc3RfcmVuZGVyX29y
X2NvbXB1dGUpLA0KPiAtCQkgICAgICAgRlVOQyh4ZV9ydHBfbWF0Y2hfZ3RfaGFzX2Rpc2NvbnRp
Z3VvdXNfZHNzX2dyb3VwcykpLA0KPiAtCSAgWEVfUlRQX0FDVElPTlMoU0VUKFRETF9DSElDS0VO
LA0KPiBFVVNUQUxMX1BFUkZfU0FNUExJTkdfRElTQUJMRSkpDQo+IC0JfSwNCj4gDQo+ICAJLyog
WGUyX0hQRyAqLw0KPiANCj4gQEAgLTU1NSwxMiArNTU2LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCB4ZV9ydHBfZW50cnlfc3IgZW5naW5lX3dhc1tdID0gew0KPiAgCQkgICAgICAgRlVOQyh4ZV9y
dHBfbWF0Y2hfZmlyc3RfcmVuZGVyX29yX2NvbXB1dGUpKSwNCj4gIAkgIFhFX1JUUF9BQ1RJT05T
KFNFVChURExfVFNMX0NISUNLRU4sIFNUS19JRF9SRVNUUklDVCkpDQo+ICAJfSwNCj4gLQl7IFhF
X1JUUF9OQU1FKCIxODA0MTM0NDIyMiIpLA0KPiAtCSAgWEVfUlRQX1JVTEVTKEdSQVBISUNTX1ZF
UlNJT05fUkFOR0UoMjAwMSwgMjAwMiksDQo+IC0JCSAgICAgICBGVU5DKHhlX3J0cF9tYXRjaF9m
aXJzdF9yZW5kZXJfb3JfY29tcHV0ZSksDQo+IC0JCSAgICAgICBGVU5DKHhlX3J0cF9tYXRjaF9n
dF9oYXNfZGlzY29udGlndW91c19kc3NfZ3JvdXBzKSksDQo+IC0JICBYRV9SVFBfQUNUSU9OUyhT
RVQoVERMX0NISUNLRU4sDQo+IEVVU1RBTExfUEVSRl9TQU1QTElOR19ESVNBQkxFKSkNCj4gLQl9
LA0KPiANCj4gIAkvKiBYZTNfTFBHICovDQo+IA0KPiBAQCAtNTg4LDEyICs1ODMsNiBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IHhlX3J0cF9lbnRyeV9zciBlbmdpbmVfd2FzW10gPSB7DQo+ICAJICBY
RV9SVFBfQUNUSU9OUyhTRVQoUklOR19QU01JX0NUTCgwKSwNCj4gUkNfU0VNQV9JRExFX01TR19E
SVNBQkxFLA0KPiAgCQkJICAgICBYRV9SVFBfQUNUSU9OX0ZMQUcoRU5HSU5FX0JBU0UpKSkNCj4g
IAl9LA0KPiAtCXsgWEVfUlRQX05BTUUoIjE4MDQxMzQ0MjIyIiksDQo+IC0JICBYRV9SVFBfUlVM
RVMoR1JBUEhJQ1NfVkVSU0lPTigzMDAwKSwNCj4gLQkJICAgICAgIEZVTkMoeGVfcnRwX21hdGNo
X2ZpcnN0X3JlbmRlcl9vcl9jb21wdXRlKSwNCj4gLQkJICAgICAgIEZVTkMoeGVfcnRwX21hdGNo
X2d0X2hhc19kaXNjb250aWd1b3VzX2Rzc19ncm91cHMpKSwNCj4gLQkgIFhFX1JUUF9BQ1RJT05T
KFNFVChURExfQ0hJQ0tFTiwNCj4gRVVTVEFMTF9QRVJGX1NBTVBMSU5HX0RJU0FCTEUpKQ0KPiAt
CX0sDQo+IA0KPiAgCS8qIFhlM3BfTFBHKi8NCj4gDQo+IA0KPiAtLQ0KPiAyLjUzLjANCg0K
