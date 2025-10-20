Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C723CCD19F
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 22:07:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2AE10E079;
	Mon, 20 Oct 2025 22:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MqHPxeU6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7835110E079
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 22:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760998076; x=1792534076;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XbHc+qcXsvCuWIhlmCVw8mDBKFi/mlLoXmLihkoXm8s=;
 b=MqHPxeU6K5db2GhSX1vvzv2IPyC8E57ad23mGAqzg5hmFglzdrKjsWeI
 Vv8polLkJ8lWEjVhMYeVzDeMyay22L2C3/cOyIEBlDbgTucgyvYOMNZE9
 9ZnrgLmVak1D1TVtZKH2HnEX4qmhAfNMRuhW3HB1imYrWdGUi/gyxou8R
 cE1OyYyDDJXRtrOwOFx2sctf5ZEJ448yeDnYc4sKh+S1GHdbOZ/B5FCTU
 6CibJT61mjhAp9Ju80NklPwwF4ZeZCKjV+iC8S56DQRb5ivSvaObD9zra
 1DFuJ3KRrY2FpsfR+qJaZO/gEaj4edfQWnz5EjqyGpslDet8KXIQGBrON w==;
X-CSE-ConnectionGUID: FL6kA3M+SfW7zeKv3pMONQ==
X-CSE-MsgGUID: WsdTq8FqS/WhM9oqqTiJeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62330592"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="62330592"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 15:07:56 -0700
X-CSE-ConnectionGUID: mSn2owIVTAW2zSE/m/XUxA==
X-CSE-MsgGUID: Vu/JBGAEQgCZEfImDRcl7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="182583581"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 15:07:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 15:07:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 15:07:55 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.36) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 15:07:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lVcfG2S32dbMcX2FFNYHVsAOwznX7zJkJzQipwMrhCJRpCu1Ig9SUHSSj9nIXQh4QQ5BTfD2x925S1F/pnmOnPcJHgo9qc4vTnenQvVsrAZ4yo0jOK0PDcPbmly8bcJ+mmyivABSS2LaxViG2Qkggp8M++/W6Gna2WjZFlYOVW+ujEs7BjrhnPYpf8EOwn/7n/3eI8qiBGUEN9lrwXT+9MbwfeRdcwl9NoXvrJMQFExE3rPUljeiB3xUaHYQugAZgu3rFwiYKgwDzlQor3kpwCUvK5SHEdzzFXgVjvxdvbqaHE2xzRb4YPRP0ikNYSRitHVVkzFrg7OHKwDA2gxX1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbHc+qcXsvCuWIhlmCVw8mDBKFi/mlLoXmLihkoXm8s=;
 b=qwAZSNmrqH0yfDsal7pmifnpN6Y6sn9quk/HTLgHtcNhLjg+DywcuHoSSuyeBIqWdVdJaJNHvaeS6fYD0h2dlUhAx9HkbZpVx+5PVstbnv0ETeijSbRYX6o1hMo+aNeMH3opywHxyM7sJsMclH6NnQjTeun7ZGfNL1lIiUi7DQfSn8P5+xjmNLblUg8uY0jvtGNDMaaj3GdrLVkkvOxrtxoSfNuOVWSs4S4SLfYRjapbITqMOEM21d8FsL/s3DO3KlyVlDsFO/8ZBGVm9bkLyIulbFoCOpYo6s69fJCtWUWkUv7IMbxUNRskzUCL/Vrn3jy7I8dXTU8d28ZiamxJBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SJ2PR11MB8401.namprd11.prod.outlook.com (2603:10b6:a03:539::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Mon, 20 Oct
 2025 22:07:53 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9228.016; Mon, 20 Oct 2025
 22:07:53 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Dong, 
 Zhanjun" <zhanjun.dong@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 7/7] drm/xe/doc: Add GuC submission kernel-doc
Thread-Topic: [PATCH 7/7] drm/xe/doc: Add GuC submission kernel-doc
Thread-Index: AQHcQgrpkAPf9IYOREi80B7nHy4AnbTLlyIAgAAAvIA=
Date: Mon, 20 Oct 2025 22:07:53 +0000
Message-ID: <18ad859ba4534dc71a46c19afd9f0ddebfd548de.camel@intel.com>
References: <20251020214529.354365-1-stuart.summers@intel.com>
 <20251020214529.354365-8-stuart.summers@intel.com>
 <aPayGrFBqHV/J5zP@lstrano-desk.jf.intel.com>
In-Reply-To: <aPayGrFBqHV/J5zP@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SJ2PR11MB8401:EE_
x-ms-office365-filtering-correlation-id: f35b5c7d-a634-47f7-804d-08de10251df1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?eGZhR0VEdVpaUGZzUTFuYzJxT0NXTlA5TklBaUxuOUhIRGlwVkxiWnBZWEo2?=
 =?utf-8?B?L3hzM2xnNkJkcWxQR2hkSk1TMmZwazBhZktVQXdOZEJyWXdsS3V5N0Z3b3pR?=
 =?utf-8?B?N0F3em9tUTdkRVhEL1I2STNNekhMY1R2Z2RZN1Y3V0xYWUl4KzhRSkdiM3ZJ?=
 =?utf-8?B?ZEZDa1dMcDBXT3BQWjJ1M3FGTDJBamIrSVVIQXd2S0FSSGtiRnptN1BJUkZ2?=
 =?utf-8?B?Z1BOL0RsSGNvclBNZitMa3FqOVdhK0ZUUmRNMjdtWTN3TDcxQ2c3WW5mV3h6?=
 =?utf-8?B?dVNneHhGR3pEWTNvOFpCY0YxZnozbkFUSXNqL3FhcHR6VVNrTVk1QW1IQnlR?=
 =?utf-8?B?djVqK1FsQTI4NTdUbURzbFk0WktpSXdNL2tMWEhVSVJkVnZ5aThkZUZiejhD?=
 =?utf-8?B?L0VYUlM0QkhuUThpY0YyNzQ4SWdPVm1EQXdWV3VPU2s2MVN3RjNmY0phbHph?=
 =?utf-8?B?RU5seHFUMjZrZnIrNW4wKzl6cm11Nzl4T2lobkZVWFFoaHFtcFVFNXAvUTdL?=
 =?utf-8?B?cmZNMm0vVFdvOUhRakZxMnZKSHhjNjE5QVprZ0R1ejEvc2JYUG9rbTdncExj?=
 =?utf-8?B?N2wwTmhuTWdOYXFxcWNseXlzYUV3Mm5PUzcwWUV0S1ZpU0hwQkswQkFaUXhR?=
 =?utf-8?B?cC8yKzczWUdKb3hycUJmemxYWmpvOXpiejVDSFIxeUZPck9LTkwwT2Y0eDJV?=
 =?utf-8?B?ZXZnZFpBMXhPd05PRTlTR09IaEFyQTJ4cnIwUVBUSHBnTzJCM2VXSlNoNjVy?=
 =?utf-8?B?SVZPMHRiTjI3Y3Yrb1RQcEFmdEVjV1pNOGM0N1Iwdi9vV0JWZDBXbEFEM0pG?=
 =?utf-8?B?WkZ2a24rVUtGbjZRQW44UWJ1RDltWEJ4MnRFT1E5d1BCZURyMEN4V2Z1Q2xO?=
 =?utf-8?B?Rmg3VTRTdzdoTy9zMytzb2d1WTRjMis5ZE84UThaLzVzbUluZjIzZ2lWbGlz?=
 =?utf-8?B?aVMxWXZCN25TYWphQUVadCtOOEJoQkUwdXdQckJUcDdRdUM2MTNPZWg3VkJh?=
 =?utf-8?B?SVFOdGtrV0J2d1BhcHN3MzlkR0U1Zjk5QmFnVnpLa2xEdGVjRUdQbGpyTzY0?=
 =?utf-8?B?MEpNMWJZODBOaFpzOThJSnE2b3JLNHFRQWpZb0ZlLzduYTI4ZFQ0cGtMRnd3?=
 =?utf-8?B?VHVPYnJyOW9LdWs2b2E3cUxvTWlNSjZ0Y1VNcTd5bS9tNXRCNFdPd1NNK3Br?=
 =?utf-8?B?VW1hM2dkRUE1eFgwcjR2d3dtUlprcmdGVnVqcGFQeElYL1ppQ0o5Z282WjVh?=
 =?utf-8?B?NFFGblBBcU11a2owNVE0SWNyb2JsOU1paDZuQXduODdaSWlISytaS0MxWE5H?=
 =?utf-8?B?S3ZCRmZuRjdYK1VRVTdGTWtXY0FtTWFKL3RkNUdvVXovWnBaMHBBbklCTXhn?=
 =?utf-8?B?RTU5SWJCZzVxZjRiVEZ4QzFvRS9aSWMxeTd4MnFKdWxnR2JJMSt0TXArRSs3?=
 =?utf-8?B?TnBjQ0QrVmEzQUoxQUVNZk80U0hHSEFtWkV6eFVJQU5lazBCN2FzamVqSlJr?=
 =?utf-8?B?VUg0Znp6WGMzUWtMQzVqMWZhK3FIL2hvL0IrUGhZZy9Ea3UvTVdSNmlKOFNY?=
 =?utf-8?B?YzVwQ21SMXUvY1paRjBiaTlvVVE2YVhmVmNmNW9CNlN3ZmdObXdiU2xCUzhZ?=
 =?utf-8?B?cXk1U2I5WWVGNnQ0NEhyR1lnMXpMbTlhZ0ovNjZwc2lCRW42aGp2QS9hWUVV?=
 =?utf-8?B?T1FaTjdaS1FqeG5Jbngwa09XWDArOUVhT1JhRDlYeWdKWCtwdEJFQ3RreGNx?=
 =?utf-8?B?dmo0eU15N0ZYUkEyK01iNXVpUU1tS2tFQVBNeTlJT1prOEJ3OTVQYjFIcEpQ?=
 =?utf-8?B?T0hzUEtHVlNvRlpneHRORmJ0elVhMEVvQ25KUE02RFdtck1GTHEwZkgxb2Mw?=
 =?utf-8?B?Y3NXMWRFZFdVU0l0R0VIQ3FYMS95amwxZTFxaU5LdmY2cmxBem9SWURVY0Zk?=
 =?utf-8?B?TEJvSVBVemNnc0ljN05vODJzSlZvVm1ZeUJaWFVySkJvV3I2V1l5NEF0TTNE?=
 =?utf-8?B?Nk5GeDNLODRRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXZMdEhuTk5kUHBab2FocjQrZGRNLzJKcGRZOXNjK1Z3S2E2b1piL2dwaSsy?=
 =?utf-8?B?MVV2UnRuSGFuNHArc2dZL0s0WU1kSXlmeDIxSEJzNEpuWU1KcnhKUnByYWtC?=
 =?utf-8?B?MmE5eENGZ0ZRQXRPelcrVzZLK0ZFYTFud3dZdTBrVmFnU3VBcFo4K2hTRWF2?=
 =?utf-8?B?K1ZhWnJKQktlRTlxQlUzV3hBbWdmdmZpWDJuTkdkRDI0amJ1Q2xDRzBNVzRP?=
 =?utf-8?B?Yjh4K1NDVGlNdUEyQjdyVWhCT1VaSnc0RzFKdmV3NDU0MGptSlhPMjFhOFJw?=
 =?utf-8?B?eDJySktyYWZrTS9LMGE5YVdnc1pnZTE0ZFUrTnRRQ1RrT0NobkNNNU8rdGtp?=
 =?utf-8?B?b2p2VEFKcE03NkJVNy9Gb3B1b3B0U3hEZFEwcTJkenlYckRGa2ZFOGZranlW?=
 =?utf-8?B?N3F0RklwSE5waUQ5N2l2Q0NENnlFZDlXY3BRSWRFQU9YNWpmcUxFRHBCb3Rj?=
 =?utf-8?B?d0RsVFpiSkV6UmJ6ZGRoWERCR21WbnQ5ODFURGNGMXRXZlorSlh0clVXblBF?=
 =?utf-8?B?akNvSU1sNXozYXZkRFdhMGFGNDVjVU9NWmFIUDF0YlJBemxsTW1mc3lIamI1?=
 =?utf-8?B?c0d1dGpmcmsySUkvSjYvSHFiRmFNSml0bCtPWldEeStKS3VwcTMxUFNHVjRG?=
 =?utf-8?B?SlJHS0ZqNmZjN3FtUGwxdXN0cmRjZHJ6Z0tjazJFdFg2Sy9WRHJzWUFtZk44?=
 =?utf-8?B?a2ZIcitTaEdBb1dKbnJtS1lDMDRUWEYwMDNIbnlvYjMyT3JtNmtaR1dUYnNK?=
 =?utf-8?B?UGYxazhmNjRqRVljbjNtcWJWczJtU2daVHRlNDlMVDAyaElaRkozZWR6OEdy?=
 =?utf-8?B?R1FwcE5adk52NFYvOVg4ZFBTeTBaUU9jclRwSkhxeVNWMEo3cjZJOU02Ry8r?=
 =?utf-8?B?emhTUHNwSWsyY1JnUExTM3BVZEdtMlJMVG5tcGV2TWtiTHFBdXc4Q3hNSjhy?=
 =?utf-8?B?dW1xa2dwUnJ5ejBIa21pSk44SUw1RmdRajdYdU82aEhxTmorS3VxQTBMSFBw?=
 =?utf-8?B?b25nQWRsY0VpUFk4QWcwbm1KZHJJYTVGRHpEbk1GcEpTNU5wZmsweXpiWVdD?=
 =?utf-8?B?eCtvMUVFaE4yZlpQTW05WENzVU1WczhuclNmWWU1cjRaNTVTVXZVMW5zOEhr?=
 =?utf-8?B?bVZ0Y3lYSDBwSGV6MjBHd29teUF2WC9ZWEF2R1FCaVlXVGdZYS9TdmF2Mmgv?=
 =?utf-8?B?UnJsRXdlTDhkRy9ORTRzR2tTdWlZWDdXZ2d4cmUxSDA1c3N2UVNmM2RYb1lN?=
 =?utf-8?B?T05xRTNQTTJZdVRGdlQvQ0hvTTBJRE5zMlpiU2xEbUd5cUc5UHNBRFFYdSt4?=
 =?utf-8?B?bHF0eE8rZE83ejM5bEk3aTc0N0xWT3cxSkpYd3hEVTFNbEJ2MUhWVGVyd1RY?=
 =?utf-8?B?ZnRpWjhaSTJBU2FCVnlHam1NOHQ0NSt2L0t4MTBIa2dySlhzeGV0YjBXSEc4?=
 =?utf-8?B?RG4zSTNvZ2N6QlFIb3lyMjJPak9oc1oxOTBwVzZoeXArTTVhcmgvb20rRVMy?=
 =?utf-8?B?RlVnTHlXYy82WVd3dWx1Ti95Wi9mTVh6bkp0NldocWxOR0FZckQ1U2lCWUFt?=
 =?utf-8?B?NEFoM2htYlZwQldUa1hNRG50bnpRc2JzSjcrUVpwSFM4SmlQYWtVRmczTFB5?=
 =?utf-8?B?T3VoSWtwNnVjdms1T2hjNE5iWDFrbHIrSXhzVjhkUVZTNHNxd2pXWW1IbWYv?=
 =?utf-8?B?N2lNVG1hbnNzZGRlcGFkRzM0OFpZSm1mSS95bTFlZThjdEFMMEI3elFyYURM?=
 =?utf-8?B?V1RpRURwajZMeDVSWTdmSlRGdkpVK1hEVkJleDZ1V0l2NnJzdnZ6Z1BtNVZ1?=
 =?utf-8?B?VUtwTEVyT0xvVzFOTGpVNUJSMkM1MnMwMThFT3BiTi9SNk9sSWhvekFaQ05M?=
 =?utf-8?B?VnFCeVdTQXIvTmdhUXRKMEZOM0kzTFJ3M3FwTVp0M2FtTU9zM283VDJadlFo?=
 =?utf-8?B?M1NzK1pKMDlPVmRLelRzMUhXYkZ2RXVObWMvMU1XQ0Fac01nRTJ4bVFZTElK?=
 =?utf-8?B?N28vNzByNWFZSHk4WWpsenhsS1ZDelY4UnRqTW81dUU3a29lbldXaWZvVERy?=
 =?utf-8?B?TVJSaGl4NnF0ZEFVYUx3MkIrVTVrRjE0bHg0Y2VpakJZNFVxVEN0K3daSjhj?=
 =?utf-8?B?MFFqYkdxVGk3Tks2WFBvN0N6NWRJOGxLYk9tMmhqVnZTZkh1cERWdHBCSEZx?=
 =?utf-8?B?cmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD151207C1F96B4AA0A56DA548B2AE80@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f35b5c7d-a634-47f7-804d-08de10251df1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2025 22:07:53.5028 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CsTVQuUMVj5pI1K6vo/MCx974sXoXArvYd4OUKrPzAISfPQFyJLREpHBqYgNLG13GrbCAETJTJSWQlCqODqHdkOQ8SDs7ffC/XSHKHeqZrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8401
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

T24gTW9uLCAyMDI1LTEwLTIwIGF0IDE1OjA1IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBNb24sIE9jdCAyMCwgMjAyNSBhdCAwOTo0NToyOVBNICswMDAwLCBTdHVhcnQgU3VtbWVy
cyB3cm90ZToNCj4gPiBBZGQgc29tZSBkb2N1bWVudGF0aW9uIGZvciB0aGUgZGlmZmVyZW50IHJv
bGVzIHBsYXllZCBieSB0aGUgWGVLTUQNCj4gPiBpbiBjb21tdW5pY2F0aW9uIHdpdGggdGhlIEd1
QyB0aHJvdWdoIGV4ZWMgcXVldWUgbWFuYWdlbWVudCBhbmQNCj4gPiB0aGUgRFJNIHNjaGVkdWxl
ci4NCj4gPiANCj4gDQo+IEkndmUgd3JpdHRlbiBmYWlybHkgZGV0YWlsZWQgR3VDIHN1Ym1pc3Np
b24gZG9jdW1lbnRhdGlvbiBidXQgaXQNCj4gc3R1Y2sNCj4gaW4gcmV2aWV3IHB1cmdhdG9yeS4g
SGVyZSBpcyB0aGUgbW9zdCByZWNlbnQgcG9zdCBbMV0uDQoNCk9oIGV4Y2VsbGVudCBJIGhhZG4n
dCByZWFsaXplZCB0aGlzIHdhcyBwYXJ0IG9mIHRoYXQgc2VyaWVzLiBIYXBweSB0bw0KZHJvcCBt
aW5lLi4uIEknbGwgYWxzbyB0YWtlIGEgbG9vayBhdCB5b3VyIHBhdGNoLg0KDQpUaGFua3MsDQpT
dHVhcnQNCg0KPiANCj4gTWF0dA0KPiANCj4gWzFdDQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVk
ZXNrdG9wLm9yZy9wYXRjaC82Nzc5ODAvP3Nlcmllcz0xNTQ2MjcmcmV2PTTCoA0KPiANCj4gPiBT
aWduZWQtb2ZmLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0K
PiA+IC0tLQ0KPiA+IMKgRG9jdW1lbnRhdGlvbi9ncHUveGUvaW5kZXgucnN0wqDCoMKgwqDCoMKg
wqDCoCB8wqAgMSArDQo+ID4gwqBEb2N1bWVudGF0aW9uL2dwdS94ZS94ZV9ndWNfc3VibWl0LnJz
dCB8wqAgOCArKysNCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmPCoMKg
wqDCoCB8IDcwDQo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiDCoDMgZmlsZXMg
Y2hhbmdlZCwgNzkgaW5zZXJ0aW9ucygrKQ0KPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3Vt
ZW50YXRpb24vZ3B1L3hlL3hlX2d1Y19zdWJtaXQucnN0DQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZ3B1L3hlL2luZGV4LnJzdA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9ncHUv
eGUvaW5kZXgucnN0DQo+ID4gaW5kZXggYmM0MzJjOTVkMWEzLi4wMzAyNjhkZGJhODcgMTAwNjQ0
DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9ncHUveGUvaW5kZXgucnN0DQo+ID4gKysrIGIvRG9j
dW1lbnRhdGlvbi9ncHUveGUvaW5kZXgucnN0DQo+ID4gQEAgLTE1LDYgKzE1LDcgQEAgREcyLCBl
dGMgaXMgcHJvdmlkZWQgdG8gcHJvdG90eXBlIHRoZSBkcml2ZXIuDQo+ID4gwqDCoMKgIHhlX21h
cA0KPiA+IMKgwqDCoCB4ZV9taWdyYXRlDQo+ID4gwqDCoMKgIHhlX2V4ZWNfcXVldWUNCj4gPiAr
wqDCoCB4ZV9ndWNfc3VibWl0DQo+ID4gwqDCoMKgIHhlX2NzDQo+ID4gwqDCoMKgIHhlX3BtDQo+
ID4gwqDCoMKgIHhlX2d0X2ZyZXENCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9ncHUv
eGUveGVfZ3VjX3N1Ym1pdC5yc3QNCj4gPiBiL0RvY3VtZW50YXRpb24vZ3B1L3hlL3hlX2d1Y19z
dWJtaXQucnN0DQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAw
MDAuLmE4MmI1ZDU3ZWU2YQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0
aW9uL2dwdS94ZS94ZV9ndWNfc3VibWl0LnJzdA0KPiA+IEBAIC0wLDAgKzEsOCBAQA0KPiA+ICsu
LiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjArIE9SIE1JVCkNCj4gPiArDQo+ID4g
Kz09PT09PT09PT09PT09DQo+ID4gK0d1QyBTdWJtaXNzaW9uDQo+ID4gKz09PT09PT09PT09PT09
DQo+ID4gKw0KPiA+ICsuLiBrZXJuZWwtZG9jOjogZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19z
dWJtaXQuYw0KPiA+ICvCoMKgIDpkb2M6IEd1QyBTdWJtaXNzaW9uDQo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gPiBpbmRleCBhMTFhZTRlNzA4MDkuLmZkMDVmNzNjZDk2
YiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiA+IEBAIC00Niw2
ICs0Niw3NiBAQA0KPiA+IMKgI2luY2x1ZGUgInhlX3RyYWNlLmgiDQo+ID4gwqAjaW5jbHVkZSAi
eGVfdm0uaCINCj4gPiDCoA0KPiA+ICsvKioNCj4gPiArICogRE9DOiBHdUMgU3VibWlzc2lvbg0K
PiA+ICsgKg0KPiA+ICsgKiBUaGUgcHJpbWFyeSBzdWJtaXNzaW9uIHZlaGljbGUgZm9yIHRoZSBY
ZUtNRCBpcyB0aGUgR3VDDQo+ID4gZmlybXdhcmUuDQo+ID4gKyAqIFRoaXMgaW5jbHVkZXMgY3Jl
YXRpbmcsIHJlZ2lzdGVyaW5nLCBhbmQgc3VibWl0dGluZyBleGVjIHF1ZXVlcw0KPiA+ICsgKiAo
c2VlIDpyZWY6YGV4ZWN1dGlvbi1xdWV1ZWApLiBPbmNlIHN1Ym1pdHRlZCwgYWN0dWFsIGhhcmR3
YXJlDQo+ID4gc2NoZWR1bGluZw0KPiA+ICsgKiBpcyBoYW5kbGVkIGZ1bGx5IGJ5IHRoZSBHdUMu
DQo+ID4gKyAqDQo+ID4gKyAqIFRvIGZhY2lsaXRhdGUgdGhlc2Ugb3BlcmF0aW9ucywgWGVLTUQg
bWFrZXMgdXNlIG9mIHRoZSBEUk0NCj4gPiBzY2hlZHVsZXINCj4gPiArICogdG8gaGFuZGxlIHN0
YXRlIGNoYW5nZXMgYW5kIGRldGVybWluZSB3aGVuIGpvYnMgc2hvdWxkIGJlDQo+ID4gc2NoZWR1
bGVkDQo+ID4gKyAqIHdpdGggdGhlIEd1Qy4NCj4gPiArICoNCj4gPiArICogUXVldWUgUmVnaXN0
cmF0aW9uDQo+ID4gKyAqID09PT09PT09PT09PT09PT09PQ0KPiA+ICsgKg0KPiA+ICsgKiBSZWdp
c3RyYXRpb24gYW5kIGRlcmVnaXN0cmF0aW9uIG9mIGV4ZWMgcXVldWVzIHdpdGggdGhlIEd1Qw0K
PiA+IGludm9sdmVzDQo+ID4gKyAqIGNyZWF0aW9uIG9mIHRoZSByaW5nIChMUkMpIGZvciB0aGF0
IGNvbnRleHQuIFRoZXNlIGFyZQ0KPiA+IGFzeW5jaHJvbm91cw0KPiA+ICsgKiBhY3Rpb25zIGJ5
IHRoZSBYZUtNRCB3aGljaCBjb21wbGV0ZXMgdGhhdA0KPiA+IHJlZ2lzdHJhdGlvbi9kZXJlZ2lz
dHJhdGlvbg0KPiA+ICsgKiBwcm9jZXNzIG9uY2UgdGhlIEd1QyByZXNwb25kcyB0aGF0IHRoZSBo
YXJkd2FyZSByZWdpc3RyYXRpb24NCj4gPiBoYXMNCj4gPiArICogY29tcGxldGVkLg0KPiA+ICsg
Kg0KPiA+ICsgKiBRdWV1ZSBTdWJtaXNzaW9uDQo+ID4gKyAqID09PT09PT09PT09PT09PT0NCj4g
PiArICoNCj4gPiArICogVGhlIEd1QyBoYXMgYSBwYXJhbWV0ZXIgZm9yIGVhY2ggY29udGV4dCBp
bmRpY2F0aW5nIHdoZXRoZXINCj4gPiB0aGF0DQo+ID4gKyAqIGNvbnRleHQgY2FuIGJlIHNjaGVk
dWxlZCB3aXRoIHRoZSBhc3NvY2lhdGVkIGVuZ2luZS4gQWZ0ZXINCj4gPiByZWdpc3RyYXRpb24N
Cj4gPiArICogaGFzIGNvbXBsZXRlZCwgdGhlIEtNRCwgdHlwaWNhbGx5IGFzIGEgcmVhY3Rpb24g
dG8gYSByZXF1ZXN0DQo+ID4gZnJvbQ0KPiA+ICsgKiB0aGUgdXNlciBleGVjIElPQ1RMIGNhbGws
IHdpbGwgaXNzdWUgYSBzY2hlZHVsZSByZXF1ZXN0IHdpdGgNCj4gPiB0aGUNCj4gPiArICogR3VD
LiBUaGUgR3VDIHdpbGwgdGhlbiBhZGQgdGhhdCB0byBpdHMgc2NoZWR1bGUgZm9yIGNvbnRleHRz
DQo+ID4gKyAqIGFuZCB3aWxsIGluIHR1cm4gc2NoZWR1bGUgdGhpcyB3aXRoIHRoZSBjb21tYW5k
IHN0cmVhbWVyIGJhc2VkDQo+ID4gKyAqIG9uIHRpbWUgc2xpY2UgYXZhaWxhYmlsaXR5Lg0KPiA+
ICsgKg0KPiA+ICsgKiBRdWV1ZSBEZXN0cnVjdGlvbg0KPiA+ICsgKiA9PT09PT09PT09PT09PT09
PQ0KPiA+ICsgKg0KPiA+ICsgKiBBcyBtZW50aW9uZWQgYWJvdmUsIGJlZm9yZSBkZXN0cm95aW5n
IGEgcXVldWUsIGl0IG11c3QgZmlyc3QgYmUNCj4gPiArICogZGVyZWdpc3RlcmVkLiBJbiB0aGUg
dHlwaWNhbCBjYXNlLCB0aGlzIGhhcHBlbnMgZmlyc3QgYnkNCj4gPiBzZW5kaW5nDQo+ID4gKyAq
IGEgc2NoZWR1bGUgZGlzYWJsZSByZXF1ZXN0LCB0aGVuIG9uIGNvbmZpcm1hdGlvbiBmcm9tIHRo
ZSBHdUMsDQo+ID4gKyAqIGEgZGVyZWdpc3RyYXRpb24gcmVxdWVzdC4gT25seSBhZnRlciB0aGF0
IGRlcmVnaXN0cmF0aW9uDQo+ID4gcmVzcG9uc2UNCj4gPiArICogd2lsbCB0aGUgWGVLTUQgZnJl
ZSByZXNvdXJjZXMgYXNzb2NpYXRlZCB3aXRoIHRoYXQgcXVldWUgc3VjaA0KPiA+IGFzDQo+ID4g
KyAqIHRoZSBMUkMuDQo+ID4gKyAqDQo+ID4gKyAqIEVuZ2luZSBSZXNldHMNCj4gPiArICogPT09
PT09PT09PT09PQ0KPiA+ICsgKg0KPiA+ICsgKiBBbnkgdGltZSBtb3JlIHRoYW4gb25lIGNvbnRl
eHQgaXMgYmVpbmcgc2NoZWR1bGVkIGJ5IHRoZSBHdUMsDQo+ID4gdGhlIEd1Qw0KPiA+ICsgKiB3
aWxsIGdpdmUgZWFjaCBjb250ZXh0IGEgY2VydGFpbiBjb25maWd1cmFibGUgdGltZSBzbGljZS4g
SWYgYQ0KPiA+IGNvbnRleHQNCj4gPiArICogZXhjZWVkcyB0aGlzIHRpbWUgc2xpY2UsIHRoZSBH
dUMgd2lsbCByZXNldCB0aGUgZW5naW5lIGFuZA0KPiA+IG5vdGlmeSB0aGUgWGVLTUQNCj4gPiAr
ICogYWxvbmcgd2l0aCBhbiBlbmdpbmUgc3RhdGUgYXQgdGhlIHRpbWUgb2YgdGhlIHJlc2V0LiBU
aGUgWGVLTUQNCj4gPiB3aWxsIHRoZW4NCj4gPiArICogcmVzdWJtaXQgYW55IG91dHN0YW5kaW5n
IGpvYnMgdG8gdGhhdCBlbmdpbmUuIElmIGEgcGFydGljdWxhcg0KPiA+IGpvYiBoYXMgYmVlbg0K
PiA+ICsgKiByZXN1Ym1pdHRlZCBpbiB0aGlzIHdheSBtb3JlIHRoYW4gb25jZSwgdGhlIGFzc29j
aWF0ZWQgZXhlYw0KPiA+IHF1ZXVlIHdpbGwgYmUNCj4gPiArICogbWFya2VkIGJhbm5lZCBhbmQg
d2lsbCBubyBsb25nZXIgYmUgc2NoZWR1bGFibGUgb24gdGhhdCBlbmdpbmUuDQo+ID4gKyAqDQo+
ID4gKyAqIFF1ZXVlIFdlZGdpbmcNCj4gPiArICogPT09PT09PT09PT09PQ0KPiA+ICsgKg0KPiA+
ICsgKiBPbiBkZXZpY2Ugd2VkZ2luZyAoc2VlIDpyZWY6YGRldmljZS13ZWRnaW5nYCksIGVhY2gg
ZXhlYyBxdWV1ZQ0KPiA+IGlzIGFsc28gbWFya2VkDQo+ID4gKyAqIGFzIHdlZGdlZC4gVGhpcyBp
bmNsdWRlcyB0YWtpbmcgYSByZWZlcmVuY2UgdG8gdGhhdCBkZXZpY2UgYW5kDQo+ID4gYWRkaW5n
IGENCj4gPiArICogZGVyZWZlcmVuY2Ugb24gZHJpdmVyIHRlYXJkb3duLiBUaGlzIGFkZGl0aW9u
YWwgcmVmZXJlbmNlDQo+ID4gYWxsb3dzIGEgdXNlcg0KPiA+ICsgKiB0byBjb2xsZWN0IGNlcnRh
aW4gZGVidWcgaW5mb3JtYXRpb24gYWJvdXQgdGhlIGV4ZWMgcXVldWUgcHJpb3INCj4gPiB0byBk
cml2ZXINCj4gPiArICogdW5iaW5kLg0KPiA+ICsgKg0KPiA+ICsgKiBUaGVyZSBhcmUgc29tZSBp
bnN0YW5jZXMgd2hlcmUgdGhlIGRldmljZSB3ZWRnZSBtaWdodCBub3QgdGFrZQ0KPiA+IGEgcmVm
ZXJlbmNlDQo+ID4gKyAqIGluIHRoaXMgd2F5LCBmb3IgaW5zdGFuY2UsIGlmIHRoZSBjb250ZXh0
IGlzIGluIHRoZSBwcm9jZXNzIG9mDQo+ID4gYmVpbmcNCj4gPiArICogZGVyZWdpc3RlcmVkIHdp
dGggdGhlIEd1QyBhdCB0aGUgdGltZSBvZiB0aGUgd2VkZ2UuIEluIHRoaXMNCj4gPiBjYXNlLCBh
DQo+ID4gKyAqIHJlZmVyZW5jZSB0byB0aGF0IGV4ZWMgcXVldWUgc2hvdWxkIGFscmVhZHkgYmUg
YXZhaWxhYmxlIGFuZA0KPiA+IGFueQ0KPiA+ICsgKiBhc3NvY2lhdGVkIGRhdGEgc3RydWN0dXJl
cyB3aWxsIGJlIGNsZWFuZWQgdXAgbGF0ZXIgaW4gdGhlDQo+ID4gdGVhcmRvd24NCj4gPiArICog
c2VxdWVuY2UuDQo+ID4gKyAqLw0KPiA+ICsNCj4gPiDCoHN0YXRpYyBzdHJ1Y3QgeGVfZ3VjICoN
Cj4gPiDCoGV4ZWNfcXVldWVfdG9fZ3VjKHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpxKQ0KPiA+IMKg
ew0KPiA+IC0tIA0KPiA+IDIuMzQuMQ0KPiA+IA0KDQo=
