Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E21CCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 20:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A63210E65E;
	Tue, 28 Oct 2025 20:10:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VULgjGYf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5BF10E65E
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 20:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761682220; x=1793218220;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=zf0KLMcX3q/cO2lLulp1WKK46cerl/TlKoi9TvmlIYI=;
 b=VULgjGYfFuisa4dH2ByljzKfZUTYoRGHwDjfXsg6QC1ZxwcWGe3g95Kk
 lSb6+xH06rBHGNluWGRnHO5ahym17rGKX5OeXbR9ENmaXvi2YtwoTaMxP
 2pYlNEOksFtrKaYDJV2tGITbQtQPOG1+09HJsAaGbN7tNxsra/YSBVCdn
 74blAutvP5lOB9ESMESyw5O/QlUhPODsqBFKaly2+mHyolzMEzy1X4MGg
 0eiyHW8ub2Izl2Q0YNzv8eOsvIdkml/OzNdMuM8ZM3fp2fEggyLO8IZGM
 9Mw/jpfw5+BdnwukkC/mNYRi7z/mIuuTmxlU40yWBRU22wSSzvVSvSjOU Q==;
X-CSE-ConnectionGUID: eUbUgXeISCWs+ORxxrWnTA==
X-CSE-MsgGUID: tEddxKCnRZinFV+NowHnjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63000607"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="63000607"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 13:10:20 -0700
X-CSE-ConnectionGUID: v8SqcHyaTLK2uA7nXOyQHg==
X-CSE-MsgGUID: lHpiC2hXQU+VFRLM+YN7+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="189763732"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 13:10:19 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 13:10:19 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 13:10:19 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.27) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 13:10:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBDZ1hAnu30F3eOFgaBoaeQdCe7TBnMCnT7Wjc+qGOdcZ4zbViQWKisLSd1jr3EkMapIkWbWmGWLjNLBaHYH0S259GoY90KW+08jFop+awr/hTUpFSspucoYpSNnAmbp7OtY4OJ0u2s12h/5Ek5Xy45lTy5/OxM2dLVOuJ8GKi/r7KZxF+FJn1bjPlzOacWAh7Rx1iCYXFwJO55PR8cTNGhhJ88wRshMu9WLgT+xeHhjREnrMY30WrW+TNLnTOiL61v55L68ssl2JBjX0pPnnoJv1Aing41FdKXWCzpx+gQ3u9IYjjn2Qg2TmgNFmb1nwH2rxc1XAgR8pH3a/8b51A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zf0KLMcX3q/cO2lLulp1WKK46cerl/TlKoi9TvmlIYI=;
 b=K54RClbS9bzw/6HLoHsMEUrQFQVGYDyheo8Ra0AVL8tVssXO958VwWYbT9u6XHuN1ntz3AYWaUcizo0dWJBw1Vnqs8IX38MbjSa6yp8TkaQPMTiNdrnioSU4DydyP9CUM7kAgh/tw0wDWT81qGBs76/W9rSdQEvJDcXrqLdqTVKdYt5yTD8ruHkczSZ1k2NJLoj8XzL42aCVOoWG4NgSXhDekpBDu7au4U6y79giN1p8qnGOqVOvr3fWtW33ykNtChqdoUHGIREsOshULHV5hxdxt20LQ0oyWljUWtUTbZxJvxW3VafbNVVYOF/1jobrserHOTeZ8DF81IpapFAXWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DS7PR11MB5991.namprd11.prod.outlook.com (2603:10b6:8:72::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.19; Tue, 28 Oct 2025 20:10:14 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9253.018; Tue, 28 Oct 2025
 20:10:14 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Atwood, Matthew S" <matthew.s.atwood@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, "Dong, Zhanjun"
 <zhanjun.dong@intel.com>
Subject: Re: [PATCH 2/6] drm/xe: Add a trace point for VM close
Thread-Topic: [PATCH 2/6] drm/xe: Add a trace point for VM close
Thread-Index: AQHcR2wi/7+5ZCsBOEWWctG4NnDBaLTX/OaAgAAB/QA=
Date: Tue, 28 Oct 2025 20:10:14 +0000
Message-ID: <a21b64aaf404b636813ce7ece1bd241312243287.camel@intel.com>
References: <20251027180412.63743-1-stuart.summers@intel.com>
 <20251027180412.63743-3-stuart.summers@intel.com>
 <aQEhefuB156VhuSd@msatwood-mobl>
In-Reply-To: <aQEhefuB156VhuSd@msatwood-mobl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DS7PR11MB5991:EE_
x-ms-office365-filtering-correlation-id: a8ac3f85-c522-467d-b763-08de165e018c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?bE56TUdjYW9PMnpPTlVZd0xObHVLWHlrbFM4QWsxYXEwTHdaQWoyd3FldGN4?=
 =?utf-8?B?TG4wU3VzY0FPdUJ3MzlOL0hXT3FQdmxqL0ZYSHZqWTMzQ2RKNHEwdkVZWWpT?=
 =?utf-8?B?NnQrRU45aG53YkxyWVY5OHNnVzVNS3BJSEkzRTVFcVJ2QkdzeDRzRW9FU21Z?=
 =?utf-8?B?dGVlc3ZBK1p4ckNSQTR6ZnZqdWFXT0daZC9jNWgxMDFyT3FwbnJJTm14MXZK?=
 =?utf-8?B?NmdybU9laTFrVm5RRGJDaE5kSXJqN2JzVVVhdHFkNXpRZnE0MXd1dWV6QWJ6?=
 =?utf-8?B?dzBKeGNjY2dUTjgxVlM0azA4YloyN1pPeXRUSHVQNmhNQklCNkZWMkZPQ3Zp?=
 =?utf-8?B?OE5FVHVLQ04zMUFiVWlKTmNxMm1Ia2ptWlZnMmVqRlB0NDFXcjF6QldMRnlI?=
 =?utf-8?B?Q3JLYXBzRWdoY2RqVUNTM0loQ21vbVkvem4yYWVYekdUYnMwZHVpR0p0UDU5?=
 =?utf-8?B?eEU2ZVFsS0NNNC9JSStjNHlaNEVFMDg3QUE1RHl4Y1pUSmxRaFpabXNIMFl4?=
 =?utf-8?B?dWc4b1BsbWdNR3MwU0FHS21kbFhHVUhKNVdsdmJrc25uZTcwV3JmMS9WOGF5?=
 =?utf-8?B?L2UwYld2NUhnaVFEMVUvSnF1aENPTDZSNnlEd2IrOUpOOGxYbnlhS2Q1MFdj?=
 =?utf-8?B?WDIybEFTYWNOd3RwdFpJUG1vb0lMM0xCMklrLzJlRm9DNDNoaDAwZ2lJcThS?=
 =?utf-8?B?NldnRWVvVDhOUm5hSThtVnRYcFhnckRMY25sY1p6bmJQbWMxQysyREEwRnQ3?=
 =?utf-8?B?VWxaQ0tBditBRUc5S21UczBjVHVjVFAxY2h6bTRwVElqblRESUpDKysyTFRx?=
 =?utf-8?B?aUZ2cUU1YU53d1pRRGZ4ODF5ZmdHQS94MVB4cEtvU0hIcFlaNkliakhHeERj?=
 =?utf-8?B?Y3IvaWZ4MVc5aXlPSUpxN3JBNVIxZjdZdm43dlQyL3VYWmxzTWk0STg2RFB2?=
 =?utf-8?B?cktPd1JoZ2dsZlNUVEZEUXdCRCtnUnJmUW5BU3dSRzFUblQ2TUY4Ymw2UWMy?=
 =?utf-8?B?dEdZVmc1TEttOGJRZk9KYXN5Sm9MZ3hYUm1WSERnZVJMMTJlVVVzQ0NwMDl0?=
 =?utf-8?B?NnZCWGxvK2FtQWpMRTduZTIwZFFOQVFGRmxVSnpvRDc3eGhzY1VSeC9Uc21u?=
 =?utf-8?B?MHh6Rk1WWVNnbjJJajk5azlWSEl3SWRRaG9zQlhmcWhpMG9aUyt4cHlaTlhi?=
 =?utf-8?B?REVxbzlOTmhBSkJGNkhCN2xNQW11ZlNBUklFMjNiZnR3S1pocUNXZTRydG14?=
 =?utf-8?B?bHRJNnhjOHZYL1R2VUI1N2dxWXMyTzJ5VjUybS8xKzFHakxkMjBTdXJZbHdz?=
 =?utf-8?B?ekhJV1pldWo5VnV6UHJkd2NZMlVYT000TFJ5RUw1TElyNE52YndSRjcrZ1Rh?=
 =?utf-8?B?T0tNZVN3aXJVakpoZHRQZXlRakZaTlN4dCthYm82VHNQUk9vZjhDbTRsb2lx?=
 =?utf-8?B?S1djRFRKOEg2QzZKNEJJU3RnNzlqVlRDRHF4VXN5WWVodkozMys3dkpKekk4?=
 =?utf-8?B?S0NnVlo3L0hzazhKaUs5Y0hWL3RWdUN1OFJteVBxcVkvdEE0RVdaNXUvWGht?=
 =?utf-8?B?Y3dlaHdVY0NFakQ2VER5MVBiNkJzMFk3UDRkcHZKaEVseXdINGhOdHFaQWND?=
 =?utf-8?B?QVc2VXZZVUM4VXgvUFdVSlZsZWNOWUxKSnpVT0ZwY1VJUmxOVmNZaHY1bXNz?=
 =?utf-8?B?aFhtaXVHNzk4QUdsUVFmWFB6S1dhcytJOWRpcERpUkJMYnRJNkM0LzhkdmlW?=
 =?utf-8?B?MFFlcWVPS1c3RWZiaUFheE5WdTJNZnFFK1dZSHNYaFFIYnJ1ZUZiZGVobkdW?=
 =?utf-8?B?eVdFRjJmdWljV1B1RHU5TDhMNWMrcHFWcUZRaFNGQ1Vtc1IyYTRXckU0dmd0?=
 =?utf-8?B?YW0xVmlQZzFTcHNMTkt1RHF5c2lyZUw1OW55K1E3eVFGaHJSdUJJeTFSSUd2?=
 =?utf-8?B?R3dJVWRndS8wa2xGUEZYYzhxK25JNFg2bVByeFVwNkYyV0tvbFBBUlJ6REtv?=
 =?utf-8?B?dVk5UWlYdzRiVWc4SGNwN0dQaDBZYk85amJxNWhBZy9nUUtWVTQ1Q29vY1U2?=
 =?utf-8?Q?XQ9W+u?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SXhXMGFpdm8zTTl6cEJPSzZhR2ZnTlVIdmhjTWZMWTczeW9kRlkwaXE0b0lI?=
 =?utf-8?B?UENjSExDL2lYTUw1UTducXdHblNwazMzT2w1RDQ4MDhaVTkyVG1UcjZmK2tk?=
 =?utf-8?B?ZW9vclVYd1VmSGhheFZXbWticmswOWJEV2hMQ1NZWWdnb3NDemJYTmNac2Vp?=
 =?utf-8?B?RTYraFRpKy9mUi81WXkrRUN0cS9RWU1ycmo2VFNFT0dVbWlWdmdOakFIK0s1?=
 =?utf-8?B?Q3BaZHVadFp1UnRjb0M5NEdtNDE2aGFEVzRuMFN5NUNTUHRybUpmRnkwTW13?=
 =?utf-8?B?amtJVEpQbitmM1FxTkVRdkE3SGFnb2E5VmV0TGF1ZHF1STJtM1BvV005d0dk?=
 =?utf-8?B?a3lEOW85U3Z0Zk9tbXN4RnJxMmJUcy9kSmlidFJ6VmZKWG5FTS9lZ2g4K2hD?=
 =?utf-8?B?M2VGbTZpK2dkdDZlTklHc0hyNXdwcFhOWk5tNENOKzFBUGJLeWRlMDVPUHl2?=
 =?utf-8?B?eWRwS2RxYXRqMVlWdmRJTng0aXhIWWIxRDY4WHl4STVldTI3bmNtUkN1TDJF?=
 =?utf-8?B?S1FjZWNvM09NVUtab2NMZWRPWWpPOWlnd3N6ZndYVDFKa0owZVloNkltZ2lR?=
 =?utf-8?B?VVF3dUdCdElibUlia21Cc0ZhYVZqcmFpdDVXYUVaNlUxUERpU2x6bmdQMi95?=
 =?utf-8?B?ZEh1Z1JTWjUvOE1WWFFGb1lGK3JUQ20wdjZRK2Jadi8wbVNkb3JrcjEwbFRF?=
 =?utf-8?B?eW9uaUNvbGpTRWwrUkpiblp6RmwxMElJSTlGMXVwQm9ETTNqUVQ2T2lheTds?=
 =?utf-8?B?bXpqUVovUjdaOWZRWkpTY2llNmFGeGtCbEdtVFNEOTdpdFc1NFdsNWNvQWpr?=
 =?utf-8?B?cHpHK3A2c1FrVzN5WnFlYTd3KzNxVEwxUENpMG8wYXRpSklyekUwSFpMc1lz?=
 =?utf-8?B?TE9QRG5QNEdGU3VzNWlFL25XajlPK1lhWlVaVVVYRnVmTkJVTDlTb0pxQmV4?=
 =?utf-8?B?NFYwbUNqbnJ6eHlvdWJTZWpIaUZhNUJyTVhTZWdBQjVtK3dteHFHZ0xscjJl?=
 =?utf-8?B?eS82M3IyQ25WMVpwa1VwblZQbDlEZHNuYVQvMlZvM0tzdFBTaCt6QzJRRE9n?=
 =?utf-8?B?cnc2aWlnSHNBQTJxNGlDTHUzd0kvZWZtUDlodiszK1c3SmZtV01BTWo3M3h2?=
 =?utf-8?B?MVFzQU5BdzZmWEl2bjFQalY5bUJVT1N3ZjVNWjE5WHFJa1VpOWQwRDNGK1Jv?=
 =?utf-8?B?bXY3cG1DemxhUGdadVhxMkFhTzFrMEdKbExGbmpLSGROdEYyWkVMSDVXVDN2?=
 =?utf-8?B?VTJRdHdZREt4dmZXTitxcVlEQU5ydHFuL2RxekNaZ3FSUEpRa3NSVVd2VXBE?=
 =?utf-8?B?bHdBUmh6VVRZdXpaQXM0cWozSFFnb2M2MW9QVEZMUGgwdE1IZHNMS3FjNFYw?=
 =?utf-8?B?VzVHZjdGQXN1STFUaDZLNmJiOEhmUUZZNmo3WlBidHhPeTdQKzBiYTh2Nk9k?=
 =?utf-8?B?NWFZclJ3cGIxQ054TGxUanBWaHRvSVVrVEJVRFNRSUR2RVo0dTBzQ2ZQQnVP?=
 =?utf-8?B?b0xWeTdpY05EcXpEZVVkZHRRMXB1Yk54aEJibW85RmZ5Y00rMG1RWkFZS2gr?=
 =?utf-8?B?VUJ2SExLUUsxaEt2R20wQlFhMUMyT1FlQVRSOXZFWmVWRTJPSTRGZE0wTUFk?=
 =?utf-8?B?dktSM05aZXFtdCt4VHM4dmlJYkxvaHI3QllHOVQ2S2FCTFRyRWM3UmN3dHV0?=
 =?utf-8?B?ODYxTlJUUlZZU2J6Y2gxcUlEOWt2R2NlTEZQTzR6RkhXaGpTTUdJQlBRTTNy?=
 =?utf-8?B?NnQraWlqQWZwZEJOT0g3aGVWV3hQYW5jR2JSVjBzYlRvZWhVQ0h0cVVaSzFE?=
 =?utf-8?B?dkE2S2tXVWxYM0NUK0YrbjJFU1VWaERCaFoycDZtL0N5QjB2djBxZzd6b202?=
 =?utf-8?B?Y3l3QUhhd3Ireld1OVVoaUdNYndVbmsrZzY2T1JjVGRVVzBrajE3d1gyZEE2?=
 =?utf-8?B?TmJRcUUvWFU1bEFQMVBxdnh4SDByRUhrcGlGZi8vdlJ3amlVQVpWUjZGWmow?=
 =?utf-8?B?b0tCT3M5czFudlhQK2FDSG12S0dKTlVqVTFrV0NBeGc1ckc2L2hpTkh1Y3lR?=
 =?utf-8?B?aDhBKzl5bUlveW1yeENQZjhRNGZLMEtNczJLQitjZ3BkYzh6ZW1tcEtqbUZi?=
 =?utf-8?B?U21mei8rTHZJZFA5RlNIVlVEb1czV1h2Y3RodmFuV0tZL3ZCRFZLTHhlMEJ5?=
 =?utf-8?B?eGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD6E893FC68E1F4EB5230CEA7D54C8E9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ac3f85-c522-467d-b763-08de165e018c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 20:10:14.1816 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LR5aO5Thjkifi4oTPhGau9XcavijsvfDUqRpBUaap3L+iLvFZWm/lIbRVE4KZcJYYXYJRypKXOOzVNbqpm7dlhnQbdL2dD89Xuqfyc1I0To=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5991
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

T24gVHVlLCAyMDI1LTEwLTI4IGF0IDEzOjAzIC0wNzAwLCBNYXR0IEF0d29vZCB3cm90ZToNCj4g
T24gTW9uLCBPY3QgMjcsIDIwMjUgYXQgMDY6MDQ6MDhQTSArMDAwMCwgU3R1YXJ0IFN1bW1lcnMg
d3JvdGU6DQo+ID4gQWxsIGJldHRlciB0cmFja2luZyBvZiBlcnJvciBjYXNlcyB3aGVuIGNhbGxp
bmcgdGhyb3VnaA0KPiBzL2FsbC9hZGQNCg0KT2sNCg0KPiA+IHhlX3ZtX2Nsb3NlX2FuZF9wdXQo
KS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1l
cnNAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RyYWNl
X2JvLmggfCA2ICsrKysrKw0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmPCoMKgwqDC
oMKgwqAgfCAyICsrDQo+ID4gwqAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQ0KPiA+
IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdHJhY2VfYm8uaA0KPiA+
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RyYWNlX2JvLmgNCj4gPiBpbmRleCA4NjMyM2NmM2Jl
MmMuLjIzODMxMWNmYjgxNiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
dHJhY2VfYm8uaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90cmFjZV9iby5oDQo+
ID4gQEAgLTE0LDYgKzE0LDcgQEANCj4gPiDCoA0KPiA+IMKgI2luY2x1ZGUgInhlX2JvLmgiDQo+
ID4gwqAjaW5jbHVkZSAieGVfYm9fdHlwZXMuaCINCj4gPiArI2luY2x1ZGUgInhlX2V4ZWNfcXVl
dWVfdHlwZXMuaCINCj4gVGhpcyBkb2VzbnQgYXBwZWFyIHRvIGJlIHJlcXVpcmVkIGZvciB0aGlz
IHBhdGNoIGFuZCBzaG91bGQgYmUNCj4gaW5jbHVkZWQNCj4gaW4gdGhlIHBhdGNoIHRpdGxlZCAi
QWRkIG5ldyBleGVjIHF1ZXVlIHRyYWNlIHBvaW50cyIuDQoNCkhtLi4geWVhaCB0aGlzIG11c3Qg
aGF2ZSBiZWVuIGhlbGQgb3ZlciBmcm9tIHNvbWUgZGVidWcgSSB3YXMgZG9pbmcuDQpTb3JyeSBh
Ym91dCB0aGF0ISBJJ2xsIG1ha2Ugc3VyZSB0byBjbGVhbiB0aGVzZSB0aGluZ3MgdXAgaW4gdGhl
IG5leHQNCnBvc3QuDQoNClRoYW5rcywNClN0dWFydA0KDQo+IA0KPiBXaXRoIGl0cyByZW1vdmFs
Lg0KPiANCj4gUmV2aWV3ZWQtYnk6IE1hdHQgQXR3b29kIDxtYXR0aGV3LnMuYXR3b29kQGludGVs
LmNvbT4NCj4gPiDCoCNpbmNsdWRlICJ4ZV92bS5oIg0KPiA+IMKgDQo+ID4gwqAjZGVmaW5lIF9f
ZGV2X25hbWVfYm8oYm8pwqDCoMKgwqDCoMKgZGV2X25hbWUoeGVfYm9fZGV2aWNlKGJvKS0+ZHJt
LmRldikNCj4gPiBAQCAtMjIzLDYgKzIyNCwxMSBAQCBERUZJTkVfRVZFTlQoeGVfdm0sIHhlX3Zt
X2ZyZWUsDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFRQX0FSR1Modm0pDQo+ID4gwqAp
Ow0KPiA+IMKgDQo+ID4gK0RFRklORV9FVkVOVCh4ZV92bSwgeGVfdm1fY2xvc2UsDQo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgVFBfUFJPVE8oc3RydWN0IHhlX3ZtICp2bSksDQo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgVFBfQVJHUyh2bSkNCj4gPiArKTsNCj4gPiArDQo+ID4gwqBE
RUZJTkVfRVZFTlQoeGVfdm0sIHhlX3ZtX2NwdV9iaW5kLA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBUUF9QUk9UTyhzdHJ1Y3QgeGVfdm0gKnZtKSwNCj4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgVFBfQVJHUyh2bSkNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3ZtLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+ID4gaW5kZXggMDBm
MzUyMGRlYzM4Li5lMzgzOTgyYmFkOGEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3ZtLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiA+IEBA
IC0xNjcyLDYgKzE2NzIsOCBAQCBzdGF0aWMgdm9pZCB4ZV92bV9jbG9zZShzdHJ1Y3QgeGVfdm0g
KnZtKQ0KPiA+IMKgwqDCoMKgwqDCoMKgwqBib29sIGJvdW5kOw0KPiA+IMKgwqDCoMKgwqDCoMKg
wqBpbnQgaWR4Ow0KPiA+IMKgDQo+ID4gK8KgwqDCoMKgwqDCoMKgdHJhY2VfeGVfdm1fY2xvc2Uo
dm0pOw0KPiA+ICsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgYm91bmQgPSBkcm1fZGV2X2VudGVyKCZ4
ZS0+ZHJtLCAmaWR4KTsNCj4gPiDCoA0KPiA+IMKgwqDCoMKgwqDCoMKgwqBkb3duX3dyaXRlKCZ2
bS0+bG9jayk7DQo+ID4gLS0gDQo+ID4gMi4zNC4xDQo+ID4gDQoNCg==
