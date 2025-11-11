Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5B3CCF9E3
	for <intel-xe@archiver.kernel.org>; Tue, 11 Nov 2025 00:03:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21CF10E101;
	Tue, 11 Nov 2025 00:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CG0ryBrx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C3A10E101
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Nov 2025 00:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762819395; x=1794355395;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qVnwja+9RoOQZ8nHe2ZEEvJ7v46/W8p/vY1VK5cI7z4=;
 b=CG0ryBrxHhVvtKDfxGrL3ZVDBpuZ4tSML3vGVFyrHcNRxfENPlLPVdJT
 15zGXjaYGwoZx+dFkvhE9DBo6ekRECDKc4VON7DUeOktLudzmeridxpcY
 9vVl48GOk0KnhsJDj+PETpNuQ2cMYqOgbs3fdRs39viouG+p0126AcMuQ
 QFKGKK2V29bEjn0EIy54wTwvOG1a7MNJW2CvEOeQKPFU9dUvwr9k0ktPY
 Iyw9eIoXDhIij1768wKPQgSSKiS6QjJQPdnuu3G5eS4fw3CA7J99nWJi7
 qtphFAo67zFyCv1UMaOnRLcYcBoHCdFBZqiTY9YKm/KwmTaKhAtVjgkyT A==;
X-CSE-ConnectionGUID: Eo6pN1pUQPOHxjXvkKJCnw==
X-CSE-MsgGUID: 4YwAJsbBQZSCY4+0RR9Zkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64911391"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="64911391"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 16:03:15 -0800
X-CSE-ConnectionGUID: n4Ri9vi6TGyWuKQ7NZta2g==
X-CSE-MsgGUID: jjDU/QF/Qi6cDZhEEjWtBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="193812554"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 16:03:14 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 16:03:13 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 16:03:13 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 16:03:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a7Vlr0vh8nFImimbgyWoiODqmeIlBZWBkGoLBH7zkTbdJyUwMb4hZht5bSzwTcmE3/VRT89zCpQAHW7FqPXGvW9gZb6mknX6QHrsJOGMToEJFCPBQLM7F0xrCsWv0ISNl/IPoY6IF5bYg2VsPbu68J+Rtr4n2qlcbNZg4Hx6iI+J8PBfBOjN6CSogDlQP58kjHr3yap1NUri4TPCma4Tzgd4efNa8lPYYtDuPn/+eiYA0bU/uHX2+OMHYAPoeX4LlEM8ABxcL6Z/RT4hDb9KYD4XanxRDDvBOiqmVVi+E6j27O3VRyLiZGpE4xRDPW/Y6O92jVqMj46Rj75lII1WdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVnwja+9RoOQZ8nHe2ZEEvJ7v46/W8p/vY1VK5cI7z4=;
 b=uWP/3SS9ppjBRGADR1I32akv+jDHDoXa1CrHPZ4KIuAy8xz+UbjUvDdeaV+9aVRbilAw1PVND985qOpccr+A3iW5MBKhq17qHI+6rSKD/i1pxHTDwV4PXpiO8xdD4/mv3bWDeJedPd1a//RfWeKIeRXigL8XpYrXzP/DENwyWno+zjPYl9Uig4sfvPCKhpx6u8POC51bbxIWZrUlbYy2gHoV1GpDWhgE0u5zy7jq5ZgmAYH4Ygxcp1qTwKDMTB3jj3ld6WJRQ5cJRymbOiOqFZfWXUT7pQwyt3CU+hOKNLfLRPn5cqY4sXlHYYZSvWtYThoxjRubWtCIEmMz+R83IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DS0PR11MB7632.namprd11.prod.outlook.com (2603:10b6:8:14f::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Tue, 11 Nov 2025 00:03:06 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 00:03:06 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Mun, Gwan-gyeong"
 <gwan-gyeong.mun@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Dugast, Francois" <francois.dugast@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/xe3p: Add support for prefetch page fault
Thread-Topic: [PATCH 2/2] drm/xe/xe3p: Add support for prefetch page fault
Thread-Index: AQHcUBLIzMlkLamUQEOg3Uolupk/ZbTsnPQA
Date: Tue, 11 Nov 2025 00:03:06 +0000
Message-ID: <861893597dd937ec21b2557622ae451440aa9722.camel@intel.com>
References: <20251107-pagefault-prefetch-v1-0-93291d619126@intel.com>
 <20251107-pagefault-prefetch-v1-2-93291d619126@intel.com>
In-Reply-To: <20251107-pagefault-prefetch-v1-2-93291d619126@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DS0PR11MB7632:EE_
x-ms-office365-filtering-correlation-id: 3d34f70e-68c0-4c61-21ae-08de20b5b10d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ajRwdUVyZWJxbWQ2SjJxd1A0cUVyWEVRRkRKLzl4aU8vbVhjZmxHQ2dxb1dk?=
 =?utf-8?B?cFlHMDg0ZW5namQzSlZNV1JFL2dMajhQZzBUUE5CYnBlVmZHQVhFUTVRcTg3?=
 =?utf-8?B?QW1DVE1nWXZwRUg4aUttR0R6TTNkWWNGNjVvdmJ1eDBaK01lRDArSGN3MGFC?=
 =?utf-8?B?RU9OaTZtMHdhSGdFdmhUZFpXTDBYY0d4amVZVVdyUmM0ZmhUc2ljZ0tUcGRv?=
 =?utf-8?B?ZzFRb3pZSy9CTGpKbUpoMjhHbFVweGpCUHZPd0g4TGZtdU9kNUMrMitxRnVO?=
 =?utf-8?B?UUZJTy9XdVJlRE11SG9qbWp6UmRiM3MrckpvM1hxc0hsdGVHeG91UWl2TCth?=
 =?utf-8?B?ZjRSQ3NmeE14dnBGUCtGWmJ2ZkZJdEZFMjVJendFaE9LUzREZmFmb05Tempz?=
 =?utf-8?B?dkxlTXlIR0FzN2phSjlJZ3dMU0tHOTJnOUh6MlQ1UkwycXh1dW85c2R2MkNG?=
 =?utf-8?B?Q2lSbDJNWWI1NjE0NTF2d0NRZ3JuS2tDZk5uc2dzck9EZ1ZyTGN1c2lWQU1N?=
 =?utf-8?B?Wm1oKzNhQjBPT0hXQU1kK3lOMyswcDhIbU1TLzJTeTNxMklUdVlQV3VVYkZI?=
 =?utf-8?B?dkVxK1dsZVZLRnlPcmtpdzJvRWtsSTRnV0lVV1Q0MTE2Ui8wL0FMdkxHTkVp?=
 =?utf-8?B?Q1dCL0x3VnYwWkdSTEh2bVN0bUV3YmwxMU5TQjRzRUJiSFBBVGltMUlFbmhK?=
 =?utf-8?B?WldlbGNjVkRRNzU3VHBNZm45NkJad1ZjWHNTSG5iazBHd2g5eEtFY0hrM2M0?=
 =?utf-8?B?aDVjb2p2YW4vZndoK1lJT1JaWTB3dUJmN0IrYjJHRGxXVzhWb3pUZ1AwVTBj?=
 =?utf-8?B?Y3ZCWDk2c2g4WFVYRUI4Y1VBbFNDd09KS1paWE1HOHVxdVphVnRxRzYrdUNx?=
 =?utf-8?B?bmFLVzBqbjhxemhseEJnRDljU1p2bU9ORTk4VzZBa1k0WitTcG9RQjVLWEg5?=
 =?utf-8?B?RDN3dWZ0eTNLblNXeFF1emVZTkdiK1FvbVgwYnZDNkJpMkJlOGJkblNJaGFI?=
 =?utf-8?B?VWl4Rlk5Rks1UFRIK2hiMVZWS1Bkd3owQmJtNTRJSTNRSWJ4MU8zaVJYZy9v?=
 =?utf-8?B?UzJydld5Zy9kekRrVkw5bHpNMThkMnZaSVNoMDluM1V5RUREYkpYdGhIRWt4?=
 =?utf-8?B?Zmp2QXJlWUdLV2Z3cWdtMTJ2OHNwN202ZE9oSEtpUWVrb3hjbE5wS3MrRDhn?=
 =?utf-8?B?RmUyOVRidXlSQmsvS25YVkU2QjlaM1RMM1BhUGJzeGpkRTViK09STVh4N3k0?=
 =?utf-8?B?QVlNSFhEMTFrdHA2TnNGTVQ1Yy9vMGxhb20yZFR2T3VtUjRQOUU3MXQ3R21R?=
 =?utf-8?B?aEtTTVJMTkV5QWs5bzFHZzdLUEkzb1Z2MlJzQWozWWlITk1pVjZWb1FLdFA0?=
 =?utf-8?B?VFVIaG1FZFdCcU55ZnZ3cFlSYm9QaHd1cG1McTJmV1VGMG90RHdYQS82dmdV?=
 =?utf-8?B?VlZUQjJVYzRnVTg4RXdFUGM3TEZueEk1ekZrL1BoeW44V08wb0hCTllHbGYw?=
 =?utf-8?B?UCtCV0V1KzgxY1hpSWVHZzcwaW0zVCtKNDA3dHdaMnBRMTAvWEJrS2JPSDZV?=
 =?utf-8?B?WDBCL3lwMWFOeDFwdkdBdUZ0V3kxZGdzRjcvZ3pxMjU2UFh5NGdUbW9lNi9K?=
 =?utf-8?B?N1VWU2xuUWFCS1FPMEhzTVFnWnUyV0dZMkhKYUZEYkVUUkQwclNzckptWjVi?=
 =?utf-8?B?R1d3eEVld2VhZlMyQU0xeDZycVNJRzF0a1RtSTB1ZCs3TVlXK3cwaDJxYzFF?=
 =?utf-8?B?YnZWdWhUNU1uMktKL0ZWUFBVSDVja2pwUSs5alJ6eU5LQXBjWTN1QWcweHBl?=
 =?utf-8?B?QlUvR2JVRUdJRll1WitoZVYvNC9ubkgzcHJ5a3ZhVUpxcWI1a2JzUlN1RWdB?=
 =?utf-8?B?Zis5b3hpb2RtWVcyK3QvQ2dHYjVpSUFCaUpRSFZoM3krOVA2Nys1OFVYS2la?=
 =?utf-8?B?TE82dWRFLzVNNG5IY3FGRmdnY3J2U1EyQ0kxbFJxVkVwZmx2Z0tCdS9Va1A1?=
 =?utf-8?B?VmVWZ2RCT2ZZYTRyTGZqbnhWTTF6dnhwMEZXaHp6VUZLK3R4WWMyckE5YW5n?=
 =?utf-8?Q?I59Lgx?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDdwaFhNTVZxaUJxRXVsMEJnUDNPU2pvV0p3QnYyLzRjRUQvYVdacThWMGZk?=
 =?utf-8?B?OGpzZm8veGIyTjRud1RCS1RLNjM1SlZXSUNTMnlzSVI2TmJiUUFqQnVDTTZW?=
 =?utf-8?B?OFR5b2ZZYTFwLzdRZm8xbmU2WjNBS3R5UGdaWS9jbTl0bnRpZGwyK0xQMlYy?=
 =?utf-8?B?MXliazk2d292aDJhSld2a05lWjE1bXRJNThyemxDRTFvWkZOZGY1UHNIMFRW?=
 =?utf-8?B?RUVCV3dFOUgwa1pHQk1lL1djd2NaYThUMCtCangxYWwweWcvQUNGRHd6VDhD?=
 =?utf-8?B?bEdBeWNNYnJsekxxZ001N21uVTlKSURGOE1sMTVXS0R5Sy9SVlNBcnNLUlh1?=
 =?utf-8?B?a1BUYjMwMG5pSFRjNjlrYjNFNDE2TExjMi9DRWpyQkJ3cTB5em9lVk10VTJh?=
 =?utf-8?B?UUtvdDc1dTl2MVRuL0RtU1VDMm9DYllhWFAyeUQ4RVhnRmFGcks2SGtaM2xa?=
 =?utf-8?B?QUVNZXpVaUw2ODM0Wnhudm5hNWMwamZrRUQyaFFWaHVXOWdiVDlyUTNkcjR0?=
 =?utf-8?B?UTQyeWliNUtDZCtuWTJKVkJza0lwU0JvYVhqbCtiMHNSeHBjVmkza3BXUVhJ?=
 =?utf-8?B?eGJXeU5KZWdDWjVYOFFKbXVua0cwdVZrVmxFZEE4cytwVEQ4MTNrUlJ2RTd5?=
 =?utf-8?B?OXY4bGtFbitoVUhaVk45NlB2VmtyYmFXakJrQW9UMzM1Ty94NWZ5ZXRnWWds?=
 =?utf-8?B?cVYrSkdPN094bVRpcmxWUmc2dytSV2FWNDB2SjhVWlpEZ3JWci9kQjd6MXZR?=
 =?utf-8?B?V1JLQ283VStoMElpZ3lETDRMUnh6K0trWUZWcG1KTS91UjY5dnBsalYwYkxu?=
 =?utf-8?B?bnB0RjN4VDFXVnU1ZEpqZGRBZXQzdWJUN2s5YUpKVUliaHBKck1taXF5K3dj?=
 =?utf-8?B?RVRsK3RTcytZNXd5U1drTXVKUjg1bDJwVUw3WU9nUUdnWE95WnQ2VCtheXZr?=
 =?utf-8?B?N3kwc3FEU0taQ1R5TlhmYXUrT0NVZlY3aHhHaDVXU0l3WmtvUDNNVVhxa3Zs?=
 =?utf-8?B?R0lxUldCOWlGNUNyUUtYbzZ3SmIxTk5FeGNtMkdkZ3VnSFp2SUVvcmZQYW44?=
 =?utf-8?B?WHU5clZqOGhWWURHdUxZaW8veXJYMk1acGI5NERUK2ZYSFJkNEpGYlhPWEhr?=
 =?utf-8?B?N245SHFQaDRVWHNQbGg2aW0wU2p4T29EemRmRlNEYnp1R2dGQnl0c2I4am5O?=
 =?utf-8?B?SzVUTlByK3RmdDFIanNrTnJ2WXZyRUhJekRyWkNNcjFQY3IrQ21JYXZ2aXZP?=
 =?utf-8?B?NUhicW5RcDRKZTVKb1BMTUpGSjNuak9zTGpIVDJQd0VISFk1T1ZadEgwUVRy?=
 =?utf-8?B?WXFVeFBJUnVYdWlCSC9iMEpyR1lFcDRaeVRqL01Vd2hOMEpRS2xsNllxTnhY?=
 =?utf-8?B?NkcwT1oxeFdxU0N0OXBTV2pMa0Y1US94NTA3Vm1ocW9udzR4bURIdGVYOG5U?=
 =?utf-8?B?eUJPN3FsUUt3ekdTNzM4OEk5bzRUbmthUHBEMWhWdWwzY094WXR3Lzc0K25M?=
 =?utf-8?B?Ukg2ejhtbmNZcEFPWDJuaDhISVhqNXdpbFpnZktnaDkvMEQ3R2d2SklJNEJi?=
 =?utf-8?B?ZmgzVzBBb2c1dmdPRUpuWS9jcHdqdWwyRUE0TGRpVTErdHhHQnAwbU1EYTh0?=
 =?utf-8?B?WW8ydmJ5VlNVV3hSb3M3bTF5bjFKR01WUDFMYVM1U0ZKL2t4OU50Z3lvZDNa?=
 =?utf-8?B?YUh1Y0FTZWhBSktldmE1L3dudVdDTGd0OVJzcUk0M2QvZmFmNUtOKzJwLzh2?=
 =?utf-8?B?MEM0bWQ4L2s0Zk4rZWpSRm91ajhJVnBOWkgxY2JoZC9OellXRXdsamFIOG1E?=
 =?utf-8?B?MVJoV1E3RDU5NWlQUXdEWkdCODg1RUdaZHByTHdONzFCNE5LN2NRWTJDMzl6?=
 =?utf-8?B?eTBHWFdpS1VXYjNHREtJQ054OVhZRkUrZTVYVm1qS2pEdUhKWTdMby9EbEJ2?=
 =?utf-8?B?WENyNjEvK0YwaDNtUTI2RXBURndHbnp4eWlEY0hGNVR2dmkwNVVXM3pRdCt3?=
 =?utf-8?B?NlFIU3lXOXhML2o3RUg4ZWVnWkc3MDhlL1JZekVxa0d3bWhoZldxMHl2MS93?=
 =?utf-8?B?VHVnZ09OUUZvbHVjT1lUbUMrZHY4T0FiWEJqb29wZmVsclhmVXV2TG85VkFE?=
 =?utf-8?B?OVhYbnB5MDRwT1RETVdOUndtZjJERWNlSDgzUEV4dnJzRURJazQveVBMVGRr?=
 =?utf-8?B?UEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E45C032A084D849A71F360BB3F52DAB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d34f70e-68c0-4c61-21ae-08de20b5b10d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 00:03:06.4268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9mJ348Bn2elyfUQLmsp4IVNKz4C044dKTJhUDAyKhUbS46vsc8Hrd3MGCN2v+7KUsxGUrzeff7ahpLZGq/Jptb4AyuQ/F2dglsu8RMzY6GQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7632
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

T24gRnJpLCAyMDI1LTExLTA3IGF0IDEwOjEwIC0wODAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
Cj4gWGUzcCBwcmVmZXRjaGVzIG1lbW9yeSByYW5nZXMgYW5kIGl0IG5vdGlmaWVzIHNvZnR3YXJl
IHZpYSBhbgo+IGFkZGl0aW9uYWwKPiBiaXQgaW4gdGhlIHBhZ2UgZmF1bHQgZGVzY3JpcHRvciB0
aGF0IHRoZSBmYXVsdCB3YXMgY2F1c2VkIGJ5Cj4gcHJlZmV0Y2guCj4gVGhlIHByZWZldGNoIGJp
dCBzaG91bGQgb25seSBiZSBpbiB0aGUgcmVwbHkgaWYgdGhlIHBhZ2UgZmF1bHQKPiBoYW5kbGlu
Zwo+IHdhcyBub3Qgc3VjY2Vzc2Z1bCwgd2hpY2ggYWxsb3dzIHRoZSBIVyB0byBhdm9pZCBnZW5l
cmF0aW5nIGEgQ0FUCj4gZXJyb3IKPiBmb3IgcHJlZmV0Y2ggZmF1bHRzLgo+IAo+IEJhc2VkIG9u
IG9yaWdpbmFsIHBhdGNoZXMgYnkgQnJpYW4gV2VsdHkgPGJyaWFuLndlbHR5QGludGVsLmNvbT4g
YW5kCj4gUHJpeWFua2EgRGFuZGFtdWRpIDxwcml5YW5rYS5kYW5kYW11ZGlAaW50ZWwuY29tPi4K
PiAKPiBCc3BlYzogNTkzMTEKPiBDYzogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRl
bC5jb20+Cj4gQ2M6IFByaXlhbmthIERhbmRhbXVkaSA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVs
LmNvbT4KPiBDYzogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4KClRo
ZSBiaXRzIGxvb2sgcmlnaHQuIE90aGVyd2lzZSBJIGFncmVlIHdpdGggYWxsIHRoZSBjb21tZW50
cyBmcm9tIE1hdHQuCgotU3R1YXJ0Cgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0
X3N0YXRzLmPCoMKgwqDCoMKgwqDCoCB8wqAgMSArCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3Rfc3RhdHNfdHlwZXMuaMKgIHzCoCAxICsKPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNf
ZndpZi5owqDCoMKgwqDCoMKgwqAgfMKgIDUgKysrLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndWNfcGFnZWZhdWx0LmPCoMKgIHzCoCAyICsrCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVf
cGFnZWZhdWx0LmPCoMKgwqDCoMKgwqAgfCAxMyArKysrKysrKysrKy0tCj4gwqBkcml2ZXJzL2dw
dS9kcm0veGUveGVfcGFnZWZhdWx0X3R5cGVzLmggfMKgIDcgKysrKysrLQo+IMKgNiBmaWxlcyBj
aGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rfc3RhdHMuYwo+IGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d0X3N0YXRzLmMKPiBpbmRleCA1Zjc0NzA2YmFiODE0Li5hZjdiODU5ODYxNzMwIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9zdGF0cy5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d0X3N0YXRzLmMKPiBAQCAtMzUsNiArMzUsNyBAQCBzdGF0aWMgY29u
c3QgY2hhciAqY29uc3QKPiBzdGF0X2Rlc2NyaXB0aW9uW19fWEVfR1RfU1RBVFNfTlVNX0lEU10g
PSB7Cj4gwqDCoMKgwqDCoMKgwqDCoERFRl9TVEFUX1NUUihTVk1fVExCX0lOVkFMX1VTLCAic3Zt
X3RsYl9pbnZhbF91cyIpLAo+IMKgwqDCoMKgwqDCoMKgwqBERUZfU1RBVF9TVFIoVk1BX1BBR0VG
QVVMVF9DT1VOVCwgInZtYV9wYWdlZmF1bHRfY291bnQiKSwKPiDCoMKgwqDCoMKgwqDCoMKgREVG
X1NUQVRfU1RSKFZNQV9QQUdFRkFVTFRfS0IsICJ2bWFfcGFnZWZhdWx0X2tiIiksCj4gK8KgwqDC
oMKgwqDCoMKgREVGX1NUQVRfU1RSKFBSRUZFVENIX1BBR0VGQVVMVF9DT1VOVCwKPiAicHJlZmV0
Y2hfcGFnZWZhdWx0X2NvdW50IiksCj4gwqDCoMKgwqDCoMKgwqDCoERFRl9TVEFUX1NUUihTVk1f
NEtfUEFHRUZBVUxUX0NPVU5ULAo+ICJzdm1fNEtfcGFnZWZhdWx0X2NvdW50IiksCj4gwqDCoMKg
wqDCoMKgwqDCoERFRl9TVEFUX1NUUihTVk1fNjRLX1BBR0VGQVVMVF9DT1VOVCwKPiAic3ZtXzY0
S19wYWdlZmF1bHRfY291bnQiKSwKPiDCoMKgwqDCoMKgwqDCoMKgREVGX1NUQVRfU1RSKFNWTV8y
TV9QQUdFRkFVTFRfQ09VTlQsCj4gInN2bV8yTV9wYWdlZmF1bHRfY291bnQiKSwKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3N0YXRzX3R5cGVzLmgKPiBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndF9zdGF0c190eXBlcy5oCj4gaW5kZXggZDgzNDhhOGRlMmUxYi4uMjNk
NzJjOTVhMmI1ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rfc3RhdHNf
dHlwZXMuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9zdGF0c190eXBlcy5oCj4g
QEAgLTEzLDYgKzEzLDcgQEAgZW51bSB4ZV9ndF9zdGF0c19pZCB7Cj4gwqDCoMKgwqDCoMKgwqDC
oFhFX0dUX1NUQVRTX0lEX1NWTV9UTEJfSU5WQUxfVVMsCj4gwqDCoMKgwqDCoMKgwqDCoFhFX0dU
X1NUQVRTX0lEX1ZNQV9QQUdFRkFVTFRfQ09VTlQsCj4gwqDCoMKgwqDCoMKgwqDCoFhFX0dUX1NU
QVRTX0lEX1ZNQV9QQUdFRkFVTFRfS0IsCj4gK8KgwqDCoMKgwqDCoMKgWEVfR1RfU1RBVFNfSURf
UFJFRkVUQ0hfUEFHRUZBVUxUX0NPVU5ULAo+IMKgwqDCoMKgwqDCoMKgwqBYRV9HVF9TVEFUU19J
RF9TVk1fNEtfUEFHRUZBVUxUX0NPVU5ULAo+IMKgwqDCoMKgwqDCoMKgwqBYRV9HVF9TVEFUU19J
RF9TVk1fNjRLX1BBR0VGQVVMVF9DT1VOVCwKPiDCoMKgwqDCoMKgwqDCoMKgWEVfR1RfU1RBVFNf
SURfU1ZNXzJNX1BBR0VGQVVMVF9DT1VOVCwKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d1Y19md2lmLmgKPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfZndpZi5oCj4g
aW5kZXggYzkwZGQyNjZlOWNmOS4uMWQ2ZjllYmIzNzZkZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3VjX2Z3aWYuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dWNfZndpZi5oCj4gQEAgLTMwOSw3ICszMDksOCBAQCBzdHJ1Y3QgeGVfZ3VjX3BhZ2VmYXVsdF9k
ZXNjIHsKPiDCoCNkZWZpbmUgUEZEX0FDQ0VTU19UWVBFwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBHRU5NQVNLKDEsIDApCj4gwqAjZGVmaW5lIFBGRF9GQVVMVF9UWVBFwqDCoMKgwqDC
oMKgwqDCoMKgR0VOTUFTSygzLCAyKQo+IMKgI2RlZmluZSBQRkRfVkZJRMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoEdFTk1BU0soOSwgNCkKPiAtI2RlZmluZSBQRkRfUlNWRF8xwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBHRU5NQVNLKDExLCAxMCkKPiArI2RlZmluZSBQRkRfUlNWRF8x
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBCSVQoMTApCj4gKyNkZWZpbmUgWEUzUF9QRkRfUFJF
RkVUQ0jCoMKgwqDCoMKgwqBCSVQoMTEpCj4gwqAjZGVmaW5lIFBGRF9WSVJUVUFMX0FERFJfTE/C
oMKgwqDCoEdFTk1BU0soMzEsIDEyKQo+IMKgI2RlZmluZSBQRkRfVklSVFVBTF9BRERSX0xPX1NI
SUZUIDEyCj4gwqAKPiBAQCAtMzI5LDcgKzMzMCw3IEBAIHN0cnVjdCB4ZV9ndWNfcGFnZWZhdWx0
X3JlcGx5IHsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqB1MzIgZHcxOwo+IMKgI2RlZmluZSBQRlJf
VkZJRMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEdFTk1BU0soNSwgMCkKPiAtI2RlZmlu
ZSBQRlJfUlNWRF8xwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBCSVQoNikKPiArI2RlZmluZSBY
RTNQX1BGUl9QUkVGRVRDSMKgwqDCoMKgwqDCoEJJVCg2KQo+IMKgI2RlZmluZSBQRlJfRU5HX0lO
U1RBTkNFwqDCoMKgwqDCoMKgwqBHRU5NQVNLKDEyLCA3KQo+IMKgI2RlZmluZSBQRlJfRU5HX0NM
QVNTwqDCoMKgwqDCoMKgwqDCoMKgwqBHRU5NQVNLKDE1LCAxMykKPiDCoCNkZWZpbmUgUEZSX1BE
QVRBwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEdFTk1BU0soMzEsIDE2KQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3BhZ2VmYXVsdC5jCj4gYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjX3BhZ2VmYXVsdC5jCj4gaW5kZXggNzE5YTE4MTg3YTMxZC4uYjZjMTJl
NTYzMDY3MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3BhZ2VmYXVs
dC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19wYWdlZmF1bHQuYwo+IEBAIC0y
Nyw2ICsyNyw3IEBAIHN0YXRpYyB2b2lkIGd1Y19hY2tfZmF1bHQoc3RydWN0IHhlX3BhZ2VmYXVs
dCAqcGYsCj4gaW50IGVycikKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEZJRUxE
X1BSRVAoUEZSX0FTSUQsIHBmLT5jb25zdW1lci5hc2lkKSwKPiDCoAo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgRklFTERfUFJFUChQRlJfVkZJRCwgdmZpZCkgfAo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBGSUVMRF9QUkVQKFhFM1BfUEZSX1BSRUZFVENILCBwZi0+
Y29uc3VtZXIucHJlZmV0Y2gpCj4gfAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
RklFTERfUFJFUChQRlJfRU5HX0lOU1RBTkNFLCBlbmdpbmVfaW5zdGFuY2UpIHwKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEZJRUxEX1BSRVAoUEZSX0VOR19DTEFTUywgZW5naW5l
X2NsYXNzKSB8Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBGSUVMRF9QUkVQKFBG
Ul9QREFUQSwgcGRhdGEpLAo+IEBAIC03Nyw2ICs3OCw3IEBAIGludCB4ZV9ndWNfcGFnZWZhdWx0
X2hhbmRsZXIoc3RydWN0IHhlX2d1YyAqZ3VjLAo+IHUzMiAqbXNnLCB1MzIgbGVuKQo+IMKgwqDC
oMKgwqDCoMKgwqBwZi5jb25zdW1lci5hc2lkID0gRklFTERfR0VUKFBGRF9BU0lELCBtc2dbMV0p
Owo+IMKgwqDCoMKgwqDCoMKgwqBwZi5jb25zdW1lci5hY2Nlc3NfdHlwZSA9IEZJRUxEX0dFVChQ
RkRfQUNDRVNTX1RZUEUsIG1zZ1syXSk7Cj4gwqDCoMKgwqDCoMKgwqDCoHBmLmNvbnN1bWVyLmZh
dWx0X3R5cGUgPSBGSUVMRF9HRVQoUEZEX0ZBVUxUX1RZUEUsIG1zZ1syXSk7Cj4gK8KgwqDCoMKg
wqDCoMKgcGYuY29uc3VtZXIucHJlZmV0Y2ggPSBGSUVMRF9HRVQoWEUzUF9QRkRfUFJFRkVUQ0gs
IG1zZ1syXSk7Cj4gwqDCoMKgwqDCoMKgwqDCoGlmIChGSUVMRF9HRVQoWEUyX1BGRF9UUlZBX0ZB
VUxULCBtc2dbMF0pKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcGYuY29uc3Vt
ZXIuZmF1bHRfbGV2ZWwgPSBYRV9QQUdFRkFVTFRfTEVWRUxfTkFDSzsKPiDCoMKgwqDCoMKgwqDC
oMKgZWxzZQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGFnZWZhdWx0LmMK
PiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wYWdlZmF1bHQuYwo+IGluZGV4IDY4YmNjMjVmMjc4
OTAuLjgxZTY0MWE5YjIyNzQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Bh
Z2VmYXVsdC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhZ2VmYXVsdC5jCj4gQEAg
LTIyMiw4ICsyMjIsMTQgQEAgc3RhdGljIGJvb2wgeGVfcGFnZWZhdWx0X3F1ZXVlX3BvcChzdHJ1
Y3QKPiB4ZV9wYWdlZmF1bHRfcXVldWUgKnBmX3F1ZXVlLAo+IMKgwqDCoMKgwqDCoMKgwqByZXR1
cm4gZm91bmRfZmF1bHQ7Cj4gwqB9Cj4gwqAKPiAtc3RhdGljIHZvaWQgeGVfcGFnZWZhdWx0X3By
aW50KHN0cnVjdCB4ZV9wYWdlZmF1bHQgKnBmLCBpbnQgZXJyKQo+ICtzdGF0aWMgdm9pZCB4ZV9w
YWdlZmF1bHRfZXJyb3JfYWNjb3VudChzdHJ1Y3QgeGVfcGFnZWZhdWx0ICpwZiwgaW50Cj4gZXJy
KQo+IMKgewo+ICvCoMKgwqDCoMKgwqDCoC8qIERvbid0IHNwYW0gbG9nIGZvciBwcmVmZXRjaCBh
Y2Nlc3NlcywganVzdCBhZGQgdG8gc3RhdHMgKi8KPiArwqDCoMKgwqDCoMKgwqBpZiAocGYtPmNv
bnN1bWVyLnByZWZldGNoKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2d0
X3N0YXRzX2luY3IocGYtPmd0LAo+IFhFX0dUX1NUQVRTX0lEX1BSRUZFVENIX1BBR0VGQVVMVF9D
T1VOVCwgMSk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybjsKPiArwqDC
oMKgwqDCoMKgwqB9Cj4gKwo+IMKgwqDCoMKgwqDCoMKgwqB4ZV9ndF9kYmcocGYtPmd0LCAiXG5G
YXVsdCByZXNwb25zZTogVW5zdWNjZXNzZnVsICVwZVxuIgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgIlx0QVNJRDogJWRcbiIKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICJcdEZhdWx0ZWQgQWRkcmVzczogMHglMDh4JTA4eFxuIgo+IEBAIC0yNjIsNyAr
MjY4LDEwIEBAIHN0YXRpYyB2b2lkIHhlX3BhZ2VmYXVsdF9xdWV1ZV93b3JrKHN0cnVjdAo+IHdv
cmtfc3RydWN0ICp3KQo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlcnIg
PSB4ZV9wYWdlZmF1bHRfc2VydmljZSgmcGYpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgaWYgKGVycikKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHhlX3BhZ2VmYXVsdF9wcmludCgmcGYsIGVycik7Cj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9wYWdlZmF1bHRfZXJyb3JfYWNjb3VudCgm
cGYsIGVycik7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVsc2UKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qIFByZWZldGNoIGZhdWx0
cyBzaG91bGQgb25seSBiZSBhY2tlZCBvbgo+IGVycm9yICovCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwZi5jb25zdW1lci5wcmVmZXRjaCA9IDA7Cj4g
wqAKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBmLnByb2R1Y2VyLm9wcy0+YWNr
X2ZhdWx0KCZwZiwgZXJyKTsKPiDCoAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfcGFnZWZhdWx0X3R5cGVzLmgKPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wYWdlZmF1bHRf
dHlwZXMuaAo+IGluZGV4IGQzYjUxNjQwN2Q2MDAuLmY0MjMzNjYwMmY5NzQgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhZ2VmYXVsdF90eXBlcy5oCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3BhZ2VmYXVsdF90eXBlcy5oCj4gQEAgLTg0LDggKzg0LDEzIEBAIHN0
cnVjdCB4ZV9wYWdlZmF1bHQgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdTgg
ZW5naW5lX2NsYXNzOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyoqIEBjb25z
dW1lci5lbmdpbmVfaW5zdGFuY2U6IGVuZ2luZSBpbnN0YW5jZSAqLwo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgdTggZW5naW5lX2luc3RhbmNlOwo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAvKioKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogQGNv
bnN1bWVyLnByZWZldGNoOiBmYXVsdCBpcyBjYXVzZWQgYnkgSFcgcHJlZmV0Y2gKPiAtIHNob3Vs
ZAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBvbmx5IGJlIGFja2VkIG9uIGZh
aWx1cmUKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHU4IHByZWZldGNoOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgLyoqIGNvbnN1bWVyLnJlc2VydmVkOiByZXNlcnZlZCBiaXRzIGZvciBmdXR1cmUK
PiBleHBhbnNpb24gKi8KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdTggcmVzZXJ2
ZWRbN107Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHU4IHJlc2VydmVkWzZdOwo+
IMKgwqDCoMKgwqDCoMKgwqB9IGNvbnN1bWVyOwo+IMKgwqDCoMKgwqDCoMKgwqAvKioKPiDCoMKg
wqDCoMKgwqDCoMKgICogQHByb2R1Y2VyOiBTdGF0ZSBmb3IgdGhlIHByb2R1Y2VyIChpLmUuLCBI
Vy9GVyBpbnRlcmZhY2UpLgo+IFBvcHVsYXRlZAo+IAoK
