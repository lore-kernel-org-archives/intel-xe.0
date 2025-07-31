Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E8FC87FCA
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 16:39:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3903F10E284;
	Thu, 31 Jul 2025 16:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TwK/Tzlw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A7110E284
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 16:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753979941; x=1785515941;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=eK1fQywARomKT0DoGkxFBDELG6kKVHJ9m1OrMYejrrc=;
 b=TwK/Tzlw9wD4v/3BcIDqhH6jR3RdOAshggmbo5m28D6T/rBcqEVPw9iu
 fwNOQQge0mwQHM0uVObKbFUS8P3LZn4ADBCbbLlShVX2LNAZ4ph0Z1cH8
 S+Rf3mc/nyVopUwSm+AYPw/Fffm/5r0DeRPjeagfVzrUVVBJQ3BUVt3cn
 Nxg8ggS8DFdw+N//kZ+LjK9TwD9tpijCY46zKR3QXx/tHUwYrsyOZqJo8
 PmhXgQvQu4pP2/UqBug5kARhf7xtUjAe6bRYnrCTy5GXRDWp8YokvUEyl
 oHgqha883VDiLkj/g+qN+e6d/dct9obORdkoXPC8ln3YddqZOwxUo9xJ9 g==;
X-CSE-ConnectionGUID: zxLv8ffwT0CivF1QqhqtTQ==
X-CSE-MsgGUID: e/Y/cd+lQRyDu400FJ6Hpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="66584549"
X-IronPort-AV: E=Sophos;i="6.17,254,1747724400"; d="scan'208";a="66584549"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 09:38:26 -0700
X-CSE-ConnectionGUID: YvgVQyFeTkSx8cRWE3DdTQ==
X-CSE-MsgGUID: 3iXy0/BEQDOVyTWAgqm6wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,254,1747724400"; d="scan'208";a="168719108"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 09:37:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 09:37:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 09:37:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.78)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 09:37:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZavGP/yyMAVva+XeLX+0JLWr/DEFIruDiW7i37RJ8CWf9nw5/oReWDVL0tmjOq/VbRIwrAk4A6UhdCA6k/KnKvIZsb2ZB6bWOnST9U1JMOQmy9adFDjoWEOl53B6tdXyKsAdqCF8CCIwRushNtvyOWuhXhZHHPGIEwxRQtdyTXWotHDCvn2KTC5s7mLNaY1RgaV6ofqDVAnGVe6viv8M2WkfIGWZHfbIOsQhkdhpG+EMvtijBbq/bGLO6rsR+HAjA9foDbwa2LP3IHvmdjN9xbIKB8KOnl1Xc2p3zB7ahgBPSh3TF9dzk9aLHGs9xVbuRRSuV602hsKZ/dIW+zHyzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eK1fQywARomKT0DoGkxFBDELG6kKVHJ9m1OrMYejrrc=;
 b=CXImPkNcmsuJQtHrqrW0w0wa9/923cpJarHr5N8uTg0Xhiz58Hov0S+jIh38WtUTbkgBJkhe1yM32GSgoK5K0xOqW2VezcXsBscWT4d+URckfF0ilZL8DZV+Pg3Jqk7/6D+oZ0eWcU0Tv5298WaoYWRR7uW+qa4uEuJ04dWxGt0KyRya+/HTqMO9cxzkXZ+PRcbO1gxd1vtrvlQG4aiVtnn60viLYe2OEnc1ONMng9olgNWdxnaQtbx1pjkVznRcWq9breefPO5zBHoUqlicuKGuEHoD63yGr3Maj1wer/0Fk+ok0xMcFQPVVrrGRJHoWfSS8sq3VzrYXmnk+ZXBOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CH3PR11MB8343.namprd11.prod.outlook.com (2603:10b6:610:180::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 31 Jul
 2025 16:37:21 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.8989.013; Thu, 31 Jul 2025
 16:37:21 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3] drm/xe/devcoredump: Defer devcoredump initialization
 during probe
Thread-Topic: [PATCH v3] drm/xe/devcoredump: Defer devcoredump initialization
 during probe
Thread-Index: AQHcAeIBUzyDZEGR3UeZAz7ns5l3pLRMbv+A
Date: Thu, 31 Jul 2025 16:37:20 +0000
Message-ID: <464e277be289ad18541cab3110da7ff3103e5729.camel@intel.com>
References: <20250731061300.14320-1-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20250731061300.14320-1-balasubramani.vivekanandan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CH3PR11MB8343:EE_
x-ms-office365-filtering-correlation-id: ba50a86b-224f-4d49-250f-08ddd0508569
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dHBqS2xjRm43a1JEaHh5bXQyRUloR3hORmttdEhKRE9FTGc1bDZVMXVYcXJE?=
 =?utf-8?B?SjhWaUJIZGVWMTIzMGdpM0lSdHJISkR1SjJuTG80aXd4L0RMMmNXaTd0anN4?=
 =?utf-8?B?WlN4MVFYZEV5SVNwR2FldjE1dEVOamxOOWtaeWVLZVR1aEtBM1VFN3IrdmVC?=
 =?utf-8?B?RjZMazVVTDNueDVBQnk3WkdNZ2FzZFlnNUJIVWEycThzNDk0di9HenpLNEIy?=
 =?utf-8?B?b2V1c3QyMjZ4bFlCTFk5NTYwQVpWaG1BY0VkZjBRVzZWWWF0R0tGaTkxZkFi?=
 =?utf-8?B?aVpJdWtXZzJ1cEJhOU0wUjdyTkRwS1F5SWxUSDRwY0ZKUnIvREwxcnErQmE2?=
 =?utf-8?B?WHlxL3p1ZWV2TGd6bGt1VEQ5SWZSSlRaczlhNnpheWtJYWw3OERzTGdxR0VI?=
 =?utf-8?B?RnNnbEcrYnVSYmVTWU1neVJyaG1ITlJrQXBIVjFiRlNpWUpuQlk4amg1ZjZx?=
 =?utf-8?B?REhyYjJkUVVwSi9sWEF0czdwUjk5eVU2VDhGdnNmb2NoaEZvWHpPT0xZWkJ5?=
 =?utf-8?B?NS9LZWZ0NjhNSGl1eDg1UnNwUVM3UGM1MzVYYUtLeGN3cmx6cjZRRW4ySHZG?=
 =?utf-8?B?Tk9PcVcwWk5DMHRFTUR6TGpCRHgyakhKL0REYjdpcGYrSUQvOFNPSTZ0ZlMr?=
 =?utf-8?B?N3FZcXQ5NWNCNC9saFdWZWE3a3dmM3cweGhRaWh6U2MyTE10enVQQ2R3enRw?=
 =?utf-8?B?MHA4MCtZbjd4ak9vRFI0NXJLYUxpZTVLQTdIS2RjVmhnNWgybnE5L29KVWNt?=
 =?utf-8?B?dk5Mc3JuV1JLeWVqN0trWlZOUEJKbWpyUnMwdnIweENOdVhORW9xVHdaMHo1?=
 =?utf-8?B?c2lmWk1IVEV0Yy9KUnhuZmlwejc4eEQ3bjRYT0pNUjFUc1ZJclBnaWxMUmxT?=
 =?utf-8?B?ZUtyRlFackc5NUVDZjVVOFo3Unp1WGtWVTZJSVFSdnh0ZXFuYnZRcFVTK3Ni?=
 =?utf-8?B?dDJtUUdCOWkyTGVVclhOSFE3RFp6VCtUMitISWI1T2sxTEpoS1d2T2gyR000?=
 =?utf-8?B?aFRsemVqMVVLem5kWkdFbHJZS2FRamdJVnBVdHBvc2liZnJKN1V4RnhMaWth?=
 =?utf-8?B?QjlXY3gxM21WcUlSZU1maDZKV25mMUkyZ2l3MEFwWlpsUW9YYzJWancybGFs?=
 =?utf-8?B?bU1RajRwTHFkVUFKMExFOUtmeWx2RmhXUnAzdFl0YjBwOXRMU2tNMHk4dGtt?=
 =?utf-8?B?d2FZMTYwaW0zUHRNUktkRW9FRVRsTy9MZktuSmhXbFdZbCtJNFlFMWdPLy9O?=
 =?utf-8?B?YVo5YXlQb3pwK2poeDZVSXZ3UUpNUHE0dzFkREQ0NFIwYWdocm5NSGthOWN3?=
 =?utf-8?B?NkY1ZmZGYllWNHdTdTZjbE10Z0VHajdRRDhMbFZBd2o3eTRLcUd6Y2kzUFV0?=
 =?utf-8?B?Z1pXVGFQdzVjL2RLSkYvalJaeDVRc09DUnMzclB0eVYwc2F6MEd2RWZhVWw4?=
 =?utf-8?B?bzdjckM0a1RNQmoyMzlub1VYNWxwQVZzNDNSTjdZMnhkOUxGdDA4KzVKZjhB?=
 =?utf-8?B?RWs0MTkwWUhLUFBXSjh4dnFWc0dlc2hMNUJKK0JGb3l6RnRabWdqYWFxaSsz?=
 =?utf-8?B?MnpxYXd5a241amRJQ0lGajE2YmNoS0NGUXNUV29iMVlDZzB3SEJlT2hoUWhN?=
 =?utf-8?B?MFpTU21Ea1k0SW5aTy9wOEdoeW5QUjB0RXp2TXdpU1EzYWt6KzlqRW16L1Q0?=
 =?utf-8?B?aXNXOXhxbE1ISGFITVUxRHNmZU5UUnJFVG5Qa1B3WXU1Unh3WU9PSWR4OUVW?=
 =?utf-8?B?V2dZbDhKeExTMDBDU0lObWllVy95Uk9GbTNrb3pZcCtmRXhSVkErY2FkVEt1?=
 =?utf-8?B?YVJsTFVjQW5sVlhQdVdwU1FSOVBFbXdNMk1USmNjclk3TDI5N1BSb3lsbmV4?=
 =?utf-8?B?N2QrR2VKQ3RhaTRFTnBlMmFnVnZsMzZSQUNtakNZamIwd3RSSFFSOEtpa2J1?=
 =?utf-8?B?MldvUis1dndDYTdIRUtaNjNYSjIvLzZzY1ZmR2dzTjd0cnZQWWNsOFNHa2Vy?=
 =?utf-8?B?N1BtL2l0TzFBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2NUNmNxV1JWcW4zdk5KMkV0STFSNFQwT3owdzZydmtkSlQ3MXB4Y2pHNW1W?=
 =?utf-8?B?UHFjdVRPcUU3eWNYM3hoNC8wZ2Y3cjN4UUpaTThTOFpoQlF3T005SUs4eGdD?=
 =?utf-8?B?S0YwcytsckorK2dVZWhmYmlKWUpRVlc4b2QrOEV0SEJMNlhDenA4M2Q1eVVz?=
 =?utf-8?B?THpqUnN3b1hBUU0zTzhnSjl6L3N3Zm9mck53TS9YRFh1SDFnSUEydXZ6akt2?=
 =?utf-8?B?d2FyMmpNUXJXOHpVZThBRG9QWXJ0WWsxaXZuUmRuSkVNOFk4KytROE91eHNC?=
 =?utf-8?B?NzJCVUk5bG4raVlkazdkSEpKVVM3TGJtWXJyMWR3WVRWWk9jc213bHpydVpp?=
 =?utf-8?B?QUh1ZTNOM2ZrUDBFenZKbHNoRHgwZkRRbXJqRnRxQTk1cTVkTU1xZ1drWXV3?=
 =?utf-8?B?U05GeXZCemNPYzlqTlJKM3gvNUIxaFN2OFRWRVl6R1o5ZWNzRlBwaXQ0cmFN?=
 =?utf-8?B?VkRRYUszeXNVK2dDUGVOQXJMWGlKWjY3SXZRc2M2Tkhkc0NrRW92a0o2WTFT?=
 =?utf-8?B?WG81bFIrcDhWSjE4cUxKMjJINVYrVmQyUGpIZFhENTY0MGdGQjB2SFZJendZ?=
 =?utf-8?B?Ti9HUlMzblRtWWFybUordE5rODFBTWswaktlRzA2cmhUcFRRcnFkV3JVTnFs?=
 =?utf-8?B?Zjl1ck0wKzJQSSs3Slhzc3p2NHN5cEphbTFaYVBxaGRsVmR6TDJNN3dQSThM?=
 =?utf-8?B?UHdFOTNMY3JRWTVNNVI4cGRMMFVDUndIUWFzOHpOWE96bUtGS1Zrdk1BN3Bw?=
 =?utf-8?B?eFYrN25ZckZ6UWRCWUgzNTlLcSs1UU9XdDMwMDcxZjg0dThhSy9BQmJCSmFw?=
 =?utf-8?B?WVl3azhXS3pmcW9oTFlOTnhjeDl6aG5paVJoY09rMFZCUGxFRDFSejNZTXpQ?=
 =?utf-8?B?eElnQ3pJK2RJVS9UWDNQT3QvMEowRldnUDZRUEhtNXFrdFg3d1liTTBLZEs4?=
 =?utf-8?B?NlZVeHI3TDJHY2toaXpGL3U5U2hqdWFZcnpTclJwU3BtQmlJZ3NFOGhPTHhP?=
 =?utf-8?B?R0pucUJFLzllTWFDK1E2SHAxSDlNRFlUYnVBU3l3T1k3Uk13cGRhQWV1N2x4?=
 =?utf-8?B?WldXNVdzdzFSNytISWVkTEdGcUVBallqVUUzUlJIaTRVeEgvakJDT0doczV5?=
 =?utf-8?B?N2IwSW1JTTlqVEFRQWFDVmdWcGpSNGpoc0xDUmpDM2tBUDFjY1JMNEVIeWRG?=
 =?utf-8?B?bDR6bHp2WDlJZnBBYmplSm5kMlpuMGk1TGRGUVZnRFhwVEUzMzlXT2NkR0RC?=
 =?utf-8?B?bEpPVmVWTEpIOXhyODU2QW5pWEN6NXNCYmJaSXJVSDJ3UUowbGdiaDYrMVQ2?=
 =?utf-8?B?NUxuZldSUTBaWDVXbFIwNmloaWJmMEo2eGF2MkgrY1FyUFdJZnZWa1JqeER0?=
 =?utf-8?B?Sm4rVXU5cDRoV1lpNlRGU09ETnJ5YUJQSzhJdGNtclgxM1VVTHR1blVGaStM?=
 =?utf-8?B?aEFvZnB5bzNialBoejZJSlc0bVlPMHA5a09Fd0JXcmczQUJ3Vit1Rk5sZnRG?=
 =?utf-8?B?bVpTMnJIVXRYNjg5QnJxY2FzNFBvRUFHejhFbmcrbkNla1BPWEpVcnN3bDJi?=
 =?utf-8?B?QVhlVWI2ZUZUWDBiQzN1eFVtQ1Q1b3dwNzZoS2xueWJQU2tGdFk0Z2FHRm1C?=
 =?utf-8?B?ekFUOUtka1FaTnh0NTJQc25rOVkybGpTTUc1bjFXVXNxK2pJT3Z3SHNXY2Fn?=
 =?utf-8?B?MnVQenFIRUNYbTZUVE0vRmZMNzh4bXFXUTl3WTExdmxPdXI2cEw1SWFzTmQ1?=
 =?utf-8?B?YXVvZjN0ZFlWaEZuZENMeHlta1dRaEdYVC9ud0FqWWpuKzJUSFlIaHYvRGoy?=
 =?utf-8?B?Z01oK2dXWUJnaFUzTE9HS2xoUStiNnM0QTFkVGlDT1I2SHJPQ0VZamxYckZi?=
 =?utf-8?B?TVRPUG9NYUd6L1lCaG5sKy9OS1R1cjN3NDhWL2ZUUStYQU9BZ1hVakQxYnUr?=
 =?utf-8?B?RzUzblhUeFgvWjUxTGZrOXNpR3ZNcXFRUGpQQ0thUmNlV2ZheDgvbDlOa3J0?=
 =?utf-8?B?UndvU0NpUy9EUnFibytIZjR0U0hOWDIvUnp3WTNORnVtOVMvUnhlbk5haE0w?=
 =?utf-8?B?VEdjSjBJK1l6L3VsbFFTSzViN1Zyb1RNbzJZY1drV2dxdm54Zy9BYWl6ZkJ3?=
 =?utf-8?B?T1h0ckZwMnh5OHZIQnRmaHAycDlPSXNTMDN2TXc5NmhTN3ZXSEpPVGlBa25w?=
 =?utf-8?B?VHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <90E4C2D706F5304D86C82E4E7DBBB601@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba50a86b-224f-4d49-250f-08ddd0508569
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 16:37:21.0104 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TupEomKJaJidtKcJUaTPGJXRzeH5nD6tgz/NA2bUT4Jr04qlB/Q0ZjGit6xHzmJbDJ5FGb99bz1j2iAAIYm96O42dadkWmtETLxC4eisKmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8343
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

T24gVGh1LCAyMDI1LTA3LTMxIGF0IDExOjQzICswNTMwLCBCYWxhc3VicmFtYW5pIFZpdmVrYW5h
bmRhbiB3cm90ZToNCj4gRG9pbmcgZGV2Y29yZWR1bXAgaW5pdGlhbGl6aW5nIGJlZm9yZSBHVCB0
aG91Z2ggbG9vayBoYXJtbGVzcywgaXQNCj4gbGVhZHMNCj4gdG8gcHJvYmxlbSBkdXJpbmcgZHJp
dmVyIHVuYmluZC4gQmVjYXVzZSBvZiB0aGlzIG9yZGVyLCBHVC9FbmdpbmUNCj4gcmVsZWFzZSBm
dW5jdGlvbnMgd2lsbCBiZSBjYWxsZWQgYmVmb3JlIHhlIGRldmNvcmVkdW1wIHJlbGVhc2UNCj4g
ZnVuY3Rpb24NCj4gKHhlX2RyaXZlcl9kZXZjb3JlZHVtcF9maW5pKSBsZWFkaW5nIHRvIHRoZSBm
b2xsb3dpbmcga2VybmVsIGNyYXNoWzFdDQo+IGJlY2F1c2UgdGhlIGRldmNvcmVkdW1wIGZ1bmN0
aW9ucyBtaWdodCBzdGlsbCB1c2UgR1QvRW5naW5lDQo+IGRhdGFzdHJ1Y3R1cmVzIGFmdGVyIHRo
b3NlIGFyZSBmcmVlZC4NCj4gDQo+IFRoZSBmb2xsb3dpbmcgY3Jhc2ggaXMgb2JzZXJ2ZWQgd2hp
bGUgcnVubmluZyB0aGUgSUdUDQo+IHhlX3dlZGdlZEB3ZWRnZWQtYXQtYW55LXRpbWVvdXQuIFRo
ZSB0ZXN0IGZvcmNlcyBhIHdlZGdlZCBzdGF0ZSBieQ0KPiBzdWJtaXR0aW5nIGEgd29ybG9hZCB3
aGljaCBoYW5ncy4gVGhlbiBkb2VzIGEgdW5iaW5kL3JlYmluZCBvZiB0aGUNCg0KL3Mvd29ybG9h
ZC93b3JrbG9hZC8NCg0KPiBkcml2ZXIgdG8gcmVjb3ZlciBmcm9tIHRoZSB3ZWRnZWQgc3RhdGUu
DQo+IFRoZSBoYW5nZWQgd29ybG9hZCBsZWFkcyB0byBhIGRldmNvcmVkdW1wLiBUaGUgZm9sbG93
aW5nIGNyYXNoIGlzDQoNCnNhbWUNCg0KT3RoZXJ3aXNlIGxvb2tzIGdyZWF0Og0KUmV2aWV3ZWQt
Ynk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQoNCg0KPiBub3Rp
Y2VkIHdoZW4gdGhlIGRldmNvcmVkdW1wIGNhcHR1cmUgcmFjZXMgd2l0aCB0aGUgZHJpdmVyIHVu
YmluZC4NCj4gRHVyaW5nIGRyaXZlciB1bmJpbmQsIHRoZSByZWxlYXNlIGZ1bmN0aW9uIGh3X2Vu
Z2luZV9maW5pKCkgd2lsbCBiZQ0KPiBjYWxsZWQgd2hpY2ggYXNzaWducyBOVUxMIHRvIGh3ZS0+
Z3QuIEJ1dCB0aGUgc2FtZSBkYXRhIHN0cnVjdHVyZSBpcw0KPiBhY2Nlc3NlZCBkdXJpbmcgdGhl
IGNvcmVkdW1wIGNhcHR1cmUgaW4gdGhlIGZ1bmN0aW9uDQo+IHhlX2VuZ2luZV9zbmFwc2hvdF9w
cmludCBieSByZWFkaW5nIHNuYXBzaG90LT5od2UtPmd0Lg0KPiANCj4gV2l0aCB0aGlzIHBhdGNo
LCB3ZSBtYWtlIHN1cmUgdGhlIGRldmNvcmVkdW1wIGlzIHN0b3BwZWQgYmVmb3JlDQo+IGRlaW5p
dGlhbGl6aW5nIHRoZSBjb3JlIGRyaXZlciBmdW5jdGlvbnMuDQo+IA0KPiBbMV06DQo+IEJVRzog
a2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSwgYWRkcmVzczogMDAwMDAwMDAwMDAwMDAw
MA0KPiBXb3JrcXVldWU6IGV2ZW50c191bmJvdW5kIHhlX2RldmNvcmVkdW1wX2RlZmVycmVkX3Nu
YXBfd29yayBbeGVdDQo+IFJJUDogMDAxMDp4ZV9lbmdpbmVfc25hcHNob3RfcHJpbnQrMHg0Ny8w
eDQyMCBbeGVdDQo+IENhbGwgVHJhY2U6DQo+IMKgPFRBU0s+DQo+IMKgPyBkcm1fcHJpbnRmKzB4
NjQvMHg5MA0KPiDCoF9feGVfZGV2Y29yZWR1bXBfcmVhZCsweDIzZi8weDJkMCBbeGVdDQo+IMKg
PyBfX3BmeF9fX2RybV9wcmludGZuX2NvcmVkdW1wKzB4MTAvMHgxMA0KPiDCoD8gX19wZnhfX19k
cm1fcHV0c19jb3JlZHVtcCsweDEwLzB4MTANCj4gwqB4ZV9kZXZjb3JlZHVtcF9kZWZlcnJlZF9z
bmFwX3dvcmsrMHgxN2EvMHgxOTAgW3hlXQ0KPiDCoHByb2Nlc3Nfb25lX3dvcmsrMHgyMmUvMHg2
ZjANCj4gwqB3b3JrZXJfdGhyZWFkKzB4MWU4LzB4M2QwDQo+IMKgPyBfX3BmeF93b3JrZXJfdGhy
ZWFkKzB4MTAvMHgxMA0KPiDCoGt0aHJlYWQrMHgxMWYvMHgyNTANCj4gwqA/IF9fcGZ4X2t0aHJl
YWQrMHgxMC8weDEwDQo+IMKgcmV0X2Zyb21fZm9yaysweDQ3LzB4NzANCj4gwqA/IF9fcGZ4X2t0
aHJlYWQrMHgxMC8weDEwDQo+IMKgcmV0X2Zyb21fZm9ya19hc20rMHgxYS8weDMwDQo+IA0KPiB2
MjogRGV0YWlsZWQgY29tbWl0IGRlc2NyaXB0aW9uIChSb2RyaWdvKQ0KPiB2MzogRklYTUUgYWRk
ZWQgKFJvZHJpZ28sIFN0dWFydCkNCj4gDQo+IEZpeGVzOiA0MjA5ZDYzNWE4MjMgKCJkcm0veGU6
IFJlbW92ZSBkZXZjb3JlZHVtcCBkdXJpbmcgZHJpdmVyDQo+IHJlbGVhc2UiKQ0KPiBTaWduZWQt
b2ZmLWJ5OiBCYWxhc3VicmFtYW5pIFZpdmVrYW5hbmRhbg0KPiA8YmFsYXN1YnJhbWFuaS52aXZl
a2FuYW5kYW5AaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2
aWNlLmPCoMKgwqDCoMKgIHwgOCArKysrLS0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dWNfY2FwdHVyZS5jIHwgNiArKysrKysNCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2RldmljZS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+IGlu
ZGV4IGQwNGEwYWUwMThlNi4uYWU0OGNkM2M3YmYwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZGV2aWNlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rldmlj
ZS5jDQo+IEBAIC04MjEsMTAgKzgyMSw2IEBAIGludCB4ZV9kZXZpY2VfcHJvYmUoc3RydWN0IHhl
X2RldmljZSAqeGUpDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHJldHVybiBlcnI7DQo+IMKgwqDCoMKgwqDCoMKgwqB9DQo+IMKgDQo+IC3CoMKgwqDC
oMKgwqDCoGVyciA9IHhlX2RldmNvcmVkdW1wX2luaXQoeGUpOw0KPiAtwqDCoMKgwqDCoMKgwqBp
ZiAoZXJyKQ0KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGVycjsNCj4g
LQ0KPiDCoMKgwqDCoMKgwqDCoMKgLyoNCj4gwqDCoMKgwqDCoMKgwqDCoCAqIEZyb20gaGVyZSBv
biwgaWYgYSBzdGVwIGZhaWxzLCBtYWtlIHN1cmUgYSBEcml2ZXItRkxSIGlzDQo+IHRyaWdnZXJl
ZWQNCj4gwqDCoMKgwqDCoMKgwqDCoCAqLw0KPiBAQCAtODg5LDYgKzg4NSwxMCBAQCBpbnQgeGVf
ZGV2aWNlX3Byb2JlKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFhFX1dBKHhlLT50aWxlcy0+bWVkaWFfZ3QsIDE1MDE1NDA0NDI1X2Rpc2FibGUpKQ0KPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFhFX0RFVklDRV9XQV9ESVNBQkxFKHhlLCAx
NTAxNTQwNDQyNSk7DQo+IMKgDQo+ICvCoMKgwqDCoMKgwqDCoGVyciA9IHhlX2RldmNvcmVkdW1w
X2luaXQoeGUpOw0KPiArwqDCoMKgwqDCoMKgwqBpZiAoZXJyKQ0KPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgcmV0dXJuIGVycjsNCj4gKw0KPiDCoMKgwqDCoMKgwqDCoMKgeGVfbnZt
X2luaXQoeGUpOw0KPiDCoA0KPiDCoMKgwqDCoMKgwqDCoMKgZXJyID0geGVfaGVjaV9nc2NfaW5p
dCh4ZSk7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2NhcHR1cmUu
Yw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY2FwdHVyZS5jDQo+IGluZGV4IDg1OWEz
YmE5MWJlNS4uMjQzZGFkM2UyNDE4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3VjX2NhcHR1cmUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2NhcHR1
cmUuYw0KPiBAQCAtMTgxNyw2ICsxODE3LDEyIEBAIHZvaWQgeGVfZW5naW5lX3NuYXBzaG90X3By
aW50KHN0cnVjdA0KPiB4ZV9od19lbmdpbmVfc25hcHNob3QgKnNuYXBzaG90LCBzdHJ1Y3QgZHJt
DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJfeWVzX25vKHNuYXBz
aG90LT5rZXJuZWxfcmVzZXJ2ZWQpKTsNCj4gwqANCj4gwqDCoMKgwqDCoMKgwqDCoGZvciAodHlw
ZSA9IEdVQ19TVEFURV9DQVBUVVJFX1RZUEVfR0xPQkFMOyB0eXBlIDwNCj4gR1VDX1NUQVRFX0NB
UFRVUkVfVFlQRV9NQVg7IHR5cGUrKykgew0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgLyoNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIEZJWE1FOiBEdXJpbmcg
ZGV2Y29yZWR1bXAgcHJpbnQgd2Ugc2hvdWxkIGF2b2lkDQo+IGFjY2Vzc2luZyB0aGUNCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIGRyaXZlciBwb2ludGVycyBmb3IgZ3Qgb3Ig
ZW5naW5lLiBQcmludGluZyBzaG91bGQNCj4gYmUgZG9uZSBvbmx5DQo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKiB1c2luZyB0aGUgc25hcHNob3QgY2FwdHVyZWQuIEhlcmUgd2Ug
YXJlIGFjY2Vzc2luZw0KPiB0aGUgZ3QNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAqIHBvaW50ZXIuIEl0IHNob3VsZCBiZSBmaXhlZC4NCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAqLw0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGxpc3QgPSB4
ZV9ndWNfY2FwdHVyZV9nZXRfcmVnX2Rlc2NfbGlzdChndCwNCj4gR1VDX0NBUFRVUkVfTElTVF9J
TkRFWF9QRiwgdHlwZSwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGNhcHR1cmVfY2xhc3MNCj4gLCBmYWxzZSk7DQo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgc25hcHNob3RfcHJpbnRfYnlfbGlzdF9vcmRlcihzbmFwc2hv
dCwgcCwgdHlwZSwNCj4gbGlzdCk7DQoNCg==
