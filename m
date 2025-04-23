Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEAFC369CB
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 18:48:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9CC10E13E;
	Wed, 23 Apr 2025 18:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JO6DzSFo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B8510E13E
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Apr 2025 18:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745434108; x=1776970108;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GeQKU0jlIUO5GgIU1+1bCuM/4YE6qdHET1omBrufmfU=;
 b=JO6DzSFo2iNM04bGeAUD7eFsWLqtjcMRtCl0D2rJXN4xsZJrCCNWT2cd
 l4jmoXVqAZj6/BLa/vZT4ChaTXj1AjhadQwosx1qlAb7tv4XBeOREnNA2
 1gljvkAdr0LVX8ZhhxrV90tpMStzcUDz7vap9CPDn6NzjR7ghijsfpClx
 UwPYtca1l1bQvqufqifHJX1liqKsYhjBnMPQ86KSZ3LGdY+TWUhJO6phD
 NB2E4wNQX8wU2eJtwB7A+aKG5kbgLs0ElQzU8uHJ3Wp5hL9qt3xKYGFTM
 Gej5TOKltaHxFJSvgUEbO/69pufrQnjxyLDa1jlXBo33ZZOE1+sLWQTMj w==;
X-CSE-ConnectionGUID: gUIX5ufTSTiO8w1d64i/Xg==
X-CSE-MsgGUID: YhX9rzQVRIie02ufnN/6hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="46747886"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="46747886"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 11:48:27 -0700
X-CSE-ConnectionGUID: tKZtcklkTw6k272XdFmVZA==
X-CSE-MsgGUID: jOgU/+IYQJqUwMDLPBtiVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="133357868"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 11:48:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 11:48:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 11:48:26 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 11:48:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YXU9ZaXdU6GLF+/pxwsuaW3P22nt0T1Qv7mI42G7ki8CfJnGNDaiaGsGjqJlQ4xPkYW8lVMBGwiKG6tj2eyClc+m9IIZYwkpRQxgbDNDRCO87hMBvCAMDDl6UX3TfY/blFSi5SxqbCgHR5K4SUHuFkSz64Ya1aQf9Gl17z/FomVLr41xz11HviOqEyGieMCBaVy+kZ2tnGXo2JJwBRkYPvwW9dWX8nnjshGS3yPkvzJBf8mncUOTEErIy9gxjes4HLQNsamGXl03O7mE4dO6sHHvy/GvTN+Gcn9y5foWOUTWvRVAz/Y9vapeTxsb5tdVo7QQR61WZQ99Wg9mQx5gGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GeQKU0jlIUO5GgIU1+1bCuM/4YE6qdHET1omBrufmfU=;
 b=odzpewHq5y8oHneYB81Kdggje1gm8WDiNRunmrDhgpJ/OnJUORqBEnZOhAaHQOfP6tvQ4scWyAoDd00/PPPZ0HqRMHow8v6Xjm82fFi2MQFzNzhevqa7msglBGNYIQHvLTx4bts+REWuMJdCZagXYMDxIrbVHvdtGVI4rXP2dWUnruPz/zH7x51oIGaoEDw7+JG3Rket63MVhxBl6rCS70zKzC+eQQvCwYUM7gKa/TzpALqIIID1lcvWPD2cyX+Ex4WAnT9bTqyHd2SwwU5QKpjI1Y3Gjcb5mnvFB5a4PDrbDRHGUGZV0glu55DRSCHDnER6lCv2Ieg5pTui/S2C1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH0PR11MB5234.namprd11.prod.outlook.com (2603:10b6:610:e1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 18:48:04 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 18:48:04 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nilawar, Badal" <badal.nilawar@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 2/3] drm/xe: Expose PCIe Gen4 downspeed attributes
Thread-Topic: [PATCH v3 2/3] drm/xe: Expose PCIe Gen4 downspeed attributes
Thread-Index: AQHbr4nXhHG33StpjkembsN1IKMzSLOwwS0AgAA4w4CAABPZgIAAEYKAgAAq2ACAABgHAIAADwOAgAAMwQCAACN5AA==
Date: Wed, 23 Apr 2025 18:48:04 +0000
Message-ID: <b5057b607d2645e13833b21e828aebc656fabf57.camel@intel.com>
References: <20250417111233.2322000-1-raag.jadav@intel.com>
 <20250417111233.2322000-3-raag.jadav@intel.com>
 <02d74b93-563e-4fab-a330-f05cf1898ca5@intel.com>
 <aAipZ3pFfD_w7e2z@black.fi.intel.com>
 <05dc8b40-a37a-4fc6-a759-d1ddc0a6c56d@intel.com>
 <aAjIvZ0eqLBsI2Nt@black.fi.intel.com>
 <csahlwfbgaxsm7rf4g5i747wftr5zet7ta434jop5vr2he5lmw@baknat76wftw>
 <aAkA1swWzrROJbqv@black.fi.intel.com>
 <34b33d3135fc24302db2764ce86a641e7c49054f.camel@intel.com>
 <aAkYIOSfmCY-XB3S@black.fi.intel.com>
In-Reply-To: <aAkYIOSfmCY-XB3S@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8430:EE_|CH0PR11MB5234:EE_
x-ms-office365-filtering-correlation-id: 753c7054-ec97-493b-3567-08dd82976179
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WnRickt5RCtpUDdidjREdmQ5TXVIbWVmQjAzR092QTNsT1p6TE45eCtYZXJJ?=
 =?utf-8?B?eGh1aXNIRjM1YVd2cUxjZDdxOUFYSXVRTWVxZU5QckhIU2NzR3RpSTBCUVFq?=
 =?utf-8?B?dzREcEkrQkdNVGJKcVppM3NCQXBKbURoOXBid2ZWYytzd1BBaGY4dWFCcTk5?=
 =?utf-8?B?VzBoOGw0L0dnZmlMOW9FS3JIa3RBVnZicHpNLzZvcXQrR2dsUmVNMEZNU0dp?=
 =?utf-8?B?U3YweEdCNHdHR1BMUUYwbUtkbkdORGR1OEZ5UEUwTlBBMmJaNktHYTZHYm0v?=
 =?utf-8?B?ZE41M0k2bk5BTkJ3alAxNU9tZlZia3EvcjN2eEtVZGVYZXlRSVluLzlxY1M5?=
 =?utf-8?B?RXJIelI3N1ovSEhPTFF5ZU92R3JQUGZwSzRuSTY2bXNqbkZrYXBMcmM2dVZv?=
 =?utf-8?B?MzVNdmVuTnR5MTgyUndXaGM0dU9oeVJoVGJSeFM1bkZsNDFvVGxsa2p0aENC?=
 =?utf-8?B?MmYvQWpubEZhYlN3ZCs4Q0JXWm9mY1RvNVdRblJjZldoV1BhUGRmd3RwOTZ1?=
 =?utf-8?B?c2liU05heGwxL0h1UzN0QWFlZWxUS0xvQ1BaM0NZdi9zcThxU255c0xBdUtn?=
 =?utf-8?B?emxCaHhxVFcvYXBTQnNIS2JBa3lHM0xKQ2hJSHIyMlo5N1pHYUJMRkhSV29v?=
 =?utf-8?B?WVVzMjhPWmtYNllndm1tNXJVTnNkOVVZaTNQVlJGREQvTllsOUJPUjVSdWlG?=
 =?utf-8?B?bzZlbnlod0VORUN0Rzd6YUV4NDExL2d5R0d2YjFob04xTGlSOWdRNmFSY1lJ?=
 =?utf-8?B?L0hVSXE4V1FUUXMveGJWV0FaUEgvTWJxVEN2ZCtjVURBemRMaHNNaDBKWlF4?=
 =?utf-8?B?Ukxmcjl1Zk9HMVlZaUU0OXJjOXE2cmpNNndXemk0WDdld0NkeFZzTEw3N2Ey?=
 =?utf-8?B?ajNVb2g4bVN5dklEb1VXWlZab29wbFcvVW5oYnJTTFhpVWVockZZbEYxRVlq?=
 =?utf-8?B?SmFESzhhTzU1SEdtelRjUjc1bnRxYm5lclFpQ1lzbHdOOTFSZDhFcDRRVnd1?=
 =?utf-8?B?VXZDOXVJUWl3c1ZXNStieHZBWjduTmV5dVgyMzZXdHBNSWY3dG5tcFg3OHhF?=
 =?utf-8?B?eEYydjBEbjFuMWYrVzh1TDk4Unlqbk52RnJRdFRrcEJxWCtsVUVLRDJ6OWJo?=
 =?utf-8?B?dmRIZXlmczNoRjJFWFJVYnNlWVcwM20wSW9LRlVUTjZaR3pVSlVIdG9ZWGsy?=
 =?utf-8?B?aHdPVWRlQmR1UlhvQVE5K1VWSnAvOStPWGU4eWx1cGJLTklJbmtPMCtsZFh1?=
 =?utf-8?B?ZTRtemlEL2Z5Z1Q4ellQeFVmNm45Z25XVXNrS1VqN3EyN1NpKzJ0Z1Y2NW1D?=
 =?utf-8?B?ZmtxUTlUSVFKM0haL3I3WGx3MlhlbUp4ei8xbTZIWnFONjJLK0VwaDNEbllZ?=
 =?utf-8?B?MnZmMEpMb1ZHcGlzaldzK04rVXE3Q0VKUHpicDZkOE1pbHpVemhOR0pmMEY1?=
 =?utf-8?B?NmZ5ZnB3SGR6dFpzOVJnVWJNSXNDT2JtemhMMGZTY1VlbkV3eHNwVUZzcjVy?=
 =?utf-8?B?cDBBcHFQQVJmRHV5OUhEN0Zvako2UFQvd0pGSEdEdjNrdWZnKzNhVnF5YTFo?=
 =?utf-8?B?VkJkS1NkWDdiR3BLc0RUMER4ekhLMHRxVWkweHZFM1k0Rk40NzZsOG1lRWMz?=
 =?utf-8?B?ZzdndEZGbXIxNm9tcjJTNjBUM2Rna1k5b250eUdHZm5FR3dHZHBPZlNjSTQz?=
 =?utf-8?B?SGtUZXhhNVkyeUtBb0FVcHFZWWJnQlFRMThqc3F0YS96TE5vRFZIUmk5MmhV?=
 =?utf-8?B?emJiaStFbVhoN0tZQSt1YmQxVEt3Q2JGREsrMWJ5TE12OVlabFcvZ01BYXhp?=
 =?utf-8?B?d0JFSythWWpiZU4zWkRLNGVzN0F2Rm1vRUVvc1lIWmhnUWtOd2prbUZKRkg0?=
 =?utf-8?B?R2p3bzZHT2tESlc4YUlBakU1Mmxqb0xNSmx0QnF0bEVZL2t0L3YwWnEyQ2hS?=
 =?utf-8?B?TnNzME1ZQVEzZi9VS2QycEZzNDNZTkxTeDdFWDZFUy84U2J1RTh4QVdyMEVM?=
 =?utf-8?Q?P25AKZtn2lCFuU510oRIbCxAihZYeA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmRVWGlqWDFzS1g0bFFqRkZnUmtKbzEwS2lBcXhDc1R0WS9WcUQyUHR6WW50?=
 =?utf-8?B?d3kzcXBDMjhvc0ZzSldwcXF2VlZrdjNaR0E1dktLeVNRRTJRaFZkMEd6T2xN?=
 =?utf-8?B?SHpqd3F5SGk3L2prU3JxWVZJb283WTNjeTU3QnRCT0hjSGhTbjA1YmplWEY5?=
 =?utf-8?B?b3lwTFZLVmJ1TFZGVUlvbGp6RTVNdWh1bnorYWMwd3JITFc3aW45T0JHMDNq?=
 =?utf-8?B?TGtvZ1hhRUlDKzRsS0phRXNSSGdJTEpoWVBlUjBTcGNMSWpVdmpTR2h0SHZt?=
 =?utf-8?B?ZTZQQnMxQzZBM1FBaXBCakdzeStURGNoMjNiejdrNVN2RmRPRzJERmFuek1B?=
 =?utf-8?B?LzVneklqOGJVaW9LOHFyZzlONERtdnM1TSsxbTdXYlpZUGdMTEljNmp1MjNM?=
 =?utf-8?B?YUJGN1A5enFOLyt0d3hrSlNRT1NTNnR2ckJvWVcxRDNOT1BrMHNiT0JaV0lG?=
 =?utf-8?B?bFNENHhhK1U2ai9KcnVLVjNSY2JWTlA3YUc1elVGek5Qb0srdm9hQzhBMTZt?=
 =?utf-8?B?YTdzK25aQkZFNmtSd1huMDJiQ29xK0tHS0lFRG5FdFFsZ1ppRlVZZ1Q5MGpq?=
 =?utf-8?B?LzRlcGwyY0Y5U0FnV0dtL0w5cXBqQXNxV0pzL2lLK3pMVkVHaXdtS2ZvTU5o?=
 =?utf-8?B?R3hRQVY2TGF2WFJiKzlDb254KzNOcG1rMW5ldDRPQk0xN2NDK0xsWHpRUUsx?=
 =?utf-8?B?N2svd3ZCcklIUTBZZTgyYk5BZXlWSkpIWnJybmJVN01MbWwrTkVyak9mbGNi?=
 =?utf-8?B?SlFQS2JqMEx2azhSL0RQM2Fpd0Z2MXZRTW1DaTh0S29qZWNiTFJMcnB1TW5Y?=
 =?utf-8?B?VDBSdXRIUkJFQ3dSclcwOFUxN3RDbUFPNm1tVUMvZTVmaHBrelBLMmprMTBF?=
 =?utf-8?B?YTNOR244U24weVVrRVZpMjVYQ3JXcDlia0tjZGxGMHBZU01UZkM2K1IxVjNs?=
 =?utf-8?B?Q2FQdXZMWGF1Wmp4UTA3RjZFQTlGTW80cFZGcUhpd2pjUkJrQ2E5a3JtT2ds?=
 =?utf-8?B?djk3bVdmTmU5TUxLN01FT2xxZTgyZkQ0SmtJQld0djI5aXRaeUZYbDFXQlRw?=
 =?utf-8?B?T05BWkltUmRWTDVuUXVEL1ZZdkh2SEd3cS9KUE5WRDlmMUNWVThsdk5Qem9u?=
 =?utf-8?B?T3M1VEF3bDU5SkxuZm1hc0luZ25wdlVEYVVndU9lZ3RhSHYyU1JQWXFuRi9l?=
 =?utf-8?B?NXhFSEdJUjFwME5KM01SYXJpbFdmT0x2RDgvc1NBSkVHWnNSdEU4NlJicVp4?=
 =?utf-8?B?MHZ1TDVxZUZpZmxHU2xXQkhEZVUwUkJsWk1xSVB4MStjQ1dNQ2ZsaEhOQnZl?=
 =?utf-8?B?SW52bE82SllIVlZKcGdoVVJSdllITVN3SXJINnN5Y21MdVdkeDVRdm52ZzhZ?=
 =?utf-8?B?QWFadnU0TnJ5dUpOVkpIY3dEKy8xVTdEQktEVmhlSXd5WVFKV1NBRktrTlpa?=
 =?utf-8?B?WnJISWJJS2xRRjY0bnBHb3pqaVdSbDVrd2tuSUpoc0pzRWZCMUtJS3htVUVk?=
 =?utf-8?B?ZEJibFZuU1NCUkw5Uys5ck40N3Vkb29SNUFpRndnakcwWWhiY0luYWFMd2d4?=
 =?utf-8?B?QlZENHlPdWdQcXh6M2xUN2R1K2lHQ0dzYUhKamd2TlBLUmN2Nk83eGMxUVk2?=
 =?utf-8?B?SExNdnV6Ly9GcnNmNDN2dm53SmQ2NUpHcXlPbm05aUpDSWlyamlaM2xVVWdh?=
 =?utf-8?B?RFcxT3FuTWRJeXZjeVhwM2w1eDRZdVF0UGxJQXdsaUtEc28wcy9DdExZRmlr?=
 =?utf-8?B?enhqZnladVg0NHI4M0M3eUZCM0lYTWl1b3BlWWJMeFBOVjZPT2lQRzc4WTkr?=
 =?utf-8?B?S0dtR0J0Tm5EYkhkTFF3RUN1Q2VJd1duME9tU3VnRmJtSGxIVmt1bDJROEI1?=
 =?utf-8?B?WWxnTHZUQzlaUnhEdjdQdXZOeHBMMWI2TlB0NFBIZWVUUnBMN2IyNGRITWdV?=
 =?utf-8?B?UGFaa21mbGYwb2Q4TSsyaFhSU3UzWU9wekd5YVFWV1JhMEcwWHZ3T0N2aHg3?=
 =?utf-8?B?OFVZN2NJR1pMck5xc2VmU2grMzZTRjBzSitqVk1xZUlxUFFwSGYzNFdmd0pD?=
 =?utf-8?B?NDZUTUFJdERqQWMxTkxTdGc1Y3JITEtoeml4SVJENEZ3RVlYN2FwLzFFMXBw?=
 =?utf-8?B?VHFsY2hhTHFWdVAxQ1NTNmlhSkUxSldNcmFPai9Dcmx2aThyKzdSTHYxblM3?=
 =?utf-8?B?S1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5359B41B8BE9BD4C97BC4342FBF96A79@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 753c7054-ec97-493b-3567-08dd82976179
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 18:48:04.2869 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Iz22L/j3Js/8qx8O6eiD77U5CQhmL/CqBRvX/LAgrPkRpxilZC08o5rtiUKbW0ChTlxxzjngVJx8T6ukKLZejg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5234
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

T24gV2VkLCAyMDI1LTA0LTIzIGF0IDE5OjQxICswMzAwLCBSYWFnIEphZGF2IHdyb3RlOg0KPiBP
biBXZWQsIEFwciAyMywgMjAyNSBhdCAwOToyNToyN1BNICswNTMwLCBWaXZpLCBSb2RyaWdvIHdy
b3RlOg0KPiA+IE9uIFdlZCwgMjAyNS0wNC0yMyBhdCAxODowMSArMDMwMCwgUmFhZyBKYWRhdiB3
cm90ZToNCj4gDQo+IC4uLg0KPiANCj4gPiA+IEFuZCBhbGwgb2YgdGhpcyB3aWxsIHRha2UgcGxh
Y2Ugd2hlbiB0aGUgdXNlciBpcyBkb2luZyBhDQo+ID4gPiAiZmlybXdhcmUNCj4gPiA+IHVwZ3Jh
ZGUiLA0KPiA+ID4gYW5kIHRoaXMgY2FuIHBvdGVudGlhbGx5IG9wZW4gdGhlIGRvb3IgZm9yICJs
aW5rIHNwZWVkIGRvd25ncmFkZSINCj4gPiA+IHRvDQo+ID4gPiBiZQ0KPiA+ID4gY29uZnVzZWQg
d2l0aCAiZmlybXdhcmUgcm9sbGJhY2sgKGRvd25ncmFkZSkgZG9uZSBmb3IgdGhlIGxpbmsNCj4g
PiA+IHNwZWVkIiwNCj4gPiA+IHdoaWNoIGlzIG5vdCB0aGUgY2FzZS4NCj4gPiANCj4gPiB3ZWxs
LCBnZW40IGlzIG5vdCBhIGZpcm13YXJlLCBidXQgYWxzbw0KPiA+IA0KPiA+IGlzIGdlbjRfZG93
bnNwZWVkID09IGdlbjMgPyENCj4gDQo+IEkgdW5kZXJzdGFuZCBpdCBhcyAiZG93bmdyYWRlIHRv
IiB0aGFuICJkb3duZ3JhZGUgZnJvbSIuDQo+IA0KPiBXb3VsZCB5b3UgcHJlZmVyIGdlbjVfZG93
bmdyYWRlIGluc3RlYWQ/DQoNCmFnYWluDQoieWVzLCBuYW1pbmcgaXMgaGFyZCBhbmQgdGhpcyBp
cyB3aHkgd2Ugc3RpY2sgd2l0aCB0aGUgc3BlYyBuYW1lcyINCg0KPiANCj4gPiB5ZXMsIG5hbWlu
ZyBpcyBoYXJkIGFuZCB0aGlzIGlzIHdoeSB3ZSBzdGljayB3aXRoIHRoZSBzcGVjIG5hbWVzDQo+
ID4gd2l0aG91dCByZS1pbnZlbnRpbmcgaXQsIHdoaWNoIG9ubHkgaW5jcmVhc2VzIHRoZSBjb25m
dXNpb24uDQo+ID4gDQo+ID4gPiANCj4gPiA+ID4gPiA+ID4gMi4gVGhpcyBpbmZvcm1hdGlvbiBp
cyBmb3IgdGhlIGVuZCB1c2VyIGFuZCBoYXMgdG8gYmUNCj4gPiA+ID4gPiA+ID4gdHJhbnNsYXRh
YmxlIGVub3VnaA0KPiA+ID4gPiA+ID4gPiDCoMKgwqAgcmVnYXJkbGVzcyBvZiB3aGF0IHNwZWMg
c2F5cyBhYm91dCBpdCBhbmQgdGhlDQo+ID4gPiA+ID4gPiA+IGRpc3RpbmN0aW9uDQo+ID4gPiA+
ID4gPiA+IHJlZHVjZXMgdGhlDQo+ID4gPiA+ID4gPiA+IMKgwqDCoCBjaGFuY2VzIG9mIG1pc2lu
dGVycHJldGF0aW9uLg0KPiA+ID4gPiANCj4gPiA+ID4gd2hlbiB5b3UgaW50cm9kdWNlIGEgbmV3
IHRlcm0gdGhhdCBpcyBub3Qga25vd24sIEknZCBzYXkgdGhlDQo+ID4gPiA+IGVmZmVjdA0KPiA+
ID4gPiBpcw0KPiA+ID4gPiBwcmV0dHkgbXVjaCB0aGUgb3Bwb3NpdGUgYW5kIGl0IGNhbiBiZSBl
dmVuIHdvcnNlIGlmIGEgZnV0dXJlDQo+ID4gPiA+IHBjaWUNCj4gPiA+ID4gc3BlYw0KPiA+ID4g
PiBzdGFydHMgdG8gdXNlIHRoYXQgdGVybS4NCj4gPiA+IA0KPiA+ID4gQWdyZWUsIHVubGVzcyB3
ZSdyZSBleHBlY3RpbmcgdXNlcnMgdG8gYmUgaW5mb3JtZWQgYWJvdXQgdGhlIHNwZWMNCj4gPiA+
IHRvDQo+ID4gPiBiZQ0KPiA+ID4gYWJsZSB0byBmbGFzaCB0aGVpciBmaXJtd2FyZXMuIEJ1dCBp
ZiB5b3UgaW5zaXN0LCBzdXJlIHdpbGwNCj4gPiA+IF91cGdyYWRlXw0KPiA+ID4gdGhlDQo+ID4g
PiBkb2N1bWVudCA7KQ0KPiA+IA0KPiA+IEkgYmVsaWV2ZSB5b3UgbWVhbnQgJ3VwZGF0ZScgdGhl
IGRvY3VtZW50ISA7KQ0KPiANCj4gV2VsbCwgSSBtZWFudCB0byB1c2UgJ2Rvd25ncmFkZScgYnV0
IHdlJ2xsIGJlIGdvaW5nIHVwIGEgcmV2aXNpb24sDQo+IHNvLi4gOkQNCj4gDQo+IFJhYWcNCg0K
