Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6384CC5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 19:31:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2085110E8CF;
	Tue,  3 Jun 2025 19:31:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m/yDS8Cg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2752410E8CF
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 19:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748979090; x=1780515090;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/zw9puRjIe3F1EB6ifc4cqQrE+RV4V6vOxdUW2zoW7g=;
 b=m/yDS8CgIauxCgU9VOrDaoxSLJgBOP0M3vdtG3dXBhGjA8qlVd4AsCU/
 MypwF9UJOeSV31PK7tsLOGfsIgqrqa2c+d85Dl6CcFZglSHgtv2NZQitj
 eSbTfkrADnISA1k8udIpz0qre485Eqch48TGZUgWUd7onwnMbaXuaXFJN
 T260S2FWobPOy4d5kBA/uJg6LrlhlWDabvu2LJt73k9R+fGqWF/jfcI4n
 7FejuIJHjsMiZtECxJQFW6YdTCztw1CN1SQ8DgDuj5KRObL/p5VaR+12u
 /eoxpnQj4iA2Ul86XBxJqvb3fkqNgq9UgRUHtkWkbpWfe/YMU0nfugT5t A==;
X-CSE-ConnectionGUID: QRuN4tY3S9Sr9BNa1iYldw==
X-CSE-MsgGUID: VioFtjv3Rhi63qiPKcFN1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="51136977"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="51136977"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 12:31:30 -0700
X-CSE-ConnectionGUID: oZfx9/49QJW9vtKTU45PFQ==
X-CSE-MsgGUID: E01PdT00SqShz8vIQ5tUHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="149734632"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 12:31:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 12:31:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 12:31:29 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.70)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 12:31:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=El1/U/xLqIoMOeEk5jeQ793yTN2Diy7Vtf5BJRetTuYNX9d0aFZiYsNBszG9A/zXV2PTVAvXKRVhxQMftAjdMyElQL3tHodYiga5AmzRV+DcYbPwT0NrJpTDmk9TPRrNtI6DIylSdDZwSAyPpRg/AVevxceRhpUycWqZ3QzHowu9pbxtwyzxaKBU8Ef9SEAZ8sIBIo9zZF2wQFaM/QzServ2845qn4KMmotcUXQoOM9x9XKscVq80BpHbkZjTl+B/TgfxjucDwLzXPjWxkBiFuqP/JCCgF5PQogh+m3ouHDojOqKqdB9kPxB97AeMoa3gOrqk9qfIqmmR3gjUUJ4Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zw9puRjIe3F1EB6ifc4cqQrE+RV4V6vOxdUW2zoW7g=;
 b=nPQ2605TmROanjoAbCMQZyD218L03JTDJjDkHKdjXP6mdZZGEZJ56mcWshpDF0Rn4+JQIhXJYiQkZMcCSYV7dUuAf2GAJngwJ48kG6nMrA4Rfp+bpPppqmxj40q5E02LZKCq9FGxB8uYONHuQsJ9uTYXfHvHfvBe+GkGS8CjKCLZIJzAoVQsw5nEzRqev8TX058hgH/rzEwJBfxehEFPqp8wqEVo/PZ8LQ00h5HplsQLmsdGuHDd+vbE63Qwko0HoTdTKUS6dZZiKHtZNkzBTq1564HOtNhmAjXTS48C/7bKB6PhnpR2fViVw/NTC2FBxL+KQJboqfbvyqwWfVrXeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 IA3PR11MB9446.namprd11.prod.outlook.com (2603:10b6:208:582::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 19:31:22 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%6]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 19:31:22 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 1/4] drm/xe/bmg: Update Wa_14022085890
Thread-Topic: [PATCH v3 1/4] drm/xe/bmg: Update Wa_14022085890
Thread-Index: AQHb1Bi2Rz7m/s3aGk2VJ2AWxoSwWrPxs8qAgAASW4CAAA3TAA==
Date: Tue, 3 Jun 2025 19:31:22 +0000
Message-ID: <8afdac13617376dd5c9151e832921b5993443243.camel@intel.com>
References: <20250602234415.2015921-1-vinay.belgaumkar@intel.com>
 <20250602234415.2015921-2-vinay.belgaumkar@intel.com>
 <85316ce01b40c0cf8775833c29c4843bbf281315.camel@intel.com>
 <83ec77ee-1aed-4926-866b-e1a6301109e2@intel.com>
In-Reply-To: <83ec77ee-1aed-4926-866b-e1a6301109e2@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|IA3PR11MB9446:EE_
x-ms-office365-filtering-correlation-id: b8bf79a7-3a0a-49e6-4629-08dda2d538e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?a0FxK0t2S0V1U0toUkVCMk01RkN4T0tIQ3NjRjd4QjIyVHBveUREK1BqcWMx?=
 =?utf-8?B?c0NCbmhGcFdab3ZNWEIwTTBXdVRzOUZYSUdIWjcyOXBVZC92cG5qdk85RDdF?=
 =?utf-8?B?cHdxQVZHN3pHWUhMdGE0ZXl0MWZGRnE3Z3FDVHl0aWlDb2JiZVdjUmFWWEdv?=
 =?utf-8?B?UFV0RmZBelhmM2prVDFSNGxyNnBIZUI4RGt5YXdSMVFpTThhc2paSGhWNExo?=
 =?utf-8?B?S055aUp3NmJZTExUeUJ0RWJjYmRZR1AySjFyd00zcGt4RGVNUlNqelVsL1Ns?=
 =?utf-8?B?RTQrYi90SXRCOWRIRENyNS91eUpVRnduckhROW5mZGNOR3BaTXBwT2JMM2ZD?=
 =?utf-8?B?MUQxL0h6Y3d4VkcwRHR2WnNQNWRsN05rYmJLTlB3a2pBUFZQSUlxdXFmUlo3?=
 =?utf-8?B?amt5eS9COGRHSGk4YVdCZSttaTlPTEF2d3hFMy9YejMzNDFVZlZaTS8wLzhn?=
 =?utf-8?B?S21JUHlJRFBpYXZMU2padHlTWHR0TW5ISCtHaGRDclV0eUlkc1FKUTVKWHdr?=
 =?utf-8?B?WDRnS0xNSXQ5WXJUSmZ2STNhVlhrQzFFTWJXY25ZTXl1c1h2WDRSc2RHQlA3?=
 =?utf-8?B?N1ozckxtNWxVU3RmS2NiRXZ3RW56bzFHd3p4ZFVkU3lLL2VmYW9nQzhSSHRo?=
 =?utf-8?B?NHBkYnZCanY1WG1ELzRuYkVscjdGQU4zbUpQYWkyZFU5Z0UzYU9KRUdmT3NN?=
 =?utf-8?B?aERZeDkwVkhCaGJlMzd2SitJYnJyQjQ3dWZYQzBlbjVTbEI0MUszYW5SbmNr?=
 =?utf-8?B?SDhVL1VXLytRWFRsYkVPQ2FTVUxTNDluUkRXM0xpTVlqWlZkYlY5cGUvTk9L?=
 =?utf-8?B?ZXpwUldtSDdPQmF1YXo4bzhuZkt0YzVESHozSmRLRjFqQTA5dk9EcW9zbS81?=
 =?utf-8?B?ckdydTBVek96QURlS1lteEpaUkZ2MjBhK0dWM1VSYW1mYnMxamJUQmRqRGZu?=
 =?utf-8?B?MlFZci9hcGZUdkljMUdPR1VmSWNEWCt4c2xOdm1zcmdTM05IN0RYTTNIZ3l4?=
 =?utf-8?B?T3I5NmdmN05YUzdzbFNlMW53QnlBYnUvZFNJRGdPQkRiNSs3eC9vWm8zWG11?=
 =?utf-8?B?d0NJcWJXUWZNMW8zTWFZUWVxMWtPR1o4VHVoSWZDWVRyWXpzNXZLL1VHSlpR?=
 =?utf-8?B?MGtFZkFvVkd1eHpOc0h5RWc2Q2J6V3FUenlyUnFjaHpwc3hRRE4wMGV0aDA2?=
 =?utf-8?B?eEFIUDJxcitLQjA3U2hpOUdhRUlGMExMMUVnZEIzdUl1aUhkYk5sOWUzbGdR?=
 =?utf-8?B?UmdOcFJLMndNNmFPQm9Ua3FnME5JMmNadXZwcTl6aHFOZlB1MW1YMWEyakFQ?=
 =?utf-8?B?VmVOQ1VDdGJlMmx2SjA1Ym0xM2t2TkpjY0Jsek02SGY0VUl6eWhTYWRHNUtr?=
 =?utf-8?B?OTMwMTBzTXExSUxBOWRURUZvbmU0R2t2dzF1My9JZlFseGZHek8yUmFQSHNp?=
 =?utf-8?B?NjErVnRramJzRTVMbUZ4QzQrNFMwTW8rZWwwN0E5TW9HcVIrdkdPRlN5c1N6?=
 =?utf-8?B?VWRQQVdiM21EdHZrb2ZGZmhPeFYxc1VZck5WakIzRGYrelBXSnFsN3RGczZE?=
 =?utf-8?B?empEZXduRXBVclZPVHk5SytjeGE3WkVPTDhBR24xTHFZRXY4TFRQNk1UVzFP?=
 =?utf-8?B?b0Q0VVBXcjBRWnlFdUpValJFNTJMTkFjcy9IRldkVmNXZlhOQyszY3hveHV4?=
 =?utf-8?B?QlRWWGwxSGRVbjl4eEowRWNHOXFLNVI0YkIrbG1tT1ltWi9FRXRHeVF1M0xq?=
 =?utf-8?B?UDd2SkZWRHVHTDVvSFZBdUpmMzVRdXVreTJqUld5Q0FreDloeXJsb1dTNVcy?=
 =?utf-8?B?Ujhic3VNaWhqcVJaM0hJWEFzWHpPMDA2Y0dpcDZyOHI1bnArMERYWmRtVmpj?=
 =?utf-8?B?NWRSdGppR0U0TTNWc3R0TjN4dGtrL0hwNzYrNmNiTFhSN3A0Y0NGejNhNmNo?=
 =?utf-8?B?UlVJZkRtcDJLWUFNLzQxZHZ5elg0NVlmYWVNVi94cGJDbXk5OUdnS3hiV3Qz?=
 =?utf-8?Q?WrfIRrDY3dWf21vauZ85evJEZJ5fls=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3I3Y2kzSHZwdFJoOHlIYmVVSkQ3eXNINjNyM01YdExpUGg3NElMSG11YS9s?=
 =?utf-8?B?a1dtekdJYVdCb1dCajRYYWs5bFc4YmdQWStzckhtV3loWVJCaEZxZlhwbG1E?=
 =?utf-8?B?WEk0WVVzY25HVitBd3dweFdkeUcrMFdsVzVjRzNGN1pkeVBSVmFhN3gxdnVZ?=
 =?utf-8?B?czZPaVZmRDFYU0wvQ1RhWkZmblNNN3B4YnVJbkV6aHlnZVRjYmt0M1cvZHh4?=
 =?utf-8?B?YWVWaG0yeWRvM1ZhMDRFclF5UzU1d0YrM0VtVjdWYnFHOGxhNGFRMzlkMmht?=
 =?utf-8?B?bjhlK2tVT0NCeWhyejNNZWpyc3crRlVFQ3ZSRVZ1clZJeEI4R3QzUHZNWWl1?=
 =?utf-8?B?TE0xSU5DYlZrRlhVWGZxVTFvbURCNzhjYWlQVmFLc0pxd21yTHJpUC9ib1Ax?=
 =?utf-8?B?UWI4VVR0L2FCczhlVEs4NFViR00xSHA0SGp3VU42TTlzTlUraHdBSTAvaE5h?=
 =?utf-8?B?ckJ5d2tFdThFNDhlU20zcmZRcmJUaEMvMEthY25LaGJYUFFTSWNYT1hVdXYy?=
 =?utf-8?B?emFtUkg1b1pCcmw0TXZzbFVDZDNtNWphWUFZdE4xMlNScCtiNDkvTEloMW9P?=
 =?utf-8?B?ako3c3ZpYUFPNlluUHZ0TVpPOHFDTXhlbnlrTWRWajYvNll6cDhsVVlybXZV?=
 =?utf-8?B?TzNzNXh2MzQyL0hWNWh1d3lGTW41N0o5cm0xMlJjbmZ0cHRvS204ZC92T1BJ?=
 =?utf-8?B?N1VwbUFncnhUaDRxZHg5RWhXYXFMRmtHeE9uZDA4WldYREhWUytDanRHN0ow?=
 =?utf-8?B?bURSdXEzNllPZHppd2k1bzVGcExKbkVSMVJqMzFDOTBINlozSjhqaDE0YXJr?=
 =?utf-8?B?VnVRai85NU9valJwWVgxMHMwRXN1dDRvOUJZUUNPRFptb1lMY0tIYlp0UUFQ?=
 =?utf-8?B?c0JYTUpEZ3ZpdUlvckVPWlFZcCtvalF0YVRyWWk5cHhISnBLb0JJRkNWY3E1?=
 =?utf-8?B?cmdpcEpiTStUeU90MkV3cUlpTUJ0aUZnZ25ZaGZmQkgzTDZtdzhHK2czRFpG?=
 =?utf-8?B?RkdxejE1TGNiZ2hnMmxvSlU3Wkg0Q1ZlVGlmYWI4QTVESXR1ZVlNVnY3NHg3?=
 =?utf-8?B?UE1wZUxDNzc4ZmlyN2hKNy8wWkFxN1hkMmc1T1V5R09KVmhkeGZpR3RoaWcx?=
 =?utf-8?B?M3pvcHZkUG95d2dJdTBGbGpUaDJzQ0p4SjNRb0djQ3R0OGM0Y0dhVmN3dndt?=
 =?utf-8?B?TVRsSzZwcldRYmVCOGxUaDRNVmd6NlBKam5WQng1TTRacTBzejNzSnNUeUdz?=
 =?utf-8?B?NWNReWdkUTNkVGVDK3NpTFdrRHdTVmtSN1VSVTlzL1NXZ1VNeVVYRGhpTjcz?=
 =?utf-8?B?WW1Id1ozUVdHNEhoUW5NUG9hRStYNGU1Y2JXQzlqNENOODJ1eGgyazFBS1Jl?=
 =?utf-8?B?R0pVd0liRUMxNWZzNmZuY0txSjdYeE9CQnI4Z2FtRG1zNEJZRjlzR0xzZXZo?=
 =?utf-8?B?Um80b00rMGtueHpZYVo1VDVCcnhBWVpjVldnVGJJTnFmMWhRSTE5NUlKa2pD?=
 =?utf-8?B?dERCQnZ3TDJtYWJJdWNqZU1VczNJTnBTMnhGdzdRYU0vb21ob09wZ2hobVFx?=
 =?utf-8?B?RGhtaUExMjdBRXZnUlJIT1JwdUI0cGdiRU53SnJ1S2c0YTVzc2l0WTNlc2Zx?=
 =?utf-8?B?S082STZKdHJ1d3c5UU9nRFcya2dPWW5qckhBdEJGdWc0OXd2eVBiQWJydmdF?=
 =?utf-8?B?SmVSalZqaEpITTZ3YlVMMzYyczZxazg2VW9rQTNqcjF2SVJidVhZWW8rYVB3?=
 =?utf-8?B?cDRpQ1hsUzZ0Vjk0ei9ScjdNZThGc3J0ZlYveVJvT0ZIY0RzUzQvMTVBZFl1?=
 =?utf-8?B?bk00QzBjaHpwWmFOc1gwOWpYNzR2a21ta3VRNGxnR0Q5UFE3aVA5Mms2MVgz?=
 =?utf-8?B?YmoxbTI5NXhDMjcrOUdFa3djWmlyWjZoQ1hwRDRjMG9UV3RrNnpjZTJLNUFy?=
 =?utf-8?B?bkhqekZwRGZOSnRCdGRMV2NGN3hEdkxEN1hBRHNsRmt3TWxMZDQvSTA2RWgr?=
 =?utf-8?B?OU5XMzFZblpBb2RVaXlnTGk1ZzdIUWVVZ3poRE1lTWlLdkg3dzRBcmlOcGps?=
 =?utf-8?B?ay8xTFZZaTBqNGlaOTF1NzR1R2pVZEllc3JPRkdjc2V3NjRxRXZjVklheVBo?=
 =?utf-8?B?V296NTRaelVxVkJtOVNIN1QxcUVGcnVSWjRRUjFnNjhFNEV0SVY4bWF4RzJU?=
 =?utf-8?B?TXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9173256037358F48A5733C1772D1AD34@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8bf79a7-3a0a-49e6-4629-08dda2d538e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 19:31:22.2062 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oAZsqDkUQfh4/Wdz2O9KoguZpOm9oU/Z5oWqsGF33CLm7ENPoFaSZ74KaBUqL/LoxEB0+k//Su6qU+fS2Yslsu+9cgWrzvRhRMql6c5387E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9446
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

T24gVHVlLCAyMDI1LTA2LTAzIGF0IDExOjQxIC0wNzAwLCBCZWxnYXVta2FyLCBWaW5heSB3cm90
ZToNCj4gDQo+IE9uIDYvMy8yMDI1IDEwOjM2IEFNLCBTdW1tZXJzLCBTdHVhcnQgd3JvdGU6DQo+
ID4gT24gTW9uLCAyMDI1LTA2LTAyIGF0IDE2OjQ0IC0wNzAwLCBWaW5heSBCZWxnYXVta2FyIHdy
b3RlOg0KPiA+ID4gU2V0IEdUIG1pbiBmcmVxdWVuY3kgdG8gMTIwME1oeiBvbmNlIGRyaXZlciBs
b2FkIGlzDQo+ID4gPiBjb21wbGV0ZS4NCj4gPiA+IA0KPiA+ID4gdjI6IFJldmlldyBjb21tZW50
cyAoUm9kcmlnbykNCj4gPiA+IHYzOiBBcHBseSBXYSBlYXJsaWVyIHNvIHVzZXJfcmVxX21pbiBp
cyBub3QgY2xvYmJlcmVkLg0KPiA+ID4gDQo+ID4gPiBDYzogTWF0dCBSb3BlciA8bWF0dGhldy5k
LnJvcGVyQGludGVsLmNvbT4NCj4gPiA+IENjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBp
bnRlbC5jb20+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBWaW5heSBCZWxnYXVta2FyIDx2aW5heS5i
ZWxnYXVta2FyQGludGVsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gwqDCoGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWNfcGMuY8KgwqDCoMKgIHwgNSArKysrKw0KPiA+ID4gwqDCoGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV93YV9vb2IucnVsZXMgfCAxICsNCj4gPiA+IMKgwqAyIGZpbGVzIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d1Y19wYy5jDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfcGMu
Yw0KPiA+ID4gaW5kZXggMThjNjIzOTkyMDM1Li5jYjA1NjM0OTRmY2MgMTAwNjQ0DQo+ID4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3BjLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndWNfcGMuYw0KPiA+ID4gQEAgLTUxLDYgKzUxLDcgQEANCj4gPiA+IMKg
IA0KPiA+ID4gwqDCoCNkZWZpbmUgTE5MX01FUlRfRlJFUV9DQVDCoMKgwqDCoMKgwqA4MDANCj4g
PiA+IMKgwqAjZGVmaW5lIEJNR19NRVJUX0ZSRVFfQ0FQwqDCoMKgwqDCoMKgMjEzMw0KPiA+ID4g
KyNkZWZpbmUgQk1HX01JTl9GUkVRwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDEyMDANCj4gPiA+IMKg
IA0KPiA+ID4gwqDCoCNkZWZpbmUgU0xQQ19SRVNFVF9USU1FT1VUX01TIDUgLyogcm91Z2hseSA1
bXMsIGJ1dCBubyBuZWVkIGZvcg0KPiA+ID4gcHJlY2lzaW9uICovDQo+ID4gPiDCoMKgI2RlZmlu
ZSBTTFBDX1JFU0VUX0VYVEVOREVEX1RJTUVPVVRfTVMgMTAwMCAvKiBUbyBiZSB1c2VkIG9ubHkN
Cj4gPiA+IGF0DQo+ID4gPiBwY19zdGFydCAqLw0KPiA+ID4gQEAgLTg0Myw2ICs4NDQsOSBAQCBz
dGF0aWMgaW50IHBjX2FkanVzdF9mcmVxX2JvdW5kcyhzdHJ1Y3QNCj4gPiA+IHhlX2d1Y19wYw0K
PiA+ID4gKnBjKQ0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHBjX2dldF9taW5fZnJlcShw
YykgPiBwYy0+cnAwX2ZyZXEpDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcmV0ID0gcGNfc2V0X21pbl9mcmVxKHBjLCBwYy0+cnAwX2ZyZXEpOw0KPiA+ID4gwqAgDQo+
ID4gPiArwqDCoMKgwqDCoMKgwqBpZiAoWEVfV0EocGNfdG9fZ3QocGMpLCAxNDAyMjA4NTg5MCkp
DQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gcGNfc2V0X21pbl9m
cmVxKHBjLCBtYXgoQk1HX01JTl9GUkVRLA0KPiA+ID4gcGNfZ2V0X21pbl9mcmVxKHBjKSkpOw0K
PiA+IERvIHdlIHdhbnQgdGhpcyBhYm92ZSB0aGUgZ2V0X21pbl9mcmVxKCkgY2FsbCBhYm92ZT8g
U2VlbXMgbGlrZQ0KPiA+IHRoYXQNCj4gPiB3b3VsZCBmdXJ0aGVyIGxpbWl0IHdoaWNoIGlzIHdo
YXQgd2UnZCB3YW50IGluIHRoYXQgY2FzZSByaWdodD8NCj4gDQo+IE5vLCB0aGlzIGlzIGR1cmlu
ZyBTTFBDIGluaXQsIHdlIGRvbid0IG5lZWQgdG8gcmVhZCB0aGUgbWluIGZyZXEgYXQNCj4gdGhp
cyANCj4gcG9pbnQuIFdlIHdpbGwgYWRqdXN0IGl0IGxhdGVyIGluIHRoZSBmbG93IGlmIHRoZXJl
IHdhcyBhIHVzZXINCj4gcmVxdWVzdC4NCg0KU28gdGhlbiB3aGF0IGlzIHRoZSBwdXJwb3NlIG9m
IHRoZSBjb2RlIGp1c3QgYWJvdmUgdGhpcz8NCg0KLVN0dWFydA0KDQo+IA0KPiBUaGFua3MsDQo+
IA0KPiBWaW5heS4NCj4gDQo+ID4gDQo+ID4gVGhhbmtzLA0KPiA+IFN0dWFydA0KPiA+IA0KPiA+
ID4gKw0KPiA+ID4gwqDCoG91dDoNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7
DQo+ID4gPiDCoMKgfQ0KPiA+ID4gQEAgLTg3OSw2ICs4ODMsNyBAQCBzdGF0aWMgaW50IHBjX3Nl
dF9tZXJ0X2ZyZXFfY2FwKHN0cnVjdA0KPiA+ID4geGVfZ3VjX3BjDQo+ID4gPiAqcGMpDQo+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0geGVfZ3VjX3BjX2dldF9t
aW5fZnJlcShwYywgJnBjLQ0KPiA+ID4gPiBzdGFzaGVkX21pbl9mcmVxKTsNCj4gPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIXJldCkNCj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0geGVfZ3VjX3BjX2dl
dF9tYXhfZnJlcShwYywgJnBjLQ0KPiA+ID4gPiBzdGFzaGVkX21heF9mcmVxKTsNCj4gPiA+ICsN
Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAocmV0KQ0KPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4g
cmV0Ow0KPiA+ID4gwqAgDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3dhX29vYi5ydWxlcw0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2Ffb29iLnJ1bGVz
DQo+ID4gPiBpbmRleCA5ZWZjNWFjY2Q0M2QuLjc1ZmJkYWI2OGQ0NCAxMDA2NDQNCj4gPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YV9vb2IucnVsZXMNCj4gPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV93YV9vb2IucnVsZXMNCj4gPiA+IEBAIC01OSwzICs1OSw0IEBAIG5v
X21lZGlhX2wzwqDCoMKgTUVESUFfVkVSU0lPTigzMDAwKQ0KPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoE1FRElBX1ZFUlNJT05fUkFOR0UoMTMwMSwgMzAwMCkNCj4gPiA+
IMKgwqAxNjAyNjUwODcwOMKgwqDCoMKgR1JBUEhJQ1NfVkVSU0lPTl9SQU5HRSgxMjAwLCAzMDAx
KQ0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoE1FRElBX1ZFUlNJT05f
UkFOR0UoMTMwMCwgMzAwMCkNCj4gPiA+ICsxNDAyMjA4NTg5MMKgwqDCoMKgR1JBUEhJQ1NfVkVS
U0lPTigyMDAxKQ0KDQo=
