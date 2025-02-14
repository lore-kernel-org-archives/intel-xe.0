Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C44C02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 19:14:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B33110E079;
	Fri, 14 Feb 2025 19:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GdKSsG/j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B99D10E079
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 19:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739560492; x=1771096492;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=VzmUPHvbc4LY7xNDPG7EU9nY9nWjw7/mwqR2On1JcCs=;
 b=GdKSsG/jvwqxP0Q+LUK8Ics7plPhVkPUPi5JJxEoLVaNfOwVuHNlO8rn
 a/1dbPBO5Pa/z0lEVe89u87aFVC37k0FUU+hn4K8xxMrJVzlW2Z20J+GK
 3IpTbtL8IR491ZP+Vx9PTDI/FdBBVSPcBFHYT/GnmFLBmNCAsTAR/slqO
 rDjwoBLctRlnDjyWB/i9hgjLtMtoPjkfbUC+LNvQbyVPOSlaHZHWQLwhk
 UOaWlZWui5MLMGC28FeIDQQGuG2I0EZkGb1gxfStCP8ng/fqW+7fugiBx
 /ZOa+HaJKQnOilCZYF8eOUBgo9iUBsWnl/w0uXe5DYU59cR+Cjx6/g4dL g==;
X-CSE-ConnectionGUID: lDdYiujrSreZz0jsOFEVHQ==
X-CSE-MsgGUID: CrxtjFwqS3u150BQ6SQV2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40190727"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="40190727"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 11:14:52 -0800
X-CSE-ConnectionGUID: I7Z6RDOFT8KOhEctsTgTHQ==
X-CSE-MsgGUID: nPilJa39S+mICHBeno0QJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="113732141"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 11:14:51 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 11:14:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 14 Feb 2025 11:14:50 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 11:14:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l2TDw/i6KWL9A+VcmLsQ2/dXC0S+NUDm72YRndpvvzAcAA8+G5Loo9yGJ+uAMFNN9ICZ9BXhduZxV+ahy76fxUqsx8noid6qnDKxGR6mOn6gxxvhvH0Kp6WpMygkaAQ3HYEJ87vYxybk+MQ2rflicJeRAshJiFG1pu8cEqYRpWUTI2n6xlzdYuJxsRWTp8J188q/CUmFaUWnlIv7g6lOKspTtHnzBCdmEeIp75JPdwu2sgd2/JIYJ+hCf6yGmCre1JKFk68jrWqGn2ybSSbo35lmeIPHRAZeqcCGiSiLWIt08X4q4ykt9luAkFU4RfQ521kNFf4N+BUFkBS+tYWt3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzmUPHvbc4LY7xNDPG7EU9nY9nWjw7/mwqR2On1JcCs=;
 b=IMN4DHl0ysrmBwJ8zfBI2YJPvlpFDwmoMgt5Gr2cib/vlku6Vm/o7IV4bD2YXIG/NfU3Ic4hYlgTrZYmxMlzW6SmD27MKNrmC+cDpmbCqLMGFEoK8XR9pmDHrkIe3bJgZBOOLV+iQUZDnG7/i1a8btjiwS/YLXBFldUvdAM9HJ3sVjFKBh9i+WY85XLaBbGrd0OUgP1hH4OZPy6MZPyiBk6FDlFaaNPbtcOgOinL908NMtBtR+wdC2N3MC9KbAL2IBazJEdPt4rdn6Y6ek+cZtSYwegtvxR0i2xv1pT51Fkjdcjgbv4TVuh+xMgk8TgEAYRNSYLX+DiFzUdolmbdUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 IA0PR11MB7837.namprd11.prod.outlook.com (2603:10b6:208:406::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.13; Fri, 14 Feb 2025 19:14:47 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%5]) with mapi id 15.20.8445.016; Fri, 14 Feb 2025
 19:14:47 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: =?utf-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBNYWludGVuZW5jZSBv?=
 =?utf-8?Q?f_devcoredump_<->_GuC-Err-Capture_plumbing?=
Thread-Topic: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm9yIE1haW50ZW5lbmNlIG9mIGRl?=
 =?utf-8?Q?vcoredump_<->_GuC-Err-Capture_plumbing?=
Thread-Index: AQHbfv9715xXs87yYEmsTC4DBTY4UbNHK2kA
Date: Fri, 14 Feb 2025 19:14:46 +0000
Message-ID: <99103b67992b1c2535a19113e5c2b68e09ee0e61.camel@intel.com>
References: <20250213195139.3396082-1-alan.previn.teres.alexis@intel.com>
 <173955134548.2097017.1128469714777423600@b555e5b46a47>
In-Reply-To: <173955134548.2097017.1128469714777423600@b555e5b46a47>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|IA0PR11MB7837:EE_
x-ms-office365-filtering-correlation-id: 3f0937a0-c3f8-4441-962a-08dd4d2bd89e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WS9peTljb05odktHUVhwU1kxMGlSMnMvUk10eEFBY0dUd3VHcldEUXZmcEFY?=
 =?utf-8?B?QTAvZ2xFczNMaFdkcDlBUFVuRFAwMjJkakJVZkYxcGtpeXJaVFZuRE1NUG1k?=
 =?utf-8?B?dWkwSnRTbllCVExubzNpSm5DczIwa2FJZUFLN2NSZ0ZMM0FxOHJTRUsxcVdh?=
 =?utf-8?B?b2JZK0VnNWF0bklpcEkvbmJKTUlQTWN4aVJoNTFvNDUwb0NhR1JGOVc2UUZF?=
 =?utf-8?B?aXU3c2I5VnlkZ1I0cDRBeU5ENm1nMGdTTmdyMDQ0WHNIaXMrRWordXBqTVZw?=
 =?utf-8?B?ZkdmcDJTZWtnd3dBZWoxZjJjVU10aGFpSVozTFI4ZDViZFJ5T1R0ZDh6Z1ZU?=
 =?utf-8?B?RjlPUU5DSWI5ajRyeUh5TnJkMnN0QTlwcUJxVGNuc1NkaDl0NzVCVlh6RFI3?=
 =?utf-8?B?b2gycEhpaFUzZ3ZabDN3Y1I0aDNsWkF5R0ZsSFluT3poWlBDRDl6YzdrYmFo?=
 =?utf-8?B?S2M0Zk0rM1g0VU1xQ2lHNG12b1ZmcWF3NzNVYjk2V1lOWUhSWVBNQm10aTJX?=
 =?utf-8?B?eGF1S2YxS292QmtpUEZjK0c0anRFYjkyVUhUak11dnE2bnpCL3FZYm5SL2Vr?=
 =?utf-8?B?TUdmZDNsb25IaSszUGM1enMzOWNzWHNyU2NXRFY5Zm94Kzcybm9idFhiN25Y?=
 =?utf-8?B?NnFQUHFXcExZdVhENHJST1RTN1Y5QjE2dUIrQTFObUpWR1R0MG1idmg4OHRV?=
 =?utf-8?B?cTVwdThQZXUyOVo2NHVEd1VCdFRVcHNHbmRLSll2blhMV0tBUlZlZ3VvZU9t?=
 =?utf-8?B?cTFQb01lV0dvTlFnZVlnZ1U0VXlJeklMeC9GRGNCamgxVHpEcGNubzRJTDFI?=
 =?utf-8?B?dkZob3FRTkx4YU9WSE8xWlBiYnh5NzRDdWpVZXErNFBESU01TWcyWmxSOWpF?=
 =?utf-8?B?U3FZRXB6L2pCZ2tHMXRMNk0wUnpCSGRQMkQ2emlTTXpuN1RwS1U5am5UMUo3?=
 =?utf-8?B?UURnT0ZCbkhqQmZ2d3Y0azVkNGxaT1dLckJzWVZadC9WMkhoN1dPRjZXd0xj?=
 =?utf-8?B?bk1xUHQvZXh6V2YxNE9xYUFUU2lDWGJJSElEUW5IZS9Ld040LytWN3pVZHQ2?=
 =?utf-8?B?U3BabWVkVzZPUk4zNTZLNXN1elR0bmNvdjVaQUcyOGtRMzBSOUVoMnhUZFlQ?=
 =?utf-8?B?WXNaTXptVUxORkNMVEVHM2ttVGJvUk5TT01KOFg2dGFBeE1mRmpPSys3SHky?=
 =?utf-8?B?UXZGMkZpa2Iwbi9JMXA3SjVwQnhoKzNZVnRVMzdOeUYwMkp0akY1Rmh6VG5p?=
 =?utf-8?B?OXp0UDdaejJFR0xtZDlYanB0VitPSFZzWGJ6Tnpycmp2RkkyRVlITUlkYUFV?=
 =?utf-8?B?WmUrcE1JamFHZlR4eEdtdDFkN1o2aVFBVnBzZEVHQ0lPc3dSM1BNL0l5SUJR?=
 =?utf-8?B?R1BpSFV2bmcxdExMdkJyM1h2K2tLVzRmYXcyNFlqMTh0SjNtbGJhNVVEa0I1?=
 =?utf-8?B?MHBKVzFmNFpOaDBHR3JrRE92VjVjRThhV3ZiQnhzVzIxY2phWVppL21rV3JN?=
 =?utf-8?B?NUVmMWtLb3pNRmZQcWlSVHdkcFVTWUV1c1ZSaWE4VTlRQXlTR1Q0R1NBek9G?=
 =?utf-8?B?enJ4U2JjcGFIY0VXeWtPWE81dHBqTG9ZOGlFNExZaHhiRFhzNXdCTnpXT3dT?=
 =?utf-8?B?ekxqbjJMNVVnMy9xa01zK1V2NGc5WDRsaWJxUm9rUU9NcXp0T29tWjM5SlRP?=
 =?utf-8?B?UVlwcWlZbHhhN0Z6RFRsa0J6Z1l1T0Y5dnlqTUxUZGhCMnZVTUw4MnpNK0hr?=
 =?utf-8?B?Ui91WXFjRVF6bzBvMmcvRDB0NDZ1aGRjV3U1TzBpdVNVOHV0bDRvd1pJS0ls?=
 =?utf-8?B?TkRTWHlBSHV0bGtkWFhzRHlKcW9pazgyMEQzYlhCMVVXQTNwMkZXZ0R1WHpL?=
 =?utf-8?B?d2RiY2NQcW05K2JoOHFLOU8xaWdDQXJWTUlZTnMvRVNDWmc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0MyNWtKeUhtbkVRSDNmbnRkRGdGVmpyN2dpWjJDek84VlhHbUdRQi8vMnJO?=
 =?utf-8?B?NEVobVRqa2QxV2pmOTkwMVBRM3gwdWtkb2xPd0hnYjZZeER6QzlTaHJlNW5W?=
 =?utf-8?B?NHRYaWt6a3RjYlhCZ0k2YXlySnhjd0NyY0drdWZTMEVyR1V6clZuUDZlT3R3?=
 =?utf-8?B?N1M2ZmxibGNjNElLYzhDK3F1SWIrN0FYNnF4M1paUXErSnFWSzFDQXB4elhR?=
 =?utf-8?B?SE9tUHFUbjZHOVNNOWVxcGlmaTRaY1JxU29YajQxWWdrRE1hN2xWc05Ea1Mv?=
 =?utf-8?B?blplL2YyU0lzL1R2YUZ3cFRkakh2QjNTNURJOEZpWjlUSFVPM2VIRE1XSU8y?=
 =?utf-8?B?Z2dXYnZYemg0dVJ6WFBnL041VVVjT1dmMXdvSWs5Yk1PTG94NWJYSFNNOWd6?=
 =?utf-8?B?MUh0OWNaQ0lodnphLzB1SFpkUklsZDJEdGRSalJtaEdCM2pjYUlFNmdZSG51?=
 =?utf-8?B?b1JPb1NkTFh5TWg3elZoWEUrUjNiV2crYTlrQjNLY1h4TWhXODh6Z1VpQUw4?=
 =?utf-8?B?SzZJWHl6by85VUJnZGF6dDBXemdTNjQrWVozak55UDdxcHl6Mm5LMXJIM1dT?=
 =?utf-8?B?VmIwZkRMeEU5MXZzZThBT1U0NUtGZUJyazR0eU1KckFncGkyTWt6Z05WaVZY?=
 =?utf-8?B?SUtueXVTUjBOY0NuT2FoZ3hrQ3JBTFdMdHg3VHVJYUdHMnVoVXpiNzBpT2p0?=
 =?utf-8?B?a1VOZ25HVHhmUHZLTlE4ZG1WZ3RBbmJDY3E0YXNjQ0wrNElDVTM3RzQ2Yzhy?=
 =?utf-8?B?SVBxUmtGU0k5U2R1VzE4Yk1aYnUwelo2ZHY2QTJMRG15M2IvZFZ5V25IbXND?=
 =?utf-8?B?SnlnTkxaMkxNUEIyR2ZjS0x2ZnFUS1FHenoxY1A2SDFyK2k1TXpoZUtWSk5H?=
 =?utf-8?B?VjNBUnJxSlNYN3NpazlKT1R0WjBOMldpTkNYRGV1Sms4eWZxd3BhalRnbmdB?=
 =?utf-8?B?dUVqVndFd3EyeTI5Q2NhZERoVWVoUVNnTCsvOStFNmkrZUNXMWZ4amRIWFpF?=
 =?utf-8?B?R0llVXJYMGNJYzJ6blN4blBUeWo2NHBtWnFoUFdaK0ljcC9XbzhwRENuMklm?=
 =?utf-8?B?aUN2QWN5VGk4ZjZ1NnliK2FHVjAzc0Fvc0l3d2FlYUlSbHlwemFoRXpQOGFR?=
 =?utf-8?B?Q1NtL1VZbUNkc3doOVlWdkhOUWg5dEpoYmcxdGhSZTlTMHpSYXNzL1F6bWgz?=
 =?utf-8?B?UWRlTnVzUUZ5WTg5MXZDOVpxRm85aENlV3BxRGFjbmk2a2YyS1Y3QlhwS3gr?=
 =?utf-8?B?bDZkQWJ3TmVXUlJwMGtGTXVTMlpiZG1KL3FFVG1xeDUxMTA2YTRXR1YrTFp2?=
 =?utf-8?B?aXdTeVJEckJ5Yi9TajMzTzNNS0NIa2tiM0N5SWtXUFJoRmdLVFBJZFJQSlVY?=
 =?utf-8?B?cUx0NUNCTkxCU3dJTURiRkVjRWIrTXg4WjFqQXZBK3R6MWxxcGUrb1N4RkNl?=
 =?utf-8?B?NTVoT3c2V3JUbmxLZ3FRVWVRZ2pWeXgwTjcxeUcwT0xvZDBvOUN6aW9JSTVs?=
 =?utf-8?B?cWpKVklGSUxOM1JGUm9vdFptQ2E3N2liMVFMQ0RnYW9ReDBZOGtNMGRNK0Nx?=
 =?utf-8?B?Q0toZGg2Mkl1dTU0Qk5QdWV1QVVMYjJrOHV6K0ZzMnhLaEdmT0UxSkRwSE95?=
 =?utf-8?B?WHZhMlROZjB1SzNhYjlJYWJ3c0Y2azltNTh1OEdqNEF4NTgwNmdEYUlKUW4r?=
 =?utf-8?B?VVV4UEFkRXEwbG1hbnQ1ZU8vOGtBdGxiRDZyVjQrQWxUMkl2RmlVVFlOcXF1?=
 =?utf-8?B?Q2JoUXRwV3BDanVCZ0xxazRDamFUZU1YMzl0ckRPeFRjQ0RVNTJNZ0lzbkJx?=
 =?utf-8?B?Y2dDa3hBdEpNcktIZXNOOUsvN0ZSWkZhdlJYeE1XYnJCaUpEUldBUzJnL1Jo?=
 =?utf-8?B?LytJbzVXMytzT0o4eFk2Nm1wcDlROHNHYTZXdGNpOHVFT0d4ZC9OSjNjSVFW?=
 =?utf-8?B?VGJTRFkxR3hsYUFwR01OREpHQ2p1clFmdnZhc0tNZFEyNGxEekJwY0RNYzA3?=
 =?utf-8?B?aFRPeVp3bG9TRTR1SXZXWWNRMW5FcWF2aSs2dy82YkZLZUxnWUQ2NTlZMU10?=
 =?utf-8?B?bTgvQ3ZlZDByYkkyZEY3aWN3NzdNRDVjTGlrbkovN3JYR2lrL0EzeHoybE1S?=
 =?utf-8?B?Yjl1YkNQVWRGVFVBeDdpQ0xhbnl6WUZLMlZZT2JmVFVNSkJ6NlYxUlRyVnQ3?=
 =?utf-8?Q?luOvyqQl4BcMUwLcCgxpuQs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DBD4FA5DBD332C4F88E939FBDB952D5C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f0937a0-c3f8-4441-962a-08dd4d2bd89e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 19:14:46.9495 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YOw0kgFy8/E1Mur/YU5+/f3pm8AOpaiba5EAYbAYcF0/DJ/uUIzqa4kA/YiUEH5NrVO/UVRe7jQoNohpN25M2JjxGUrK0AruMYVPYDmHOnMnNTq13/CmienbmODiuIO6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7837
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

bm9uZSBvZiB0aGUgZmFpbHVyZXMgaW4gZnVsbCB0ZXN0IGlzIHJlbGF0ZWQNCg0KT24gRnJpLCAy
MDI1LTAyLTE0IGF0IDE2OjQyICswMDAwLCBQYXRjaHdvcmsgd3JvdGU6DQo+IFBhdGNoIERldGFp
bHMNCj4gU2VyaWVzOiBNYWludGVuZW5jZSBvZiBkZXZjb3JlZHVtcCA8LT4gR3VDLUVyci1DYXB0
dXJlIHBsdW1iaW5nIFVSTDogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmll
cy8xNDQ4MjIvDQo+IFN0YXRlOiBmYWlsdXJlIERldGFpbHM6IGh0dHBzOi8vaW50ZWwtZ2Z4LWNp
LjAxLm9yZy90cmVlL2ludGVsLXhlL3hlLXB3LTE0NDgyMnYxL2luZGV4Lmh0bWwgDQo+IENJIEJ1
ZyBMb2cgLSBjaGFuZ2VzIGZyb20geGUtMjY2MC00NTcwZWNjMWY0OWIwMDBkYmJhNjFiYjA1ZTIy
ZWY1ZGI4OTM4MmI3X2Z1bGwgLT4geGUtcHctMTQ0ODIydjFfZnVsbFN1bW1hcnlGQUlMVVJFDQo+
IA0KYWxhbjpzbmlwDQoNCj4gUG9zc2libGUgbmV3IGlzc3Vlc0hlcmUgYXJlIHRoZSB1bmtub3du
IGNoYW5nZXMgdGhhdCBtYXkgaGF2ZSBiZWVuIGludHJvZHVjZWQgaW4geGUtcHctMTQ0ODIydjFf
ZnVsbDoNCj4gSUdUIGNoYW5nZXNQb3NzaWJsZSByZWdyZXNzaW9ucyAqIGlndEBrbXNfZnJvbnRi
dWZmZXJfdHJhY2tpbmdAZmJjLTJwLXNjbmRzY3JuLWN1ci1pbmRmYi1tb3ZlOnNoYXJkLWRnMi1z
ZXQyOiBQQVNTIC0+DQo+IElOQ09NUExFVEUNCj4gwqAqIGlndEBrbXNfcGxhbmVfc2NhbGluZ0Bw
bGFuZS11cHNjYWxlLTIweDIwLXdpdGgtbW9kaWZpZXJzQHBpcGUtYjpzaGFyZC1sbmw6IFBBU1Mg
LT4gSU5DT01QTEVURSArMSBvdGhlciB0ZXN0DQo+IGluY29tcGxldGUNCmFsYW46IGFib3ZlIHR3
byBhcmUgdW5yZWxhdGVkIC0gaXRzIGEgZGlzcGxheSB0ZXN0IG5vdCBjb21wbGV0aW5nDQoNCj4g
wqAqIGlndEB4ZV9jb21wdXRlX3ByZWVtcHRAY29tcHV0ZS1wcmVlbXB0LW1hbnlAZW5naW5lLWRy
bV94ZV9lbmdpbmVfY2xhc3NfY29tcHV0ZTpzaGFyZC1sbmw6IFBBU1MgLT4gQUJPUlQgKzEgb3Ro
ZXINCj4gdGVzdCBhYm9ydA0KYWxhbjogYWxzbyBpcyB1bnJlbGF0ZWQgLSBjcmFzaGVzIGluIHNv
bWUgaW9jdGwvcGFnZS1mYXVsdCBjYWxsc3RhY2sgd2l0aCBubyByZXNldC9kZXZjb3JlZHVtcCBl
dmVudHMNCg0KPiDCoCogaWd0QHhlX2V4ZWNfdGhyZWFkc0B0aHJlYWRzLWhhbmctZmQtcmViaW5k
OnNoYXJkLWRnMi1zZXQyOiBQQVNTIC0+IERNRVNHLVdBUk4NCmFsYW46IHRoaXMgaXMga25vd24g
aXNzdWUgaW4gYmFzZWxpbmUgLSBzZWUgaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2Ry
bS94ZS9rZXJuZWwvLS9pc3N1ZXMvMzg3Ng0KDQoNCj4gV2FybmluZ3MgKiBpZ3RAa21zX2ZsaXBA
Mngtc2luZ2xlLWJ1ZmZlci1mbGlwLXZzLWRwbXMtb2ZmLXZzLW1vZGVzZXQ6c2hhcmQtYm1nOiBE
TUVTRy1XQVJOIChJbnRlbCBYRSM0MTcyKSAtPiBETUVTRy0NCj4gV0FSTg0KYWxhbjogYWxzbyB1
bnJlbGF0ZWQgLSBhY3R1YWxseSwgaSBjYW50IGV2ZW4gZmluZCB0aGUgd2FybmluZyB0aGF0IHRo
ZSBjaSB3YXMgdHJpZ2dlcmVkIG9uDQoNCj4gwqAqIGlndEBrbXNfcGxhbmVfc2NhbGluZ0BwbGFu
ZXMtZG93bnNjYWxlLWZhY3Rvci0wLTI1LXVwc2NhbGUtZmFjdG9yLTAtMjVAcGlwZS1kOnNoYXJk
LWJtZzogU0tJUCAoSW50ZWwgWEUjMjc2MykgLT4NCj4gSU5DT01QTEVURQ0KPiBOZXcgdGVzdHNO
ZXcgdGVzdHMgaGF2ZSBiZWVuIGludHJvZHVjZWQgYmV0d2VlbiB4ZS0yNjYwLTQ1NzBlY2MxZjQ5
YjAwMGRiYmE2MWJiMDVlMjJlZjVkYjg5MzgyYjdfZnVsbCBhbmQgeGUtcHctDQo+IDE0NDgyMnYx
X2Z1bGw6DQo+IE5ldyBJR1QgdGVzdHMgKDEpICogaWd0QGttc19jdXJzb3JfZWRnZV93YWxrQDEy
OHgxMjgtcmlnaHQtZWRnZUBwaXBlLWQtaGRtaS1hLTI6U3RhdHVzZXMgOiAxIHBhc3MocylFeGVj
IHRpbWU6IFszLjI2XQ0KPiBzDQphbGFuOiBhbHNvIHVucmVsYXRlZC4NCj4gDQoNCg0KDQo=
