Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF03CCCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 19:54:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A16B10EA12;
	Thu, 30 Oct 2025 19:54:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S5fIOGTo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2E310EA12
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 19:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761854054; x=1793390054;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=zE2W5d2Hb82UhoKNU+bV8uQTq2LOm6JRf1gXNvEewfA=;
 b=S5fIOGToyiVhDyqIrfbMsKWPus6xH+D4FBMdgYCS6yTn0Y0vHBfMBqf7
 Qs9IiQkyrcOs0Vuv439lpIKM/wvbl+aPodJtCNLku8vfd42+DsyQ83jkp
 qsL4vn9QVTxngxvwjLfMqBKcaK+mxDX4UycOg9xtcJWfqNNR/36GXY8oR
 MHj2yVTJ4ZHdggGXnqXc777FVTpPnfOwdw1Anva8PUMBs36X5Zf522cTA
 4wcbFN8uED+X1nE5zRhbO8YsdS9NxZ+WJEgYqqkwf2zlu/W8oIhnsE0sb
 xzavVieRB8BFDdA2cCiULLoi9h14c8RtC/4lkkixzvpb7CMMWs5L7qPhC Q==;
X-CSE-ConnectionGUID: GBZl3HAaTfeHwSV4nTPCig==
X-CSE-MsgGUID: 1M7jzbg5TFelHBvUSrUgIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63919473"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="63919473"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 12:54:13 -0700
X-CSE-ConnectionGUID: ZjvWxMYrSRybkwVxk5POMg==
X-CSE-MsgGUID: 0tBNhhrBTXeqnuSV2rNEzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185314868"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 12:54:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 12:54:13 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 12:54:12 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.14) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 12:54:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MMNvoboy1JfB3+qTSDd5ichau/R3mBZuaibT4uaVsb39eoAh/hviFYMt4ArpqrtGL+GqrWH/f4Uo5IasOMz9ncmcjvASHFJBRQrHW7WjkY5hM4LDNLFADpWdLi12mp+Tj11kQHawMJJ+KC+VXVRVfyAmt3kDz/u0qKtAyUq/+WZMx6M90fG/OzVV8sHLDsSFyfVnbmkv/URDMYZHNfB+YKqaZfoFwWK31dKN3gHMHvlZCuSc2e/eB0U/GhiKQqFuvd4wO0HaRraco4boKMD/fa1whdP4vMeUV6vtMp8tOaDCijZv7JEjphmEixiJ2x6sEq77iOQFdxsglKCxWeP2BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zE2W5d2Hb82UhoKNU+bV8uQTq2LOm6JRf1gXNvEewfA=;
 b=EDW2V7hzMdHxNEUDeW8qX9Ex2e1kEG+YmfXnX1bXYS7qDxbLp3VM7LiAEr+HMZnXnjQ7r5SvSdHK6WQvpfdnnqUq8boD/SqV3J828bmGs7QipESftzlaOBARI2i6mqRfAU1coc7cGdlAsI42JC7vDO0SiBhfD8njv1JdZqyR0zUBlsvVvekWJiyKBm0t73a6uzjWf+XD5Dn6qJzYsR3ATLD8Oy13rsLoZ9P+5K3K5cD1igSbdAcQ06xubfeSBmT8pKrmkOn7O/B76EbeAewcwSt0M3SxFsNWksinb7twzo9Q2rI28tc0Y8Yekbwq2QSyIt7YarZEGml3h/fJ1PkpFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB8083.namprd11.prod.outlook.com (2603:10b6:8:15e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 19:54:08 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 19:54:08 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 8/8] drm/xe/gt_throttle: Avoid TOCTOU when monitoring
 reasons
Thread-Topic: [PATCH v3 8/8] drm/xe/gt_throttle: Avoid TOCTOU when monitoring
 reasons
Thread-Index: AQHcSS4tsWFo04ymMES7VwlygVs6sLTac8IAgABUWQCAAA5ngIAABYMAgAArv4CAABPFAA==
Date: Thu, 30 Oct 2025 19:54:08 +0000
Message-ID: <3e341f0de412ec02c3c4d7209d54b9b2cf88ec1d.camel@intel.com>
References: <20251029-gt-throttle-cri-v3-0-d1f5abbb8114@intel.com>
 <20251029-gt-throttle-cri-v3-8-d1f5abbb8114@intel.com>
 <aQM1oKHBh0GvQQK5@black.igk.intel.com>
 <jnuis4h4uq7he4yq52rsb7ee6jffgclyf4skvftu3m3gsnk7xy@vhtbsgchkvyx>
 <aQOIdza-zd3ES9xw@intel.com> <aQONFr2dRVU93R3T@black.igk.intel.com>
 <qcs3fp5unhjdbqwlayweo4c42igytx3n5xro7tbs7kkso2lnzz@zcelrecmbsfe>
In-Reply-To: <qcs3fp5unhjdbqwlayweo4c42igytx3n5xro7tbs7kkso2lnzz@zcelrecmbsfe>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8430:EE_|DS0PR11MB8083:EE_
x-ms-office365-filtering-correlation-id: 39743b54-5d6e-42f2-90c9-08de17ee1698
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?cVFNSTZvcGpleHB3dG1hMmgybENBZDdpMEs4clhnN2FiMlFqTjdxOCt6bUdD?=
 =?utf-8?B?V2Zldm5wV093R1lKWDNOdjVpSFBJYUZCYWFzbUdObGt0cDJmNm8zQy9Tc09B?=
 =?utf-8?B?cDBsdmNla2pkNWxMMCtRWENzMDcwT2lnMlAwM0ZWVldXd2JmSDVITEk4ekky?=
 =?utf-8?B?d1ZVc21xOW5IbWtDalo3cEl3Rkc0LzgrVG1CQURqTDQyN3B2blJFUkNaeWlE?=
 =?utf-8?B?NU1TZTF2bG1USFNyYytuZkpmSFp0WStlUVEyZ0t1c2hSNVJpZ0U5RGpMRWFk?=
 =?utf-8?B?RE9WYWRsS0syWUxaZXZSaDN2MWlNM1JSc0tSUGtwaXh4UjVzU1ptYW9tN2pw?=
 =?utf-8?B?Y21YTFVpaW8rSUY0RlR1Wlp2STdyTG9SUy93dVYraVUyQXo5VHRjSDBLVmcy?=
 =?utf-8?B?MWlKUTdaZXU2RXFvc0QzV3UrTWx1TDdqVGdmYmNxVkQ4Z1VYR3I2dXQyVVA4?=
 =?utf-8?B?WFVSWE1SZTFJSjdZN2VFei9uRGpKbUpoVUViTDBFMnFTRStVSWt4ZWxBcW9C?=
 =?utf-8?B?MWJIWS9oN0VScisvYy85QjVDQ096K1d3UEcweTFwRVZDN1F1d0J3WUN1WXor?=
 =?utf-8?B?cDl3dG4vK01DTFpqb2tzRUtjOWlwSXFEODhMdVZQOXBJV0FiOGZGZ3dqMWMx?=
 =?utf-8?B?bW5vdm5xNUc4WEQwQXFGbWxCZEhUOUtjanAzRDY2UXBINnVoZmZkclhtUFBY?=
 =?utf-8?B?d0gzWWdWZFAzOVE5Ym5xWnBSZFdMUks1NHNwT0pFYUlEUDgwWkJhOU1JVEI5?=
 =?utf-8?B?ZHZ0T21VS2lxSU9tNzl0ZXI1UHZ5M25kdktXcE5IbHBFWk9UUjcreVdrZGZU?=
 =?utf-8?B?L3hXcVpKL2N4VWRRcW9Wbytxb3hxcTdBVXpyeTJHS0Q5SVVwTFJwT3B0UzMx?=
 =?utf-8?B?cEwwWmRVZFU1MnNRYXpLdk9HcXVDVTVGMUpmblJPbDNRdkhVRDJHMHhJMDJH?=
 =?utf-8?B?Q2ZDWTAxbVJUQ1BwQk5La2N3YUx1ZTMzK093eUtuWFNwd0ZLSGJCT1pZWGcv?=
 =?utf-8?B?UDE3aFFKQ3pjckNsdHlwY3VkcFZTR1psUzdwVlgwamMxbWtKemRXTnZJSVhn?=
 =?utf-8?B?RzA0ODZPeEhpR1ZvckZzam4za0t0cWtQbmhCb3JKZFVaVFprWHkzamtLb3ZF?=
 =?utf-8?B?SnhNVWFyREJ1cFdtV0pjRTgyam1ObGNQRGg0Y0YyU0Q0QWo3ZE5OMS81ZHI4?=
 =?utf-8?B?d1FWYnA5TGFWSXJNUHZIcFBLOXdETmVscUc4c1BrUFM3YWx6L3NyZVV4cTdB?=
 =?utf-8?B?c2J4U2s3THI0ZWVrMGwvY3Z2R1BrZzYrbi81T09XZU9RN3liZE0ybFdvQkVQ?=
 =?utf-8?B?WUF1emwxZ2FmbFRsdlpaQVVqTmtoeDhndEdSdElRY1BPZVRPQkh0Q2xMdHNJ?=
 =?utf-8?B?dlZoQVd6c1E5S1ZpTm9kRU5EMHRtY3hZKzhzMmtpQUpzaXhEdVhvRjhaanM0?=
 =?utf-8?B?SHJQck9xM2tyT2huZDFWSkt2bDdyd3dWRFc3VWEzRDMzMUlxYVArM0JKVUFr?=
 =?utf-8?B?cm50MWswMTQ0c0NRVmVoZEpJRHI3K1BrNFVIUm0rc09hZGNJTzdvUUN2OVlX?=
 =?utf-8?B?L2lTR3dkK21VY2FjQVNqclVucVlRSzhQRzliaW12cmZDVGthS1J1QVdKTVl6?=
 =?utf-8?B?SzVqMUY0c1B4bzJHSllaYUg3bW16SlNXWlpmSkhDenFISmw2dFJlbjNVdmZ0?=
 =?utf-8?B?MlkzM1pYTmY3elN5NEwrM1NtTlRqNHBoNlZSaktBdFFwSHEzL2gvRWg1SC9O?=
 =?utf-8?B?cjAxVDA5TkZsU015bFB1Umx4SktXTURXUTJVTTE0VVRGdDJodUhCUURiMTNC?=
 =?utf-8?B?eHRRQjFsTUZLM0RtVEJsREtCaFFTQ3U1dHFFaVgxdWoxb3A2NXdWZ2FmRVd3?=
 =?utf-8?B?c29mS2F2bWkrQkFYbFkxVkRYdW92TTlzaXZQU24xSEtGUXdXT2VoRFBESFZJ?=
 =?utf-8?B?cmk0YWFZVS9jdS9BOGVRNE53NVo0S2JlekJwWktkNnVzSlFKWW5aMW52cEsx?=
 =?utf-8?B?MnU3SG1rVkJaTUtPZ0N3amw3bkVhYWxZSE9OeVZiR1Fwdk15Q1VBOVd4cmpR?=
 =?utf-8?Q?SvQvLr?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NTdxcnI2NVpqRkVMTmMrK3VxRnFZT1V0NytqR2FNVWM0MzFGSkxKQlV1MFg3?=
 =?utf-8?B?eTViUTcwb09rSVlmTU1vMWNuRkZvc0x5cEdTWS9xQ0h5VEhKQlpiMXNIQ01X?=
 =?utf-8?B?cktMR25UTjRTRk9rTzlBMXdYTnJoWFBlbGVFUnhCQWt6Q1B1WTZNUUFvaWZ0?=
 =?utf-8?B?WWFUQW1oWlJjOFd0QUFFdmZlY2Mya3FtRlBpeUk5ZW03VitVQXhlS1kzYjJL?=
 =?utf-8?B?eE5RSzZHY0dDRnNYVnFxS0xoNGRsRlJCaFFhc3dnM1RLSzVwOXJkWjhScHdF?=
 =?utf-8?B?WVUzM2docS8vK05XWnFOb001WE9YbmdFTXE2VTAxalJxODMxSFpvVEMydTVm?=
 =?utf-8?B?ZWVrVExjR0ZraW9kWEdNQnZ4QTI5ZytzZ0luOFdTS1J3VDRvSXc4K0p4Vklj?=
 =?utf-8?B?MVdTclkxdGd6QWNpUldSajRXK21ZbHd3ZHp0bDZnWnF0TWV1VTNxZ3BzalNa?=
 =?utf-8?B?MUNwS3dxcDRkVlZnMys0WXRUYTcwV2R3UVhRV2VMbWhEbWZiQkMvdkNvL1M3?=
 =?utf-8?B?T0ZEOWd4eGcrdnRTa0pvd0tPalVrSlVHSEhCVjZIYVA4SDZzMERCVmFsZXYv?=
 =?utf-8?B?WU1qZDRKL2lhdFdyZmpDeEtwcnZLVy9DOTN3S3lsTHR3MW83ZmhkMzlMd2lY?=
 =?utf-8?B?WnJxMGNRWXI5Q0VVR3dYdW8xSmduOUkrdXV1UER1bVdIYmg2dGRpU0FhWG9X?=
 =?utf-8?B?YXlnY1hxLzlEZk5LNVlQTlNBS3pmS09GMjJheHMvSEp3cFgrTVdaZFcxekgr?=
 =?utf-8?B?NlVGMkZYSW1yb2pUSGVwRmpJWHNUOWRQcGZiN3JjN25IVU1KemN2a25RV1hT?=
 =?utf-8?B?REZCbUtiV3ptZVRIc3p4SFI5dXlBSm5ISkFzUHNNNjlrd21NQng2TldDeTNq?=
 =?utf-8?B?dXNSMkh3N0lHMFkzNUtnN2lUenZ1dWZna0ZYWEZHVzlIZTNoTVlMQVI5NG40?=
 =?utf-8?B?azdTK0FvWXlwS3FRaGtrSm1TSVA0NVBRQmhTTTBVSHkrZ2c2NmUzaEdTRE8z?=
 =?utf-8?B?SlJvcDZXNVVYbHM3Nm9FU280TjhMTDgvbzJGakNwQzEzaGlNQ3I2MGlId2k4?=
 =?utf-8?B?a0w0UHI5aCtLTElrL3ZkMVAwdjFINjVhWlhPOVNTdkEwdmMyTWI0T05tcDVE?=
 =?utf-8?B?RzMzWDVieVdzOGlaNFkxZ1pBL2dJOFJDZTYyT1FTQW1GdElXM2poNWV5eXpH?=
 =?utf-8?B?QW1pMWgrcEMzQWo3Qy9vdmpZNTNwNjJiZ2IwSEVQQzltS0dyRTM5ZWFZYmg4?=
 =?utf-8?B?bmhaQ1FhRzJXWURNbmRnM0thVnJCbVIrNmtPcm4vV08xTld1blNsZldvUWU5?=
 =?utf-8?B?SkgzNE9RbDFHWW8xdkRFYW9uQllXTHpRMzY2L0paVS96VlJ1UnVvdkVGSjY5?=
 =?utf-8?B?RkNPTE9kTUp4ekhTbjc3NGorRmxTSE52d1JxV0pkajAyOHlGU1Z3YU1SZm5G?=
 =?utf-8?B?R2laTUZEQzMzSFNyQzRMTHB1TEdEU3BSSm40QkpKUXFCdGQvcVNZMTBDUG1F?=
 =?utf-8?B?aS8xS3N4alBsbjQ5Q0FGYnZUTTI3NEhBME1hLzlvblcyZ2RYSTJ0VWZvS09m?=
 =?utf-8?B?RFpMVkx0K3FDdGdHTTlyYjZGaisyNlpQejlpWGU2bG1BVVlxVE12c2VQeXpV?=
 =?utf-8?B?c3REU2JmcXpza1V1UnJaU25QQ1VGaVB5ZFVwWkNyVWVjWVVDamxoRndTamo3?=
 =?utf-8?B?MWJsL2Jad3NHNkVWOHUzYlg5SkRTdEZKRlc0akRteHM4bnl4bysvR2RVb0I4?=
 =?utf-8?B?V2dZNkpOYTk0V2k0VTJYS3grUGxOdDZaR0xZUnNnSXFvbExueDJMd09JWkRn?=
 =?utf-8?B?WEFJSzlpWThwMjVmd2w3Sk82TmtqTWNneGFtaFpURU1GTC9FRUlyZmwyWmdi?=
 =?utf-8?B?VE5FT04wMVlzR0M5RXZSeWIybUUreVFBWXJxaHNZMG02YXBodVBKMzZvTDZG?=
 =?utf-8?B?N3VKVzVXNUJOVlpvMFBRcHhCdS95MlBOV2tRTFJnMnhjTVdQb2F3TXl0aVoz?=
 =?utf-8?B?OStmb1E0QTdCajlzNTYzTFBoU2FERmw0WjhYeVpBQU45U1dVditqQnUyT3Bn?=
 =?utf-8?B?cklmbHN5aDRDZ0ZmcnBWV1dRZ096WDF5ZS9VbldEai9GYk10SUk0alBkbzUr?=
 =?utf-8?B?Qy80ek5FYU1oSUh2NFhuYU11ZHlodStGUmlEUXRHNk9iVUo2YjkxR3dacDVG?=
 =?utf-8?B?MFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4CA4E4ADBD8DB4FAF88D452740C2AF7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39743b54-5d6e-42f2-90c9-08de17ee1698
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 19:54:08.1727 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a/6l1s6lNiu5YhJaxxCqBOsLU+ogqQo71JAzcmyjyEcSCkUjoIZGa3tdRGvbRmDX5FD5xBzrAxsjpgfpS14/pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8083
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

T24gVGh1LCAyMDI1LTEwLTMwIGF0IDEzOjQzIC0wNTAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9uIFRodSwgT2N0IDMwLCAyMDI1IGF0IDA1OjA2OjQ2UE0gKzAxMDAsIFJhYWcgSmFkYXYg
d3JvdGU6DQo+ID4gT24gVGh1LCBPY3QgMzAsIDIwMjUgYXQgMTE6NDc6MDNBTSAtMDQwMCwgUm9k
cmlnbyBWaXZpIHdyb3RlOg0KPiA+ID4gT24gVGh1LCBPY3QgMzAsIDIwMjUgYXQgMDk6NTU6MzBB
TSAtMDUwMCwgTHVjYXMgRGUgTWFyY2hpIHdyb3RlOg0KPiA+ID4gPiBPbiBUaHUsIE9jdCAzMCwg
MjAyNSBhdCAxMDo1MzozNkFNICswMTAwLCBSYWFnIEphZGF2IHdyb3RlOg0KPiA+ID4gPiA+IE9u
IFdlZCwgT2N0IDI5LCAyMDI1IGF0IDA0OjQ1OjEwUE0gLTA3MDAsIEx1Y2FzIERlIE1hcmNoaQ0K
PiA+ID4gPiA+IHdyb3RlOg0KPiA+ID4gPiA+ID4gSXQncyBjdXJyZW50bHkgbm90IHBvc3NpYmxl
IHRvIHNhZmVseSBtb25pdG9yIGlmIHRoZXJlJ3MNCj4gPiA+ID4gPiA+IHRocm90dGxpbmcNCj4g
PiA+ID4gPiA+IGhhcHBlbmluZyBhbmQgd2hhdCBhcmUgdGhlIHJlYXNvbnMuIFRoZSBhcHByb2Fj
aCBvZiByZWFkaW5nDQo+ID4gPiA+ID4gPiB0aGUgc3RhdHVzDQo+ID4gPiA+ID4gPiBhbmQgdGhl
biByZWFkaW5nIHRoZSByZWFzb25zIGlzIG5vdCByZWxpYWJsZSBhcyBieSB0aGUgdGltZQ0KPiA+
ID4gPiA+ID4gc3lzYWRtaW4NCj4gPiA+ID4gPiA+IHJlYWRzIHRoZSByZWFzb24sIHRoZSB0aHJv
dHRsaW5nIGNvdWxkIG5vdCBiZSBoYXBwZW5pbmcNCj4gPiA+ID4gPiA+IGFueW1vcmUuDQo+ID4g
PiA+ID4gPiANCj4gPiA+ID4gPiA+IFByZXZpb3VzIHRlbnRhdGl2ZSB0byBmaXggdGhhdFsxXSB3
YXMgYnJlYWtpbmcgdGhlIEFCSSBhbmQNCj4gPiA+ID4gPiA+IHBvdGVudGlhbGx5DQo+ID4gPiA+
ID4gPiBzeXNhZG1pbidzIHNjcmlwdHMuIFRoaXMgdGFrZXMgYSBkaWZmZXJlbnQgYXBwcm9hY2gg
b2YNCj4gPiA+ID4gPiA+IGFkZGluZyBhbmQNCj4gPiA+ID4gPiA+IGRvY3VtZW50aW5nIHRoZSBh
ZGRpdGlvbmFsIGF0dHJpYnV0ZS4gSXQncyBzdGlsbCB2YWx1YWJsZSwNCj4gPiA+ID4gPiA+IHRo
b3VnaA0KPiA+ID4gPiA+ID4gcmVkdW5kYW50LCB0byBwcm92aWRlIHRoZSBzaW1wbGVyIDAvMSBp
bnRlcmZhY2UuDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IEluIG9yZGVyIHRvIGF2b2lkIHVz
ZXJzcGFjZSBrbm93bGVkZ2Ugb24gdGhlIGJpdG1hc2sNCj4gPiA+ID4gPiA+IG1lYW5pbmcgYW5k
IHRvIGJlDQo+ID4gPiA+ID4gPiBhYmxlIHRvIG1haW50YWluIHRoZSBrZXJuZWwgc2lkZSBpbiBz
eW5jIHdpdGggcG9zc2libGUNCj4gPiA+ID4gPiA+IGNoYW5nZXMgaW4NCj4gPiA+ID4gPiA+IGZ1
dHVyZSwganVzdCB3YWxrIHRoZSBhdHRyaWJ1dGUgZ3JvdXAgYW5kIGNoZWNrIHdoYXQgYXJlDQo+
ID4gPiA+ID4gPiB0aGUgbWFza3MgdGhhdA0KPiA+ID4gPiA+ID4gbWF0Y2ggdGhlIHZhbHVlIHJl
YWQuDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IFsxXQ0KPiA+ID4gPiA+ID4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvaW50ZWwteGUvMjAyNDEwMjUwOTIyMzguMTY3MDQyLTEtcmFhZy5qYWRh
dkBpbnRlbC5jb20vDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gLi4uDQo+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBhdHRyaWJ1dGVfZ3JvdXANCj4gPiA+ID4gPiA+
ICpnZXRfcGxhdGZvcm1fdGhyb3R0bGVfZ3JvdXAoc3RydWN0IHhlX2RldmljZSAqeGUpOw0KPiA+
ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gK3N0YXRpYyBzc2l6ZV90IHN0YXR1c19yZWFzb25zX3No
b3coc3RydWN0IGtvYmplY3QgKmtvYmosDQo+ID4gDQo+ID4gU2VtYW50aWNhbGx5IHRoZXJlJ3Mg
bXVjaCBvZiBhICdzdGF0dXMnIGhlcmUsIHNvIHRoaXMgY291bGQgc2ltcGx5DQo+ID4gYmUNCj4g
PiAncmVhc29ucycgKGFuZCBzYW1lIGZvciB0aGUgYXR0cmlidXRlIG5hbWUpLg0KPiA+IA0KPiA+
ID4gPiA+ID4gKwkJCQnCoMKgIHN0cnVjdCBrb2JqX2F0dHJpYnV0ZQ0KPiA+ID4gPiA+ID4gKmF0
dHIsIGNoYXIgKmJ1ZmYpDQo+ID4gPiA+ID4gPiArew0KPiA+ID4gPiA+ID4gKwlzdHJ1Y3QgeGVf
Z3QgKmd0ID0gdGhyb3R0bGVfdG9fZ3Qoa29iaik7DQo+ID4gPiA+ID4gPiArCXN0cnVjdCB4ZV9k
ZXZpY2UgKnhlID0gZ3RfdG9feGUoZ3QpOw0KPiA+ID4gPiA+ID4gKwljb25zdCBzdHJ1Y3QgYXR0
cmlidXRlX2dyb3VwICpncm91cDsNCj4gPiA+ID4gPiA+ICsJc3RydWN0IGF0dHJpYnV0ZSAqKnBv
dGhlcjsNCj4gPiA+ID4gPiA+ICsJc3NpemVfdCByZXQgPSAwOw0KPiA+ID4gPiA+ID4gKwl1MzIg
cmVhc29uczsNCj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ICsJcmVhc29ucyA9IHhlX2d0X3Ro
cm90dGxlX2dldF9saW1pdF9yZWFzb25zKGd0KTsNCj4gPiA+ID4gPiA+ICsJZ3JvdXAgPSBnZXRf
cGxhdGZvcm1fdGhyb3R0bGVfZ3JvdXAoeGUpOw0KPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4g
Kwlmb3IgKHBvdGhlciA9IGdyb3VwLT5hdHRyczsgKnBvdGhlcjsgcG90aGVyKyspIHsNCj4gPiA+
ID4gPiA+ICsJCXN0cnVjdCBrb2JqX2F0dHJpYnV0ZSAqa2F0dHIgPQ0KPiA+ID4gPiA+ID4gY29u
dGFpbmVyX29mKCpwb3RoZXIsIHN0cnVjdCBrb2JqX2F0dHJpYnV0ZSwgYXR0cik7DQo+ID4gPiA+
ID4gPiArCQlzdHJ1Y3QgdGhyb3R0bGVfYXR0cmlidXRlICpvdGhlcl90YSA9DQo+ID4gPiA+ID4g
PiBrb2JqX2F0dHJpYnV0ZV90b190aHJvdHRsZShrYXR0cik7DQo+ID4gPiA+ID4gPiArDQo+ID4g
PiA+ID4gPiArCQlpZiAob3RoZXJfdGEtPm1hc2sgIT0gVTMyX01BWCAmJiByZWFzb25zICYNCj4g
PiA+ID4gPiA+IG90aGVyX3RhLT5tYXNrKQ0KPiA+ID4gPiA+ID4gKwkJCXJldCArPSBzeXNmc19l
bWl0X2F0KGJ1ZmYsIHJldCwNCj4gPiA+ID4gPiA+ICIlcyAiLCAoKnBvdGhlciktPm5hbWUpOw0K
PiA+ID4gPiA+IA0KPiA+ID4gPiA+IE11Y2ggYmV0dGVyLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+
ID4gKwl9DQo+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiArCS8qIERyb3AgZXh0cmEgc3BhY2Ug
ZnJvbSBsYXN0IGl0ZXJhdGlvbiBhYm92ZSAqLw0KPiA+ID4gPiA+ID4gKwlpZiAocmV0KQ0KPiA+
ID4gPiA+ID4gKwkJcmV0LS07DQo+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiArCXJldCArPSBz
eXNmc19lbWl0X2F0KGJ1ZmYsIHJldCwgIlxuIik7DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gSSB3
ZW50IHRocm91Z2ggdGhlIGRvY3VtZW50YXRpb24gYWdhaW4gYW5kIEkgY291bGRuJ3QgZmluZA0K
PiA+ID4gPiA+IGFueSBydWxlcw0KPiA+ID4gPiA+IHJlbGF0ZWQgdG8gZW1wdHkgZmlsZXMgb3Ig
d2hldGhlciBpdCBpcyBhbGxvd2VkIChqdXN0DQo+ID4gPiA+ID4gdGhpbmtpbmcgb3V0DQo+ID4g
PiA+ID4gbG91ZCBhYm91dCBubyB0aHJvdHRsaW5nIGNhc2VzKS4NCj4gPiA+ID4gDQo+ID4gPiA+
IGRvIHlvdSBtZWFuIGlmICJlbXB0eSIgZmlsZXMgYXJlIGFsbG93ZWQgaW4gc3lzZnM/IEkgZG9u
J3QNCj4gPiA+ID4gdGhpbmsgdGhlcmUncw0KPiA+ID4gPiBhbnkgcHJvYmxlbSB3aXRoIHRoYXQu
IEl0J3MgYWxzbyBub3QgZW1wdHksIGl0IGhhcyBhIG5ld2xpbmUNCj4gPiA+ID4gdGhlcmUgOykN
Cj4gPiA+IA0KPiA+ID4gYWx0ZXJuYXRpdmVseSB3ZSBjb3VsZCBwcmludCB0aGUgZW50aXJlIHJl
ZyBpbiBoZXggZm9ybWF0Pw0KPiA+ID4gQnV0IEkgcHJlZmVyIHRoZSB0ZXh0IGxpbmUgaW4gdGhp
cyBwYXRjaC4NCj4gPiA+IA0KPiA+ID4gTm90aGluZyBhZ2FpbnN0IHRoZSAnZW1wdHknIGZpbGUg
d2l0aCBvciB3aXRob3V0IHRoZSBuZXctbGluZSwNCj4gPiA+IGJ1dCBwZXJoYXBzIHdlIGNvdWxk
IGNvbnNpZGVyIHRvIHRyYWNrIHRoYXQgaW4gdGhlIGxvb3ANCj4gPiA+IGFuZCBpZiBub25lIGlz
IGFkZCB3ZSBwcmludA0KPiA+ID4gDQo+ID4gPiBpZiAocmV0KQ0KPiA+ID4gCXJldC0tOw0KPiA+
ID4gZWxzZQ0KPiA+ID4gCXN5c2ZzX2VtaXRfYXQoYnVmZiwgcmV0LCAibm9uZSIpOw0KPiA+ID4g
DQo+ID4gPiBhbmQgZG9jdW1lbnQgdGhhdCBhYm92ZS4uLg0KPiA+IA0KPiA+ICsxLg0KPiANCj4g
Y29sbGVjdGluZyBhbGwgdGhlIHJldmlldyBjb21tZW5kcyBmcm9tIHlvdSAyLCB0aGF0IHdvdWxk
IGJlIHdpdGgNCj4gdGhpcw0KPiBkaWZmIHNxdWFzaGVkOg0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90aHJvdHRsZS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d0X3Rocm90dGxlLmMNCj4gaW5kZXggY2E0NWFlYThjMTdhNi4uZjM0NzZmZGE3ZjRmNiAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3Rocm90dGxlLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3Rocm90dGxlLmMNCj4gQEAgLTIyLDE1ICsyMiwx
NSBAQA0KPiDCoMKgICogVGhlaXIgYXZhaWxhYmlsaXR5IGRlcGVuZCBvbiB0aGUgcGxhdGZvcm0g
YW5kIHNvbWUgbWF5IG5vdCBiZQ0KPiB2aXNpYmxlIGlmIHRoYXQNCj4gwqDCoCAqIHJlYXNvbiBp
cyBub3QgYXZhaWxhYmxlLg0KPiDCoMKgICoNCj4gLSAqIFRoZSBgYHN0YXR1c19yZWFzb25zYGAg
YXR0cmlidXRlIGNhbiBiZSB1c2VkIGJ5IHN5c2FkbWluDQo+IG1vbml0b3JpbmcgYWxsDQo+IC0g
KiBwb3NzaWJsZSByZWFzb25zIGZvciB0aHJvdHRsaW5nIGFuZCByZXBvcnRpbmcgdGhlbS4gSXQn
cw0KPiBwcmVmZXJyZWQgb3Zlcg0KPiAtICogbW9uaXRvcmluZyBgYHN0YXR1c2BgIGFuZCB0aGVu
IHJlYWRpbmcgdGhlIHJlYXNvbiBib3RoIGZvcg0KPiBzaW1wbGljaXR5IGFuZCB0bw0KPiAtICog
YXZvaWQgVE9DVE9VICh0aW1lLW9mLWNoZWNrIHRvIHRpbWUtb2YtdXNlKS4NCj4gKyAqIFRoZSBg
YHJlYXNvbnNgYCBhdHRyaWJ1dGUgY2FuIGJlIHVzZWQgYnkgc3lzYWRtaW4gdG8gbW9uaXRvciBh
bGwNCj4gcG9zc2libGUNCj4gKyAqIHJlYXNvbnMgZm9yIHRocm90dGxpbmcgYW5kIHJlcG9ydCB0
aGVtLiBJdCdzIHByZWZlcnJlZCBvdmVyDQo+IG1vbml0b3JpbmcNCj4gKyAqIGBgc3RhdHVzYGAg
YW5kIHRoZW4gcmVhZGluZyB0aGUgcmVhc29uIGZyb20gaW5kaXZpZHVhbCBhdHRyaWJ1dGVzDQo+
IHNpbmNlIHRoYXQNCj4gKyAqIGlzIHJhY3kuIElmIHRoZXJlJ3Mgbm8gdGhyb3R0bGluZyBoYXBw
ZW5pbmcsICJub25lIiBpcyByZXR1cm5lZC4NCj4gwqDCoCAqDQo+IMKgwqAgKiBUaGUgZm9sbG93
aW5nIGF0dHJpYnV0ZXMgYXJlIGF2YWlsYWJsZSBvbiBDcmVzY2VudCBJc2xhbmQNCj4gcGxhdGZv
cm06DQo+IMKgwqAgKg0KPiDCoMKgICogLSBgYHN0YXR1c2BgOiBPdmVyYWxsIHRocm90dGxlIHN0
YXR1cyAoMDogbm8gdGhyb3R0bGluZywgMToNCj4gdGhyb3R0bGluZykNCj4gLSAqIC0gYGBzdGF0
dXNfcmVhc29uc2BgOiBBbGwgcmVhc29ucyBjYXVzaW5nIHRocm90dGxpbmcgc2VwYXJhdGVkIGJ5
DQo+IG5ld2xpbmUuDQo+ICsgKiAtIGBgcmVhc29uc2BgOiBBbGwgcmVhc29ucyBjYXVzaW5nIHRo
cm90dGxpbmcgc2VwYXJhdGVkIGJ5IHNwYWNlDQo+IMKgwqAgKiAtIGBgcmVhc29uX3BsMWBgOiBw
YWNrYWdlIFBMMQ0KPiDCoMKgICogLSBgYHJlYXNvbl9wbDJgYDogcGFja2FnZSBQTDINCj4gwqDC
oCAqIC0gYGByZWFzb25fcGw0YGA6IHBhY2thZ2UgUEw0DQo+IEBAIC01MCw3ICs1MCw3IEBADQo+
IMKgwqAgKiBPdGhlciBwbGF0Zm9ybXMgc3VwcG9ydCB0aGUgZm9sbG93aW5nIHJlYXNvbnM6DQo+
IMKgwqAgKg0KPiDCoMKgICogLSBgYHN0YXR1c2BgOiBPdmVyYWxsIHRocm90dGxlIHN0YXR1cyAo
MDogbm8gdGhyb3R0bGluZywgMToNCj4gdGhyb3R0bGluZykNCj4gLSAqIC0gYGBzdGF0dXNfcmVh
c29uc2BgOiBBbGwgcmVhc29ucyBjYXVzaW5nIHRocm90dGxpbmcgc2VwYXJhdGVkIGJ5DQo+IG5l
d2xpbmUuDQo+ICsgKiAtIGBgcmVhc29uc2BgOiBBbGwgcmVhc29ucyBjYXVzaW5nIHRocm90dGxp
bmcgc2VwYXJhdGVkIGJ5IHNwYWNlDQo+IMKgwqAgKiAtIGBgcmVhc29uX3BsMWBgOiBwYWNrYWdl
IFBMMQ0KPiDCoMKgICogLSBgYHJlYXNvbl9wbDJgYDogcGFja2FnZSBQTDINCj4gwqDCoCAqIC0g
YGByZWFzb25fcGw0YGA6IHBhY2thZ2UgUEw0LCBJY2NtYXggZXRjLg0KPiBAQCAtMTIwLDggKzEy
MCw4IEBAIHN0YXRpYyBzc2l6ZV90IHJlYXNvbl9zaG93KHN0cnVjdCBrb2JqZWN0ICprb2JqLA0K
PiDCoCANCj4gwqAgc3RhdGljIGNvbnN0IHN0cnVjdCBhdHRyaWJ1dGVfZ3JvdXANCj4gKmdldF9w
bGF0Zm9ybV90aHJvdHRsZV9ncm91cChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSk7DQo+IMKgIA0KPiAt
c3RhdGljIHNzaXplX3Qgc3RhdHVzX3JlYXNvbnNfc2hvdyhzdHJ1Y3Qga29iamVjdCAqa29iaiwN
Cj4gLQkJCQnCoMKgIHN0cnVjdCBrb2JqX2F0dHJpYnV0ZSAqYXR0ciwgY2hhcg0KPiAqYnVmZikN
Cj4gK3N0YXRpYyBzc2l6ZV90IHJlYXNvbnNfc2hvdyhzdHJ1Y3Qga29iamVjdCAqa29iaiwNCj4g
KwkJCcKgwqDCoCBzdHJ1Y3Qga29ial9hdHRyaWJ1dGUgKmF0dHIsIGNoYXIgKmJ1ZmYpDQo+IMKg
IHsNCj4gwqDCoAlzdHJ1Y3QgeGVfZ3QgKmd0ID0gdGhyb3R0bGVfdG9fZ3Qoa29iaik7DQo+IMKg
wqAJc3RydWN0IHhlX2RldmljZSAqeGUgPSBndF90b194ZShndCk7DQo+IEBAIC0xNDEsOSArMTQx
LDExIEBAIHN0YXRpYyBzc2l6ZV90IHN0YXR1c19yZWFzb25zX3Nob3coc3RydWN0DQo+IGtvYmpl
Y3QgKmtvYmosDQo+IMKgwqAJCQlyZXQgKz0gc3lzZnNfZW1pdF9hdChidWZmLCByZXQsICIlcyAi
LA0KPiAoKnBvdGhlciktPm5hbWUpOw0KPiDCoMKgCX0NCj4gwqAgDQo+IC0JLyogRHJvcCBleHRy
YSBzcGFjZSBmcm9tIGxhc3QgaXRlcmF0aW9uIGFib3ZlICovDQo+IMKgwqAJaWYgKHJldCkNCj4g
KwkJLyogRHJvcCBleHRyYSBzcGFjZSBmcm9tIGxhc3QgaXRlcmF0aW9uIGFib3ZlICovDQo+IMKg
wqAJCXJldC0tOw0KPiArCWVsc2UNCj4gKwkJcmV0ICs9IHN5c2ZzX2VtaXRfYXQoYnVmZiwgcmV0
LCAibm9uZSIpOw0KPiDCoCANCj4gwqDCoAlyZXQgKz0gc3lzZnNfZW1pdF9hdChidWZmLCByZXQs
ICJcbiIpOw0KPiDCoCANCj4gQEAgLTE2Miw3ICsxNjQsNyBAQCBzdGF0aWMgc3NpemVfdCBzdGF0
dXNfcmVhc29uc19zaG93KHN0cnVjdCBrb2JqZWN0DQo+ICprb2JqLA0KPiDCoMKgCQkubWFzayA9
IF9tYXNrLAkJCQkJXA0KPiDCoMKgCX0NCj4gwqAgDQo+IC1zdGF0aWMgVEhST1RUTEVfQVRUUl9S
T19GVU5DKHN0YXR1c19yZWFzb25zLCAwLA0KPiBzdGF0dXNfcmVhc29uc19zaG93KTsNCj4gK3N0
YXRpYyBUSFJPVFRMRV9BVFRSX1JPX0ZVTkMocmVhc29ucywgMCwgcmVhc29uc19zaG93KTsNCj4g
wqAgc3RhdGljIFRIUk9UVExFX0FUVFJfUk8oc3RhdHVzLCBVMzJfTUFYKTsNCj4gwqAgc3RhdGlj
IFRIUk9UVExFX0FUVFJfUk8ocmVhc29uX3BsMSwgUE9XRVJfTElNSVRfMV9NQVNLKTsNCj4gwqAg
c3RhdGljIFRIUk9UVExFX0FUVFJfUk8ocmVhc29uX3BsMiwgUE9XRVJfTElNSVRfMl9NQVNLKTsN
Cj4gQEAgLTE3NCw3ICsxNzYsNyBAQCBzdGF0aWMgVEhST1RUTEVfQVRUUl9STyhyZWFzb25fdnJf
dGhlcm1hbGVydCwNCj4gVlJfVEhFUk1BTEVSVF9NQVNLKTsNCj4gwqAgc3RhdGljIFRIUk9UVExF
X0FUVFJfUk8ocmVhc29uX3ZyX3RkYywgVlJfVERDX01BU0spOw0KPiDCoCANCj4gwqAgc3RhdGlj
IHN0cnVjdCBhdHRyaWJ1dGUgKnRocm90dGxlX2F0dHJzW10gPSB7DQo+IC0JJmF0dHJfc3RhdHVz
X3JlYXNvbnMuYXR0ci5hdHRyLA0KPiArCSZhdHRyX3JlYXNvbnMuYXR0ci5hdHRyLA0KPiDCoMKg
CSZhdHRyX3N0YXR1cy5hdHRyLmF0dHIsDQo+IMKgwqAJJmF0dHJfcmVhc29uX3BsMS5hdHRyLmF0
dHIsDQo+IMKgwqAJJmF0dHJfcmVhc29uX3BsMi5hdHRyLmF0dHIsDQo+IEBAIC0yMDAsNyArMjAy
LDcgQEAgc3RhdGljIFRIUk9UVExFX0FUVFJfUk8ocmVhc29uX3BzeXNfY3JpdCwNCj4gUFNZU19D
UklUX01BU0spOw0KPiDCoCANCj4gwqAgc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKmNyaV90aHJv
dHRsZV9hdHRyc1tdID0gew0KPiDCoMKgCS8qIENvbW1vbiAqLw0KPiAtCSZhdHRyX3N0YXR1c19y
ZWFzb25zLmF0dHIuYXR0ciwNCj4gKwkmYXR0cl9yZWFzb25zLmF0dHIuYXR0ciwNCj4gwqDCoAkm
YXR0cl9zdGF0dXMuYXR0ci5hdHRyLA0KPiDCoMKgCSZhdHRyX3JlYXNvbl9wbDEuYXR0ci5hdHRy
LA0KPiDCoMKgCSZhdHRyX3JlYXNvbl9wbDIuYXR0ci5hdHRyLA0KDQp3b3JrcyBmb3IgbWUuIGNv
dW50IG9uIG15IHJ2LWIuDQoNCnVubGVzcyBSYWFnIGhhcyBhbnkgZnVydGhlciBjb25jZXJuLi4u
DQoNCj4gDQo+IEx1Y2FzIERlIE1hcmNoaQ0KPiANCj4gPiANCj4gPiBQUzogQSBnb29kIHJlYWRb
MV0gaWYgYW55b25lJ3MgaW50ZXJlc3RlZC4NCj4gPiANCj4gPiBbMV0gaHR0cHM6Ly9sd24ubmV0
L0FydGljbGVzLzM3ODg4NC8NCj4gPiANCj4gPiBSYWFnDQo=
