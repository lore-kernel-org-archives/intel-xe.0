Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACC5C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 00:01:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDEAA10E518;
	Fri, 28 Jun 2024 00:01:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PH8Shu4n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0AD10E518
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 00:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719532896; x=1751068896;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=kRCI9HuBckRpOrTdlXbEVx+nMh0By+YrREvbtgwHWDU=;
 b=PH8Shu4n+Y/wRsA0v3w9zNBTRVE+C6Ka7CRp0HsCiCkA4KhtOb4c5dXJ
 QhjQvXvLbD4DtTxxpaVSuT7UdBJBQv8+zDnlvvCYnVfxuMPzYyDxPOHQb
 HgS9C40W25XAa0Ec2ndaO/A0FPPYcU/GOemssTdyN05Bv4YrX24onKu0y
 B2n1KjKtmSvqEj3fy864unXZ7QD+O/Kg3kjyGVNh+rokUDhy+pYUfAh09
 2+GMBjdQDlHAnNFpDrb2D4ev2LsWD29UN7q/MV0z/QITY0/gXg1792CU3
 P0Mc8HDPe5dGX4LeoOcxOnc/hniqvEs+gjQg7+w26YIXP1+bkRUnqubPA Q==;
X-CSE-ConnectionGUID: 2U4H2A3+TSCNmcBj9k1EPQ==
X-CSE-MsgGUID: +vuxKtxdQX2FJVnO8+Y0Sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="34239336"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; d="scan'208";a="34239336"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 17:01:35 -0700
X-CSE-ConnectionGUID: foFnmX16TeC3huT5b3flIQ==
X-CSE-MsgGUID: nnF1kwWgQqCmW+aTuPSwaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; d="scan'208";a="44621108"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jun 2024 17:01:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 17:01:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 17:01:34 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 17:01:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0PlvgCNMHATlZwyjOChqH8CcRxbMg1wCB+iVentlDT5E3FVa09BQVy5Z76YzzE/VtVItWCT50AIZbqvTqNyU1AlggjC7J7CGud6ZR8fhikJyvK+aC2aeRV7epvh8pvMNEKgBHF0x+LuQfy/YHXi8AlBQ3UkB+jy4uMVfWrE31Ytcyjg0F6K5W5Mt0VHE1GnTusLGSQdn+toK43GmM9g+4CYlPaTkh+MrG0lCBfPn8WJ89dq1snA283p8AQrazjeFibfxJjcwlTCVYwnabm/baRERu/F4HMqCk9i8hNy2VNy8nDUWlwUH/jX31k32uuIYEXhNQud0QsA1FsRj3sUmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRCI9HuBckRpOrTdlXbEVx+nMh0By+YrREvbtgwHWDU=;
 b=Nq7FWEJ3/bhgcedWBz+N82creUeDpzMl/F9Wz0j846k2NwbypqgryqDLLwcmmlQRs0PIAmqoAzac2OWrPbxMBjwPEWpIg12NbZxKibj5o4RDZJAXJ0d9IqIW1Ds5k5Qlk4kOtjFN7QYDZe9f0N+c853TKYMWBTmQ4SIfnWcp+l9AiZmqEw8b2Vf0kGgUmUHqHaODGIOQ0FNw/RLtBMisMLty7TAskUc2OkLim2n26brss1s91o19mDtaNSaPwgehgNWRrWPmr3ipfD5EZRQwegQ1942PLGLjb/EFM/mZuc3ec7Bw0T9GPUxU2JxXZ58NlgwGjMzBoJA5H44n44cWmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CYYPR11MB8406.namprd11.prod.outlook.com (2603:10b6:930:ba::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.25; Fri, 28 Jun 2024 00:01:32 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%3]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 00:01:32 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v11 4/5] drm/xe/guc: Extract GuC error capture lists
Thread-Topic: [PATCH v11 4/5] drm/xe/guc: Extract GuC error capture lists
Thread-Index: AQHaxoEUZnatmNeJME+kkyu/8doOB7HcT6YA
Date: Fri, 28 Jun 2024 00:01:31 +0000
Message-ID: <e78590eecbb9c49ce613364f0caa8685be59b731.camel@intel.com>
References: <20240624215404.3213075-1-zhanjun.dong@intel.com>
 <20240624215404.3213075-5-zhanjun.dong@intel.com>
In-Reply-To: <20240624215404.3213075-5-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CYYPR11MB8406:EE_
x-ms-office365-filtering-correlation-id: f2bdd4fc-bc85-42ff-aebf-08dc970577d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UU9rQlYzWHUzeXdHcnRBdDN0UmM2czZib2ZkK0t1WHptei9ZTklCdHNEMmcx?=
 =?utf-8?B?cjl0K2tzbmZ6RExNTjV1Rk9OdUNvK2xxd1hManhkc1R0SnI1RTA2QkJYeG5q?=
 =?utf-8?B?RFhjYW8wWWIxeFBSL0ZoNXFwODBSYnpNbkdDTGU4MGtPZnZSdGJJaHMzckRB?=
 =?utf-8?B?V2tUQ2U2QUUrZDJJejJrRVNjOTNEYWp3STJjVnMwNHAxL2ZPVGhuM0NjUzIz?=
 =?utf-8?B?MkpVQXdZbUdUM1VLQVYzL21RTWNpZTZYWXJrNHpkV0NMZnVITWJyQ3RMZnI2?=
 =?utf-8?B?NUZ3UXAzMVFLaUh1MDhmRkp0ZUNLUFEyaGZMZXJBdzFYWit2UjNIMGNvQ3pj?=
 =?utf-8?B?TDBoR2owVXMxdlRLeVltbkpuQ1ZoL2wrcmEwcjIwWjZZcVl1WUxLdEFhWGNQ?=
 =?utf-8?B?aU9iOEpETHNzSTVaem5MK3BHbXFURWRBTm9MSEdxYXkyeE9icTdPRjJ1clI1?=
 =?utf-8?B?bVZqSlZNc09ZdVFGZlJjM24zRDBsV2U3T1NrSUprSVQxNmNsS3lFM3lkdjEy?=
 =?utf-8?B?eTBCNDRjWnJib3hvRmpMUW1rY1Y1KzAyN0EzNmRVNFVZQk1udExwYTFNMTdy?=
 =?utf-8?B?eFI4Tk12MGUzL25ERXkzQ2RFdGtacVF1SzZtOVBLalhNN3JQSE9JZFg3YnJi?=
 =?utf-8?B?Q2VGY1V3YVhzUzFlRTROSS9ISUtrZ3p4bk9QbU9vSnB5L1NuQkVZa1VyZnFF?=
 =?utf-8?B?YytSaFl2Y0d3cGhJU0Ywc2ZVbUcxLzhSeEg5dWRxT3crTlkwcktmamtUaVRV?=
 =?utf-8?B?ZGFscVdaYlBzYW1ibXdBaldWNk1CelRCSGVnSWUwTTEvN3c5TTJsMFp0L1lz?=
 =?utf-8?B?cVNMM08vR3ZTS2JZRVZpci9hZGJyK2FRbElidURBRUs1all5c0hOZEdLb2Vr?=
 =?utf-8?B?WkdJYVNvVURwUEFlZnc0eWMzR2I4ckZHS01hUG5HalVxQzhBVm9OYm9UL1Mx?=
 =?utf-8?B?bjZlcTVPdFpmSkcyb2JrZmh4bUdQaWNkT3YwSXBIZkFwa254cW9vMVovOUZX?=
 =?utf-8?B?SEF4TEV5czMrdEdOTUN5NHBqYjN3a0ZPQVFIcDR4eW9seDhSRGVxRXVubVAx?=
 =?utf-8?B?eFRKOEJMazlhSE5UVVorbkgzalY3TjYzRHcveXp6WDIwZlZhZmUvK0Y4Qmxv?=
 =?utf-8?B?Zzlxai9yVW9sRTdtQnB5S3hURUxnWGtWSnp1Wk9ZWW9VUVd6VlFzRUEwcEUr?=
 =?utf-8?B?Qy9NKzNjMlFqcThqcGtlUENaV1ZDTGFudlJDTy8vc0FwNDNObXAxZStpWEZs?=
 =?utf-8?B?VElQVWEyRHhTdGFMVVZ6N2Y2VXorcks0TGw4NTJWUU96KzVPVGxKUkEzL09E?=
 =?utf-8?B?Y1RiYU16V3pnOHBaanRJS2liQjI4ZjFqeWFzaUlUUk5Tc01sb0NKQXVYYi81?=
 =?utf-8?B?Y2JMTU5wOG5iNGZBVnNNVEZUNmFjOUhTOGE5VGw1Q3docWwyeERjMUpibVBS?=
 =?utf-8?B?M0QvcjBkeVovTlhPNU1EbDFzTWJYR09pczMvTlBUdlNvbnpsc0dqSmN6ek1D?=
 =?utf-8?B?TzdQd3VpZWJOM0pJOW96TG5GQThWcW5BL0Z2SXpmaDk2bmNuaFh5ZkNSOEI0?=
 =?utf-8?B?Z1AvNEFxbGxNVmZ3TXQ5YVduRi9tL3BvcEkxMWJwTm5xK3N4ZUlsbWRqRWNJ?=
 =?utf-8?B?NGljbTlBL3pJWUhjVUgvZUN0RlpYcGd5MEg1eUNhNXBrZFlzV2d2alhNNlNn?=
 =?utf-8?B?V3BTVDZ5NXk4eStTZXU4bjRLazhpUm1CbWZlS0gyOGZwSE9CU1NiRjV0bXpJ?=
 =?utf-8?B?bW5wdU9zTmZBODB1cldhRGZLNElzYnhyNTJSSGJ6TitjQlJkbWZtOC9vNmJX?=
 =?utf-8?B?b3NIelpJMWtyZjZFN2hRODBTYXJPRjFXZmZjVDB0ZVZMWEY2UWhvRXhLSUU1?=
 =?utf-8?B?L2ZBZmxEUVVmdU9YVkd3U0drM1VzY0l5OWVydjlPZjhoR3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UzRPMzhnRDhlS2x6WkpiTWNQc3RIcTNtSm0wTE9Bbkp6RVlrVjJEbGVsT2tZ?=
 =?utf-8?B?VXRQRmhJVWtWUi94L3lUN3RrRWVUdnNNNzRYMGFhN1EzSi9UaWdtV3p0OXNj?=
 =?utf-8?B?eU94VExBQ2JKSy9IWFFydnpacFVDNjFlRTh1cjJhbTNnNHRzdWVKUGNCMDNw?=
 =?utf-8?B?Y1ExbnBNV295WjNraWZFVTdReWhqWWJyZnV1aFpSblNmTnN3K09KNEV0c05Z?=
 =?utf-8?B?UlV3b3diSmR1c0ZpNHNVTWo5YnF3T3F6c0l3dE1xb0tiWnptZUY5VWRpZUtu?=
 =?utf-8?B?aEZiVXBOUGw1OGJhdlpnbWdnamUvVFJNZFp4TFZ3VGJOMlBmMHl6OU9EYm1n?=
 =?utf-8?B?aGxlSXF1Q2JMTG5pcXhweWVwR0ZjcDdaQlRqUGJPOUZWYW1EaW91OC9ubnJC?=
 =?utf-8?B?VVZ2K29Qd3M4Z3BhNldGSVhqSmZYd0V1MG56KzJxUzZOUFRqTGZycDFnVTRR?=
 =?utf-8?B?T01YN1FOckQvRDBMUHVGSGxucUU5Szk2N29WZHJBSWhhUkJBZmdzRXZya2hx?=
 =?utf-8?B?ckp2Njh2L09saXJSbnBjbzBtbVdsNHZ6ZDMzOU1zcEUvVzRub01wUlgvVjky?=
 =?utf-8?B?bmlINWtjaEZIVThRRDNPbDNhM0RPbEwzQ0xMd1RubmF1NU9VV2dWdDZqdGNa?=
 =?utf-8?B?RzVzZUxWSkhtMmtrWHhxbkVvT2V3dE1uN0FVVjNLbUR6cEErUDMzRFF1bU8w?=
 =?utf-8?B?VzlsSDlGNnZNVXVlYUNHUVpUS2RZMXNiMVpwZkFncEYwOXI1ejlkdm1MVEpJ?=
 =?utf-8?B?ZFBIaU55Y1BFQ2Z0OVRaMG9vdmNabElaanBzVEpqQklUU1llZytWVlBhdS9n?=
 =?utf-8?B?OC9lOWMrZlpZN0Rqc1V3TkhnYzBEbUdEMWdFTEdMQk1pY1FBU0p1eTVvMFJ5?=
 =?utf-8?B?OENINERjbGdEODFrT0t5LzJ6d0d3TTUxNUdHVlV2cXNzbmVTRmRLRWxVL28y?=
 =?utf-8?B?bys0dWMzcnJkZ21jVlpBbldGQnBiSzhRZStINzdMSlZEZkJvUFJNL2pjMktK?=
 =?utf-8?B?QWhkT3gydGVyZEVPVEJRMlFiZHhjdTBaTVZZK3UvTXR1KzFPakZZczl2Vkxq?=
 =?utf-8?B?M0NzUldTUjM0N1hER1R1a3FadW1JSWZLajZNTUFIb2x6VnExQVkvQ1JIYkRv?=
 =?utf-8?B?L1dXc3REYTBISEZleHVFaU5xK3RXUzJFZW5uYWtFSTljdGVjTk8wZld5WS9n?=
 =?utf-8?B?MFZCUzJXOVZoUm1SSU52ZjRybm4xQnp0enlvQVUrODN2eTBaNmk3SnJ0NjZy?=
 =?utf-8?B?MEJRUW5maytKcC9RYkNzRDR0d0hES1c3ZXpieDJxV2JyaGhyL0RJWXpIQ3BK?=
 =?utf-8?B?bTVteGx4akxPalBjYkNHbHRUVlkydTRyVEk5bU5rTTY1ZkxpNXJtUmRoRlZI?=
 =?utf-8?B?OU1FYVZXRWhhcVZ2c24yU0lFdHJVUi9iUGpjMjNYeWdxc2lndG0xZVZSSm1a?=
 =?utf-8?B?TC9xYnpCeGcvQW5xdVNqS2oyV1lGckJIVVYxdXNoS2ttczJ4UmZ0OHFIaXc0?=
 =?utf-8?B?YkdlNy9XUzhTdlZUVU9KcGlsN1A0RnN0VXVqdVRxYm9oZi9WZ2FNUTYwUDFB?=
 =?utf-8?B?SnBSSWJ1d2tvb1l1ZmZxMnZXOFpXaExtSE0xZE9kK2ZpZko3Ym5LeU94REk4?=
 =?utf-8?B?aFVGOW0wK0tib3JwZzRvMEFhN1BMa24waFBuMlN5WmhNKzVSemxaRzgzNTlL?=
 =?utf-8?B?MVNON1NkZ0RlQmZ2RlBublA2TWF5WDd0ckdsYXAyWnZkRW1xZ3h1dEYxdXNk?=
 =?utf-8?B?S1pvNEVJb0lXa1kyeHBGamQxWVlBOVVwc3pkS244ZmFoenNOQjhmZzRtUTc4?=
 =?utf-8?B?bEk1K1A0a1dmellMNzc1cGwzdERrZ0lDRGJTSnFKcHo0YkY4U3NwYWdQaThv?=
 =?utf-8?B?VEM3YzJnNUZoSGpvNzFnY1VYMWpRbHFrRzQwZmJkQzM4ZEpQUkJjd2pSdXI4?=
 =?utf-8?B?c2o1NzdqcFY0OVIrTnY3emdEakNoeG84K2U0L2E2QzdzaS9mb3duRGgvV2dW?=
 =?utf-8?B?bjJ1RjJycjJ3R0ZLcE1YdFlnS29yL1R4SHVieWxzNVBlbzhNbGZXTmJlUWNo?=
 =?utf-8?B?VFNxOFZrZER6WnpzakhPazRWbGVLTmpkVW9vV0liVVNlL0FHUW1XTXNCU3pi?=
 =?utf-8?B?Q2d2dlJEWkJOZGJ4eUxodlRIVEdKNGlsR0tWcWVzVEVIZ0pBeGdlSlNUdUZ3?=
 =?utf-8?Q?g8HRwqmoSYxRaRaSlVScaAE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E032842C63A9434795470A3C40A37AB3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2bdd4fc-bc85-42ff-aebf-08dc970577d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2024 00:01:32.0313 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kI/OpYS8OcJ/+H0TssRIPifdK52cj8QRIztCnHJjF2RZRjlT9XJbG7WVksCslh/7rXnSpUatG/Y8m90rde6Dw62JzLay+r64f/FZ60TknOQmyqdwQFT2uPYx3jX3whOp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8406
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

U28gaSBoYXZlIDIgY29tbWVudHMuIFRoZSBmaXJzdCBpcyB0cml2aWFsIGFuZCBjb25zaWRlciBh
IG5pdC4gQnV0IHRoZSBzZWNvbmQgb25lIGlzIG5vdCB0cml2aWFsIGFuZAppcyBtb3JlIG9mIGFu
IG9wdGltaXphdGlvbi4gSG93ZXZlciBidXQgdGhpcyBzZWNvbmQgY29tbWVudCBpcyBvbiBhIHBh
cnQgb2YgdGhlIGNvZGUgdGhhdCBpcyBwdXJlbHkKRlctQUJJIGZ1bmN0aW9uYWxpdHkgdGhhdCBo
YXMgaGFyZGVubmVkIG92ZXIgeWVhcnMgYW5kIG5ldmVyIGNoYW5nZWQgLyB3b3JraW5nIGZvciB5
ZWFycyBvbiBpOTE1LgpFcnJvci1jYXB0dXJlIGlzLCBieSBkZWZpbml0aW9uLCBub3QgcmVxdWly
ZWQgdG8gYmUgYSBwZXJmb3JtYW50IG9wZXJhdGlvbi4gVGhhdCBodW5rIGlzIGEgbG93IGxldmVs
CnBhcnQgb2YgZXh0cmFjdGlvbiB0aGF0IG1pZ2h0IGNyZWF0ZSBtb3JlIHByb2JsZW1zIGlmIHdl
IG1vZGlmeSBpdC4gVGhhdCBzYWlkIGkgYW0gbGFiZWxsaW5nIHRoYXQgYQpuaXQgdG9vLiBUaHVz
OgoKUmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50
ZWwuY29tPgoKCk9uIE1vbiwgMjAyNC0wNi0yNCBhdCAxNDo1NCAtMDcwMCwgWmhhbmp1biBEb25n
IHdyb3RlOgo+IFVwb24gdGhlIEcySCBOb3RpZnktRXJyLUNhcHR1cmUgZXZlbnQsIHBhcnNlIHRo
cm91Z2ggdGhlCj4gR3VDIExvZyBCdWZmZXIgKGVycm9yLWNhcHR1cmUtc3VicmVnaW9uKSBhbmQg
Z2VuZXJhdGUgb25lIG9yCj4gbW9yZSBjYXB0dXJlLW5vZGVzLiBBIHNpbmdsZSBub2RlIHJlcHJl
c2VudHMgYSBzaW5nbGUgImVuZ2luZS0KPiBpbnN0YW5jZS1jYXB0dXJlLWR1bXAiIGFuZCBjb250
YWlucyBhdCBsZWFzdCAzIHJlZ2lzdGVyIGxpc3RzOgphbGFuOnNuaXAKCj4gKwo+ICsvKgoKYWxh
bjogbml0OiAiRE9DOiBJbml0LCBHMkgtZXZlbnQgYW5kIHJlcG9ydGluZyBmbG93cyBmb3IgR3VD
LWVycm9yLWNhcHR1cmUiIHdvdWxkIGJlIG5pY2UgdG8gYWRkCmhlcmUuCj4gKyAqIEtNRCBJbml0
IHRpbWUgZmxvd3M6Cj4gKyAqIC0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gKyAqwqDCoMKgwqAgLS0+
IGFsbG9jIEE6IEd1QyBpbnB1dCBjYXB0dXJlIHJlZ3MgbGlzdHMgKHJlZ2lzdGVyZWQgdG8gR3VD
IHZpYSBBRFMpLgo+ICsgKsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGVfZ3Vj
X2FkcyBhY3F1aXJlcyB0aGUgcmVnaXN0ZXIgbGlzdHMgYnkgY2FsbGluZwo+ICsgKsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGVfZ3VjX2NhcHR1cmVfbGlzdF9zaXplIGFuZCB4
ZV9ndWNfY2FwdHVyZV9saXN0X2dldCAnbicgdGltZXMsCj4gKyAqwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB3aGVyZSBuID0gMSBmb3IgZ2xvYmFsLXJlZy1saXN0ICsKPiArICrC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbnVt
X2VuZ2luZV9jbGFzc2VzIGZvciBjbGFzcy1yZWctbGlzdAoKYWxhbjpzbmlwCj4gK3N0YXRpYyBp
bnQKPiArZ3VjX2NhcHR1cmVfbG9nX3JlbW92ZV9kdyhzdHJ1Y3QgeGVfZ3VjICpndWMsIHN0cnVj
dCBfX2d1Y19jYXB0dXJlX2J1ZnN0YXRlICpidWYsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1MzIgKmR3KQo+ICt7Cj4gK8KgwqDCoMKgwqDCoMKg
aW50IHRyaWVzID0gMjsKPiArwqDCoMKgwqDCoMKgwqBpbnQgYXZhaWwgPSAwOwo+ICsKPiArwqDC
oMKgwqDCoMKgwqBpZiAoIWd1Y19jYXB0dXJlX2J1Zl9jbnQoYnVmKSkKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHdoaWxlICh0
cmllcy0tKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGF2YWlsID0gZ3VjX2Nh
cHR1cmVfYnVmX2NudF90b19lbmQoYnVmKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgaWYgKGF2YWlsID49IHNpemVvZih1MzIpKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAqZHcgPSB4ZV9tYXBfcmQoZ3VjX3RvX3hlKGd1YyksICZn
dWMtPmxvZy5iby0+dm1hcCwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnVmLT5kYXRhX29mZnNl
dCArIGJ1Zi0+cmQsIHUzMik7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBidWYtPnJkICs9IDQ7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gNDsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgfQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoYXZhaWwpCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9ndF9kYmcoZ3VjX3Rv
X2d0KGd1YyksICJSZWdpc3RlciBjYXB0dXJlIGxvZyBub3QgZHdvcmQgYWxpZ25lZCwKPiBza2lw
cGluZy5cbiIpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBidWYtPnJkID0gMDsK
PiArwqDCoMKgwqDCoMKgwqB9Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+ICt9CmFs
YW46IEknbSBsYWJlbGxpbmcgdGhpcyBhIG5pdCBiZWNhdXNlIGl0cyBvbGQgbGVnYWN5IGNvZGUg
b24gRlctQUJJCmNvZGUgdGhhdCBoYXMgYmVlbiB3b3JraW5nIG9uIGk5MTUgbXVsdGlwbGUgeWVh
cnMgYW5kIEkgYmVsaWV2ZSB3ZQpyYXRoZXIgbm90IGNoYW5nZS4gQW55d2F5LCBhZnRlciByZWxv
b2tpbmcgYXQgdGhpcyBibGFzdCBmcm9tIG15IHBhc3QsCmkgcmVhbGl6ZSB0aGF0IHRoZSBmdW5j
dGlvbiBndWNfY2FwdHVyZV9sb2dfcmVtb3ZlX2R3IGNvdWxkIGJlCm1vZGlmaWVkIHRvIGRvIG11
bHRpcGxlIGJ5dGVzIG9uY2Ugb25jZSBzbyB0aGUgY2FsbGVycyBkb250IGhhdmUgdG8gY2FsbCBp
dCByZXBlYXRlZGx5IGZvciBlYWNoCmR3b3JkLW1lbWJlciBvZiBzcnR1Y3QgYmVpbmcgZXh0cmFj
dGVkLgoKc3RhdGljIGludApndWNfY2FwdHVyZV9sb2dfcmVtb3ZlX2J5dGVzKHN0cnVjdCB4ZV9n
dWMgKmd1Yywgc3RydWN0IF9fZ3VjX2NhcHR1cmVfYnVmc3RhdGUgKmJ1ZiwKCQkJICB2b2lkICpv
dXQsIGludCBieXRlc19uZWVkZWQpCnsKCWludCBmdWxsX3NpemUgPSAwLCBjb3B5X3NpemUsIGF2
YWlsOwoKCWlmICghZ3VjX2NhcHR1cmVfYnVmX2NudChidWYpKQoJCXJldHVybiAwOwoKCXdoaWxl
IChieXRlc19uZWVkZWQpIHsKCQlhdmFpbCA9IGd1Y19jYXB0dXJlX2J1Zl9jbnRfdG9fZW5kKGJ1
Zik7CgkJLyogd3JhcCBpZiBhdCBlbmQgKi8KCQlpZiAoIWF2YWlsKSB7CgkJCS8qIG91dHB1dCBz
dHJlYW0gY2xpcHBlZCAqLwoJCQlpZiAoIWJ1Zi0+cmQpCgkJCQlyZXR1cm4gZnVsbF9zaXplOwoJ
CQlidWYtPnJkID0gMDsKCQkJY29udGludWU7CgkJfQoJCWNvcHlfc2l6ZSA9IGF2YWlsIDwgYnl0
ZXNfbmVlZGVkID8gYXZhaWwgOiBieXRlc19uZWVkZWQ7CgkJaWYgKGNvcHlfc2l6ZSU0KSB7CgkJ
CXhlX2d0X2RiZyhndWNfdG9fZ3QoZ3VjKSwgIkJ5dGVzIGV4dHJhY3Rpb24gbm90IGR3b3JkIGFs
aWduZWQsCnNraXBwaW5nLlxuIik7CgkJfSBlbHNlIHsKCQkJeGVfbWFwX21lbWNweV9mcm9tKGd1
Y190b194ZShndWMpLCBvdXQsICZndWMtPmxvZy5iby0+dm1hcCwKCQkJCQkJYi0+ZGF0YV9vZmZz
ZXQgKyBiLT5yZCwgY29weV9zaXplKTsKCQl9CgkJYnVmLT5yZCArPSBjb3B5X3NpemU7CgkJZnVs
bF9zaXplICs9IGNvcHlfc2l6ZTsKCQlieXRlc19uZWVkZWQgPS0gY29weV9zaXplOwoJfQoKCXJl
dHVybiBmdWxsX3NpemU7Cn0KCndpdGggc29tZXRoaW5nIGxpa2UgYWJvdmUsIGNhbGxlciB3b3Vs
ZCBvbmx5IG5lZWQgdG8gY2FsbCBvbmNlIHdoZW4KZGVhbGluZyB3aXRoIGRhdGEgc3RyYWRkbGlu
ZyB0aGUgd3JhcGFyb3VuZDoKCm9sZCBjYWxsZXI6CglyZWFkICs9IGd1Y19jYXB0dXJlX2xvZ19y
ZW1vdmVfZHcoZ3VjLCBidWYsICZnaGRyLT5vd25lcik7CglyZWFkICs9IGd1Y19jYXB0dXJlX2xv
Z19yZW1vdmVfZHcoZ3VjLCBidWYsICZnaGRyLT5pbmZvKTsKCm5ldyBjYWxsZXIKCXJlYWQgKz0g
Z3VjX2NhcHR1cmVfbG9nX3JlbW92ZV9ieXRlcyhndWMsIGJ1ZiwgJmdoZHIsIHNpemVvZihnaGRy
KTsKCmFsYW46c25pcAoK
