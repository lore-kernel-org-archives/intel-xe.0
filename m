Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E55E7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 16:29:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCBC10E22B;
	Fri, 13 Dec 2024 16:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MDqQe3Jj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227B210E22B
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 16:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734107344; x=1765643344;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XxLBuxl9iz6mHB/9AtPslhObpEJgpQ6JLoqyV7Tc6Ao=;
 b=MDqQe3JjAHtTvgbEddBhXZ4KiM2xXg/n53er8yE8mO458g5rJo3Uk3mT
 P1SuLnZvEAk3MJ0xchQdHxb3YxGJUVyhRfJlnj5lgOF4wS5bq4MFbOrVG
 7s2t1OIgf0boTmDEZGQj/NtAnUA2OQVnbd2aTsuqogRb4tXghRDRPlaS+
 QBJtCfvLEA2ruMs4uImkrgi9TayHXpSTjTXHNU8dnTh1OyeYO01LIJFCE
 sAs+oWS1meX4GMESjGDkSIwRdTRNaU3sL+bZWlOoT5SvpeSDJZCNZS8Du
 V/vnj346RhzQpkqGjCyooTAYGmjCLZ1uKAZhZeQC+SRMgz+yO6fQvViBF w==;
X-CSE-ConnectionGUID: XnDqNyDLRXKhzYtMYflPZw==
X-CSE-MsgGUID: JZGevZzuQ2yCqObwlhooLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45040516"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45040516"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 08:29:03 -0800
X-CSE-ConnectionGUID: W2ITVna+QVef5uAPqu/OUQ==
X-CSE-MsgGUID: a+59DS9dQyOxj0VAroRcAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="97365162"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 08:29:03 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 08:29:02 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 08:29:02 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 08:29:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQWVHEXE7qSjA9qGzxCCiZlQx1aGmqvkRpTvy9NiSxy5223yIfgJSxthldkSCt1VG8FXXLHCOn2OfPzxn2Lmge1jHXbMQNfvowQSoaQH1Isvx7ZsWcKSSks0NXXW9XXUoq7VvX3x56s5Kw0c1XuW7ZUwpOQYQTRNwwy/P085POM2VFswmNPW1/MdulMY8XodhB/QLEd9WBEVQtRYCE9DULL+pkVM6h7O4ERyXwJ5FIdrz+u7Cn1E3Ir/1ZgQIQlfa3hz4ZKtbtEaHrks7eiUXXIlBB4IC0njyAI7KB0/KPwwS104eO28gcxkC2BBCZmVpR2yCHmLSusbYpRqm0hF0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxLBuxl9iz6mHB/9AtPslhObpEJgpQ6JLoqyV7Tc6Ao=;
 b=KWMlVGHwlXsPXWwEpn1TuomavaFMSIhQXBxUnBQRsgeOXaAeE/4zMRTiJkyGFjhPocjQY9nALlsKD+eZ+fAK6/nrFJESZfSSNP/RZAgzr/mdC2nza9HinV9u/S5Vk3PCZO+63HuCsqyvjmMGoRIzgxBYCbm5EvY+OfFK4id/Dt1eLS8nU8/PX0zVN4BeH+hg9+jDUkF0sNvMIptDCnbktQTx7oyLFvudxLR7hMufpYoRddWX3342vD12jIp0cF+cL3wDceeQzG8pQMKO7s0i1Mi7azZBdlsBBKhCc+qVN/zp+BW5kaK6+FnLmsCd2SvdVgCZFTc0wSvBfuQQu6M06Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CH3PR11MB7867.namprd11.prod.outlook.com (2603:10b6:610:12a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Fri, 13 Dec
 2024 16:28:58 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 16:28:58 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Filipchuk, Julia" <julia.filipchuk@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] Revert "drm/xe/devcoredump: Add ASCII85 dump helper
 function"
Thread-Topic: [PATCH] Revert "drm/xe/devcoredump: Add ASCII85 dump helper
 function"
Thread-Index: AQHbTWkcZhgIo/ttdkKNQ0lly9C4rLLkPnMAgAAI5oCAAAQoAIAABxGAgAAK0IA=
Date: Fri, 13 Dec 2024 16:28:58 +0000
Message-ID: <11116b4e7978ad7b5dc91d25c1d0232c809912c6.camel@intel.com>
References: <20241213141252.1488109-1-rodrigo.vivi@intel.com>
 <t6j573cbepbjwiclv5ulewcapwqyf7np4bvdut6gjario6wmeq@sk3cxg6mnos7>
 <a49a74a0b2ac363691f26dddde60aae60461ccbb.camel@intel.com>
 <7cd068ff3630f40e31cd4d971ad794986b017ab5.camel@intel.com>
 <26263eveox7cc3dqfqezodcunjamqgd7wrotzwmbci2o2ia42v@kkc3kpaizsef>
In-Reply-To: <26263eveox7cc3dqfqezodcunjamqgd7wrotzwmbci2o2ia42v@kkc3kpaizsef>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CH3PR11MB7867:EE_
x-ms-office365-filtering-correlation-id: fa6df357-6b18-4cb4-d256-08dd1b933ee7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZklKV1dZd29iaUg3SDNKaGZBNjEzMXZqLzFJVGxqcUkvN1B4RVBoZVRjZHVz?=
 =?utf-8?B?Yjk4MjBkdUh0WU9LSzJjRzdmK3pabWJkSlljS215cFpHM2g1WURvbzZJK3BS?=
 =?utf-8?B?Zi9tdTl2d3d5bHBCS3V6NmkyWTF3T2dnRTZPOXd4a2pLeDM5ZllKSmd3WWRm?=
 =?utf-8?B?WTFaMnFCVnNrNVQxWkNOU0JsZUtUcWY2VjBad3Iwbk9NU1RqTVJZVy93SlZu?=
 =?utf-8?B?VnlwOVFwSnpvOGE3YkgyZkFvNUpVRUEvQUNaNVVOajNCUi9nVS9KeGhxN2Yy?=
 =?utf-8?B?bTZ5ZnR6TWEydS9Zcm1BWEJqemRuVkZZek0wS2ZROUlZaE8rVkRiRWF2VjE1?=
 =?utf-8?B?cEM5VnU2REgyeFJSOGg1MU5nWWJ6S0tFU1oweDkzZUxDWTViTG5sSFBDS0xy?=
 =?utf-8?B?b1ZlZVFVN2lwemljSUhVR3pmbHdqS2NYSDZGWnZPZUJnU2tndWJhM0xWVFRH?=
 =?utf-8?B?VURPSlNPbnhDd015WUR3QWVtb3hXdldSSUlGMzJkU2NncFlyUDR1cHdES3BB?=
 =?utf-8?B?Q2tQamVDTDFsb1hZY3hjTmd2M292WHJiU0kvMkNVZ1R4eHFWN1pNQjZvZ1Qw?=
 =?utf-8?B?UFdLNVU2Mm5aekxHVVM0cHVGNytFb2FKdzN4T2pSdFFRSzBFRzQ1QTd2MUU0?=
 =?utf-8?B?czFpYmozejZjOEVLTFo0aDMweFpNcG5lRmllS3lvS1Y5akl1SVlCUE5rMEpH?=
 =?utf-8?B?cnhFQUZZa0FTRmJvUXJETnJRM1NOaDlUVEwwdE13RWZuMHJERE5oa0lWc3Fx?=
 =?utf-8?B?T0xhN3REVTEya0ZNMi83VEo5TXZ1V2p1UGZSdDJSUytPV0ZCdzc0R1BhSFlp?=
 =?utf-8?B?clNOcU9PcjJaZ2xPVWxaQjYwdG5NQzhqZWN3SXkzZm5KVTJlanQzN1VPQm5L?=
 =?utf-8?B?ZU53TS9UUXdHb3dsN2JxbS9QWTYyVTRHRGFKellIeHo2MFMwcWQwUk9aNzly?=
 =?utf-8?B?dkdCRmJCOXhERDJlL0JmYWtMSkdCRUlIQnFvWDRvRlNhamxTWWtlOFZTTEFz?=
 =?utf-8?B?Z0ZaeXlENS84OFMyT0pXZTNFc0xRUWp6S0ZWV3RrTXcrNkg1Q3d5ZzF3Y3BM?=
 =?utf-8?B?a2lPNCtRdHZ5S09DOW9KT0J4T0pkaVQ0aXpFbHhQRGxYZklRSGZRc212dDVp?=
 =?utf-8?B?T3o5c1djQWZycWlzOXNuSHlMUCtKRlBsZGg4K2t0bHFVdzY5LzNTUGhKWEpy?=
 =?utf-8?B?ZlJsT1BOd1BvalU0clFTb0Jsb0Zta1JXeThENzViK3FUaTdCZWJOV0NzSGNV?=
 =?utf-8?B?eGc4QjhlR1pLN2ZEWFdHS0p5MVE5SWpBYTNsbGZvei8xSUFZMThsSWpGNU1J?=
 =?utf-8?B?Z3Q2d0l6MkY4Y0tvTUsxTEZSQ2NkYTM3YW10Q2FLWGJodXV5K251SUJ1NXht?=
 =?utf-8?B?VzVkd3FkK3FGRnVzeXFjMWFpbThlb1QxUk92VDQ2WHpIbUpKeVNWV0xUZUFw?=
 =?utf-8?B?c3BCdkRLNkRlR29Kc2wzb0xCVVl2YjU3OU1qY0RsYmhZYTBua1J3UVVYS2F4?=
 =?utf-8?B?ZnNJVm90dDhJeWFFcXhyZVZyUUs3VkNMaE1Fb3BoSkFncGdGOVBMZFpaMHJP?=
 =?utf-8?B?L0J6eWM4OE1kQWdrMUQ3L2RXUkdHVnl3eVBoQ0ZkRW9hbmQwYXNHRmxKVXhR?=
 =?utf-8?B?UzN3K0w5OHZXaXdXZFU5MHZZVUVjKzBUNHdHUHZGM0ErM3BySng3STZ0ekxs?=
 =?utf-8?B?RUVVQUc2eVFBZHBGTFpnY3dZVUlLOWtsWE10MFFNZjhGZWFEUTBpRzVoWElV?=
 =?utf-8?B?WnBaSy9BcWZMVDlySzZwK3VXd1l3TGNFZ2RvU2FFOGY4cjJsa1g3MDRmd3VR?=
 =?utf-8?B?UnVNN21uMVRpMFN1bDRSMjl2WVJOeFRtbGRyWEJyUm1CMEd0OHEweWlZWVMy?=
 =?utf-8?B?UlZGWWVPbFJuYzdCWXdwVHJQdFk2YnVhQjgxa0V3MGg0VHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SmFtRGJiMi94QWJlUkVrRVJwSCs0RWlqZ052ZElQZEwvQlYwWWNlbWtUS2RS?=
 =?utf-8?B?WENzRTQzb29Zalp0RTVGQXBYRGtyVnhmSElQcFc4V0hGKzliSmZLbmtUV3Rj?=
 =?utf-8?B?QnBUNTdXU2VwLzJSVVpIRTAvWnFFeWRZOG1hZVZ4MXlEdmZjU0lNQzM1dmRN?=
 =?utf-8?B?ZFRDeDdUNXBQOHZjdzhwM3ZNaW95SzlVYTJhQitNOXQ0cElUMFJTWmxpV3RZ?=
 =?utf-8?B?QkN5TzRSQUREa0tKSGt6a0lyYWd3enNqeGYrZUFhYWJ0YUtNN1RFa3I0MGF5?=
 =?utf-8?B?TWVXZDEzdFNsWnNXTVlnbi9jNlowMFBoWnc4bUlUYmV5WG9lMzR4aWlnYllC?=
 =?utf-8?B?Q2lsQ3BaVGhXM2N4Mko5MkJJUWgvZ2l5VzgyQWduS0JmcGFCbWFkUHNWcUpU?=
 =?utf-8?B?RTRLdEJjMmg4QTY5YmpQTDh0cVJvNGR5Mms4TjFUMGJTNUJ4RlRGK2NNNlBX?=
 =?utf-8?B?RlVJdTcwMGFMakcwS1ZaWTkvRkFJcGdoTzJqemZvTnJTMFAvTXpIam9TZmtD?=
 =?utf-8?B?RHNHaUhEdkQ2VHlQZVE5a0tBbGFsSDVTa3EzRmpSRVdPZjVUamphZkJ6aDQ3?=
 =?utf-8?B?Z3E3OHlvejNvSm1qYU1iRTlpdW90R3ViOXhzaitvWVB1Vjcra3JPdXVtNkxQ?=
 =?utf-8?B?Zkh2NnNMTjhnbThqN1dpSXZidkd2bzNZYVI4cW84cFpDM1Q5akQ0OU9jK2VE?=
 =?utf-8?B?WmpJZDJLTmlmR1VHYTNyU3QxV2pJMmRGMm9pbEpwZWhQMjR6UndKMExPU1Iz?=
 =?utf-8?B?Rk1WUTNXZVcyaDRvWXRMUFlYQTN3dDYzRGRvNC95cGszRHc5MGlJUXozWnNE?=
 =?utf-8?B?dFYrVFBsaWtDeW5DVnd3QXRTN0ZjTHRIN2tqV2xhYU5sR0VGUWg5ZExJT0Qx?=
 =?utf-8?B?Smtsb01nbUJSYk0rZzl2MFhkT1d2WWM1SXNVRHIzR1MxSmFCaXpXdWZHbmRD?=
 =?utf-8?B?NzljS25iYVVyQjJvZFMxZ2NQNG5jTHBWbVJzNnhQSU4vUlNmcURJNTR3bllS?=
 =?utf-8?B?Qi8zWnRBVmMxV2x6TGxlL1VvU1E5QmtXbjM3OWN4ZzI4QkkyR09ZTnQ4ejdt?=
 =?utf-8?B?NGdLZlBieDYrZ25VelFxYTVKNjJLS2lvbnJjNzFEeWQrZGIyOUcwWTRhSUwr?=
 =?utf-8?B?NGxVZ2lLRWYyUFRyemp2aVY5ajVrZXJOallTODd6ampGUDBuZklwblIyQ0hY?=
 =?utf-8?B?Qm1pK1pGNDJnNEVIWjczaVR2M0h0ZExNeXcvRWtEOVFrQVprb0pIVXp3Ui9Y?=
 =?utf-8?B?VDliVHgwdlQyT05PcGJVcHVKRXFoNTVXWjhKMmdBdWtjSUdCSTQ3V0J0bHg0?=
 =?utf-8?B?cEtCYWtqSjNYSDk3SUVROGJ0dmtuWThjVWQ0a2N4REVtSXJGQWp5TTh6UGhl?=
 =?utf-8?B?eHNGUWhrVFBJS08xNW5QaUNtY0JjMlhZWGpzd2ZFRmtXSjRjK1dldTBhNmhD?=
 =?utf-8?B?bWtpTVN0aVdtU2tqSnZlVkpSWVh4bGd2c1F3RzNOWXhkRUNXSG1BVWZDeklG?=
 =?utf-8?B?S0wwRkN0Wk1nQ29OUXNDV3BVallOYmswWE1YZmQ0dUZXOHk5elIyZTh3RFdt?=
 =?utf-8?B?NjhnckdGTUF6V3BkdnhnMmg1K3pCRXJKWlF2UjdPRUpnQzN1UytRSkhEUHJO?=
 =?utf-8?B?NTcvbnY5dC9iNnhBY2tPcllvcm54Y0hmUXB2czZzYVlIRFl6T25OaGxEWWpu?=
 =?utf-8?B?azV4M2hTMXlSTUhFWHM3OGhmbURucXdUb3ZEdDgyaWdFaDhaTkRQWnlkeXFn?=
 =?utf-8?B?a1NlK2d0MFZqckFUMkJSK1dGNDA0L0hnS0xXd05sMGhjWHhGK0ZsZEt3MVk3?=
 =?utf-8?B?K1E1MWpvZ1BKQjVFeldCYTdXOVFiMmdESG0xaTN3N1dqVkpoOTFVckh0OGg4?=
 =?utf-8?B?bDRBdXBLKzUzMUJwVytOalNiZktIelVOa1k4T1ptNTZPYzVWNTlNTlJXUmlt?=
 =?utf-8?B?QXpzYWh1b1hoMU1QUlZJOGJCbk1LTkVHVmtuOE1jSDBOWmw0cnU4RDdWSkY1?=
 =?utf-8?B?V0c1WW8yVGNOMW1IN3cwcjFTV0RjNjRlTkdFa1Q2bDducWN5NEJ5bGxnNjFq?=
 =?utf-8?B?RTZTWE1PRUt3RkdtbnNkSjVMaDhxWUszWGhadFhXdjZkK2NaUXRsWDEwUGs4?=
 =?utf-8?B?VVZQVmkxVVJpSEpTNk9uSU0rd2NUdUFXN0xDbGt6bHBvR2MzOWt4TFRudHFz?=
 =?utf-8?B?dlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB65C18CD5F2A74CB826F2512CE646B6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6df357-6b18-4cb4-d256-08dd1b933ee7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 16:28:58.5386 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B9NSvYsuxj9m8QAQ2YQEqrbY72Bd+NBbwFnnWBT0uY5Dx4M1FEcYbejZNjvENEdeLv7YGrzYv5ca/x9gWF6w7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7867
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

T24gRnJpLCAyMDI0LTEyLTEzIGF0IDA5OjUwIC0wNjAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9uIEZyaSwgRGVjIDEzLCAyMDI0IGF0IDAzOjI0OjU5UE0gKzAwMDAsIEpvc2UgU291emEg
d3JvdGU6DQo+ID4gT24gRnJpLCAyMDI0LTEyLTEzIGF0IDA3OjEwIC0wODAwLCBKb3PDqSBSb2Jl
cnRvIGRlIFNvdXphIHdyb3RlOg0KPiA+ID4gT24gRnJpLCAyMDI0LTEyLTEzIGF0IDA4OjM4IC0w
NjAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6DQo+ID4gPiA+IE9uIEZyaSwgRGVjIDEzLCAyMDI0
IGF0IDA5OjEyOjUyQU0gLTA1MDAsIFJvZHJpZ28gVml2aSB3cm90ZToNCj4gPiA+ID4gPiBXZSBk
byBub3QgYnJlYWsgdXNlcnNwYWNlLg0KPiA+ID4gDQo+ID4gPiBUaGVyZSBpcyBvdGhlciBwYXRj
aCB0aGF0IGFsc28gYnJlYWtzIE1lc2EgcGFyc2VyOg0KPiA+ID4gDQo+ID4gPiBkcm0veGUvZGV2
Y29yZWR1bXA6IEltcHJvdmUgc2VjdGlvbiBoZWFkaW5ncyBhbmQgYWRkIHRpbGUgaW5mbw0KPiA+
ID4gDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gVGhpcyByZXZlcnRzIGNvbW1pdCBlYzE0NTVjZTdl
MzVhMzEyODlkMmRiYzEwNzBiOTgwNTM4Njk4OTIxLg0KPiA+ID4gPiANCj4gPiA+ID4gQnV0IHdl
IGhhdmUgdXNlcnMgY2FsbGluZyB0aGlzIGZ1bmN0aW9uLi4uLiB0aGUgcmV2ZXJ0IGlzIG5vdCBz
byBzaW1wbGUuDQo+ID4gPiA+IEkgdGhpbmsgd2UgbmVlZCB0byByZXZlcnQgdGhlIGZ1bmN0aW9u
YWxpdHkgcmF0aGVyIHRoYW4gcmV2ZXJ0aW5nIGFsbA0KPiA+ID4gPiB0aGUgcGF0Y2hlcywgb3Ro
ZXJ3aXNlIGl0IHdpbGwgY2F1c2UgYSBsb3Qgb2YgaGVhZGFjaGVzLg0KPiA+ID4gPiANCj4gPiA+
ID4gSSBwcm9wb3NlIHdlIGdvIHdpdGg6DQo+ID4gPiA+IA0KPiA+ID4gPiBhKSBkcm9wIHRoZSBc
biB0aGF0IGJyb2tlIG1lc2EgYW5kIG1lcmdlIHRoYXQgd2l0aCBjYyBzdGFibGUuDQo+ID4gPiA+
IA0KPiA+ID4gPiBiKSBtb3ZlIGJhY2sgdGhlIGVudHJ5IHRvIHRoZSBwcmV2aW91cyBzZWN0aW9u
IHRoYXQgYnJva2UgbWVzYSBhbmQgY2MNCj4gPiA+ID4gICAgIHN0YWJsZS4NCj4gPiA+ID4gDQo+
ID4gPiA+ICAgICBKb3PDqSwgd291bGQgaXQgYmUgb2sgdG8gbWVyZ2UgYSBwYXRjaCBpbiBtZXNh
IGFuZCBwb3J0IHRoYXQNCj4gPiA+ID4gICAgIHRvIG1lc2Egc3RhYmxlIHRoYXQgc2ltcGx5IGxv
b2tzIGF0IDIgcG9zc2libGUgc2VjdGlvbnM/IE9yIGV2ZW4NCj4gPiA+ID4gICAgIGRyb3AgdGhl
IHNlY3Rpb24gY2hlY2tzLi4uID8NCj4gPiANCj4gPiBCdXQgaWYgWGUgS01EIGlzIHJldmVydGlu
ZyB0aGUgcGF0Y2ggdGhhdCBjaGFuZ2VkIHRoZSBod2N0eCBzZWN0aW9uIHdoeSB3b3VsZCBNZXNh
IG5lZWQgdG8gYWxzbyBwYXJzZSB0aGUgbmV3KGZ1dHVyZSB0byBiZSByZXZlcnRlZCkgc2VjdGlv
bj8NCj4gDQo+IGZpcnN0IGlzIHRvIHVuZG8gdGhlIGRhbWFnZSwgd2l0aCAwIGNoYW5nZXMgaW4g
bWVzYS4gV2UgZG8gdGhhdCBmaXJzdCBhbmQNCj4gKnRoZW4qIHdlIGFncmVlIG9uIHdoYXQncyBw
b3NzaWJsZSB0byBkbyB0byBhY2NvbW9kYXRlIHRoZSAyIHBhcnNlcnMgd2UNCj4gaGF2ZS4NCj4g
DQo+IElmIHdlIGNhbiBnZXQgc29tZXRoaW5nIGluIG1lc2EgdG8gd29yayB0aGF0IGlzIGJhY2t3
YXJkIGNvbXBhdGlibGUgKGkuZS4gdGhlDQo+IGNoYW5nZWQgcGFyc2VyIGlzIGFibGUgdG8gcGFy
c2UgYm90aCBiZWZvcmUgYW5kIGFmdGVyIHRoZSBrZXJuZWwgY2hhbmdlKSwNCj4gdGhlbiBpdCBj
b3VsZCBiZSBjb25zaWRlcmVkIHRvIGEgbWVzYSBzdGFibGUgYW5kIHRoZSBrZXJuZWwgc2lkZQ0K
PiBjaGFuZ2VkLg0KDQpPa2F5LCByZWFzb25hYmxlIHBsYW4uIEJ1dCB0aGUgYXNjaWk4NSBlbmNv
ZGVyIHdpdGggXG4gd2lsbCBub3QgYmUgYnJvdWdodCBiYWNrIHJpZ2h0Pw0KV2l0aCB0aGF0IEkg
Y2FuIHdyaXRlIHRoZSBNZXNhIHBhdGNoIHRvIHN1cHBvcnQgYm90aCBzZWN0aW9ucywgdGhlbiBp
dCBpcyB1cCB0byBvdGhlciBNZXNhIHRlYW0gbWVtYmVycyBhZ3JlZSB3aXRoIGl0Lg0KDQo+IA0K
PiBMdWNhcyBEZSBNYXJjaGkNCj4gDQo+ID4gSSBjb3VsZCBDQyB0aGUgTWVzYSBzdGFibGUgYnV0
IGl0IHdvdWxkIG5vdCBiZSBwaWNrZWQgdG8gYWxsIE1lc2EgdmVyc2lvbnMgd2l0aCB0aGUgZGV2
Y29yZWR1bXAgcGFyc2VyLg0KPiA+IA0KPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gYykgc2V0dGxl
IG9uIG9uZSBvZiB0aGUgcG9zc2libGUgc29sdXRpb25zIGZvciBcbiB0aGF0IHdlcmUgcHJlc2Vu
dGVkIGluDQo+ID4gPiA+ICAgICB0aGlzIGRpc2N1c3Npb24uICBJIHRoaW5rIHRoZSBzYW5lc3Qg
b25lIGlzIHRoYXQgYSBzcGFjZSBpbiB0aGUgZW5kIG9mIGENCj4gPiA+ID4gICAgIGxpbmUgcHJp
bnRpbmcgYXNjaWk4NSB3b3VsZCBzaWduaWZ5IGEgY29udGludWF0aW9uIG1hcmtlci4gIEJ1dCBt
ZXJnaW5nDQo+ID4gPiA+ICAgICAoYSkgbWVhbnMgd2UgaGF2ZSB0aW1lIHRvIGRpc2N1c3MgYW5k
IGFkanVzdCBpZiBuZWVkZWQuDQo+ID4gPiA+IA0KPiA+ID4gPiBBZnRlciB0aGUgZHVzdCBzZXR0
bGVzIHdlIG1heSB0aGluayBvZiBhIGJldHRlciB3YXkgdG8gZXZvbHZlIHRoZQ0KPiA+ID4gPiBk
ZXZjb3JlZHVtcCBmb3JtYXQgc28gaXQgZG9lc24ndCBjYXVzZSBicmVha2FnZXMgaW4gZnV0dXJl
IHVwZGF0ZXMuDQo+ID4gPiA+IA0KPiA+ID4gPiBMdWNhcyBEZSBNYXJjaGkNCj4gPiA+IA0KPiA+
IA0KDQo=
