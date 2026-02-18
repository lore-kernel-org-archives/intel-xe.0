Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1E9E9A04D
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 23:21:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00FD210E04A;
	Wed, 18 Feb 2026 23:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sd8KjQK+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81AD610E04A
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 23:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771456864; x=1802992864;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=v+VXGsN9HB0rAgAo3JeT7MSiY/oIk/1+WFT+5tXw6u0=;
 b=Sd8KjQK+Cuw/dy+4E0nzfMx2OUVSNtNjp1JPfnwS15pBktermRdAomwZ
 IRzEObH6t7cXSoG2/b0ZC7+dv6PdhAU1hsSXu6Kfu6bqKRM8plYyWIUOE
 I2JiwTXEdjIPirccyfChdYCu+vgfcqh8XB+XDwBVIXMwgw23+vSm4dBDx
 xaRsjop+CA+xuykMustAun7dbUhfrFKVmepFuwSMY8v/pMqP3KNft0g46
 j8lkPX6yBnhlmKCMz812JVzQSL/SIpb1QcRKpAQMpq52GkPyfJV2bKIMJ
 rz6JDEbgs/xITWMeok1Wos39CtAQiJMvUcc3P6dvjKqEK7+pk8InIr7a9 Q==;
X-CSE-ConnectionGUID: xjO3hgG5TduUFGS+QyqwdA==
X-CSE-MsgGUID: jahYGTzNQMeHt/0klbRjXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="83166397"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="83166397"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 15:21:03 -0800
X-CSE-ConnectionGUID: Fn14aNdFRNa7SUmiSv4aeA==
X-CSE-MsgGUID: /Esvzj0dS6if8YvP1YBlog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="219349193"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 15:21:02 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 15:21:02 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 15:21:02 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.53) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 15:21:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rEysqRkMTBmXH8n9QTIUH5f06nebLFAZzVM4lfpzGr9z7QJ3aDCgixRXwafiCHkkgvFPZuEiOQbprn8TUSmoYf4zNHUqpAxEBe4dK177QkZeri5xjFddechftqABa0uLUllOCs9hh3wk0sbqX1tCb1xec/GzUohVzAxvx4uf+7SmEahFu1zeHwrFnBZrlh4X+lw6QxPjF7r90qyKyKKVQVymVvUpKl5aSEltjq84xHPLuBrwhIbUQQcT7H+ThO3JFOTnn0JOSea4H4iu+S3FDnIs19P7d4IzlYypatjRs3V6EhV3NrEp8WT3dtOHC7JzRXkwro3WII7cmwmdFE1JNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+VXGsN9HB0rAgAo3JeT7MSiY/oIk/1+WFT+5tXw6u0=;
 b=vb97xT9UB86INkPj0ZkP1VrXyMmJGKMdFRlbRcLZRSth3/q2UpCU7+fFqyFpcr9Lbg9rd02FL1RCzg69d9ejfmEmZRpgIBqX/iJdvdduz73SPQZKSyzeiWoxgKtr5s0M3P+fjFZKIzg7b6OJJcYv9IbCKnVKPQbKe/pW0Yfb9CUFkLmkKuLlehSZyhE2pSB4ca2xx7kIX64F2s7u8L2SqogyPJ7eipBjoKDXz4OLUVlHE+vy8UciYrLYjJipJsdSXirGpN3IKS8iTiv6C+VjCybU4iXGC5l3CycTj8LhkFP+K9MpHP0kTe/+PpP+UkU3S//JZaFdxre7Ras18hIKNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 IA1PR11MB7365.namprd11.prod.outlook.com (2603:10b6:208:423::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 23:20:59 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 23:20:59 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Wajdeczko,
 Michal" <Michal.Wajdeczko@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH v3 2/3] drm/xe: Avoid unconditional VRAM reads in H2G path
Thread-Topic: [PATCH v3 2/3] drm/xe: Avoid unconditional VRAM reads in H2G path
Thread-Index: AQHcoI+79IZd9OKYZ0SbK60z6g1IHbWJGViA
Date: Wed, 18 Feb 2026 23:20:59 +0000
Message-ID: <804b1ee3dda5fdf6a3579f9a6e515f8ab1277c39.camel@intel.com>
References: <20260218043319.809548-1-matthew.brost@intel.com>
 <20260218043319.809548-3-matthew.brost@intel.com>
In-Reply-To: <20260218043319.809548-3-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|IA1PR11MB7365:EE_
x-ms-office365-filtering-correlation-id: 56847fe1-0b97-471b-7edd-08de6f445fef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?MDNvSmhGM1ZhdmMrSXNXbGF0dmhpaC9Jb3E2ajZBZ25PUU5wZFZ5Szk0djRv?=
 =?utf-8?B?a1pnL0d3N01JM2NSZ0VXRkk2RkZXRE9ydklHbGQxTWxaQ3FoN3RwMld4QUJp?=
 =?utf-8?B?RmZhYnFZc0taNUFsWlpBZmpPUnEwd1Z4TmNwTHVPcSt5Y0JhanRVVThtNVJW?=
 =?utf-8?B?QkdONTZoQllzWDB0QTJhdTBUVzFNQVd1bXh0eVRYOEV6SmZmNW96eENSL1FI?=
 =?utf-8?B?V09lT2VVWENRWlRDUzNXWnBkYnhVcGZIU0FwWG1ZTTJmQ0tyVUQ2Y3JhQlVQ?=
 =?utf-8?B?Q2ZvYUlLSXVQMUsrTTVVSW9ZRFJmTTRQMGZ2b0k1Mkl4cjVmVDM1S0pneW9M?=
 =?utf-8?B?NUl2THMwK1Vsai9wR2hKRVRPQm92SzdNNWcxTnc1VGhsV3pJeHRDc3JNUHlr?=
 =?utf-8?B?Qk9RVkJEaHMxS2xJci9IbHlDcHZ0TkNKcHhVUHNnemFMQlJZdnBvL1NSUVBF?=
 =?utf-8?B?R2o1dmJDK1BKVFdLYitIK3VSQi9sek1sOHlPSTAyR1pmUEY4ZkpaNVVhWEM2?=
 =?utf-8?B?dklxUVQzc1FhdDE4TU9KalJObVZGSjRBREdHVXV6N3V5MGFEZHJBVVhTRVhy?=
 =?utf-8?B?b1NDclFzNHI2WnNPQUt5U2RlWW00ZytPSm5EUGt3Tng1NjhvRmJqanM4ZkZj?=
 =?utf-8?B?QVVDdldBUUhVQ2FYYjZudlhoVVhSdmFyK21EWU1KbThoTHNJOHdMN3o0OEF0?=
 =?utf-8?B?MFRkOHprUTN6WCs4TEJkTVJaQWdDTHFCQXJmL2tyNmFMNTlMR2haOGRqSWd2?=
 =?utf-8?B?Zk1UejdicVB1d2p3VWdsVUFqcG1BYW1uMjlUM21oZGxOMFlZbUc4UlpqYzIy?=
 =?utf-8?B?eHk3U29XUkpEanFROGJLTGdYbHpEZ0pXTzM5ZkVHQmZ0cG12S0JHSS9CQlVL?=
 =?utf-8?B?T1lQdVdHZERJRnhUalZmRlpvWHZhaUdWRmVabE8wTjYyV091ejcwTTNvUFRy?=
 =?utf-8?B?aXlFQllFWjNxeExwUEdtZ1dpOGZFbG1vc1AwcCtzMkJVOHRYTnNuYWEzV1hI?=
 =?utf-8?B?ZzN1UzhtdnRaYTNHbFlwRmJ5RUlvempPeTcwM3pITCtzSCtWV01qdUJlVjR1?=
 =?utf-8?B?SXkrOW9PWXJ2WXpnbjRKcjVFREcvUUg4ejhyN1ZjRUFuYVZqMmNLS3dwdWNr?=
 =?utf-8?B?eFpHVVRlRUpuaXdtUjk4VWhiLzhpa1JraEN6NlRXSVZ1UDVJTUdnNDI1VE5w?=
 =?utf-8?B?ZlQwN2plWVNmMW1BWUZ4bGNnR0FaRzJ4eDlhZDVMbk8wNWRWcTNQbHppdDFK?=
 =?utf-8?B?aURtWlBkUTBvTC9LUXh6UjdpWVNJYzNCMm94RmxROHJ6ankvQlFUdzMwVm51?=
 =?utf-8?B?Vi9tR1dGS0s2anVWaGNKcGdBUjMwR0t5c0NleXdYVVNOcDFYSlNXSVpaQjVS?=
 =?utf-8?B?clVFU0ZOUmJpdEx6TXJINDh3emtLTTVZS2VWNC9rUWtDa2RHUFMyL2gvT2hZ?=
 =?utf-8?B?Zml2N3BIOXJrN1ErV2hlTkx3SFVkcGtxTmN3bnk3SmE2dWNsRkVTSFdqQzlO?=
 =?utf-8?B?ZThRNUIxTUdvOVREZVpZcUl0WGtoTDJ5bzNRMHMrQlhmeStFdTZqRSt1SmpB?=
 =?utf-8?B?cWtkaEp4czRvYVRLcmdVVWhybXVQUkpBbUxBTzRxWXEvSk12ejJrOGhhTnIy?=
 =?utf-8?B?cVcyc2N2eHBQUzdpMFZrdWtmcitnVTlZNytrUzU3aGRlUmIvZklwQ3lrTzNL?=
 =?utf-8?B?NHh5RzdTbno0eHBWbml3SEp4TVBqRHRHZXFmNXJJUjN4Q1VsSjRVdjNOb2lU?=
 =?utf-8?B?MmR6djVLSG1Ya1VCeFZZdWpjakh0U0pJRnBtMVBHbVpGR2tSQld3enhtcEwz?=
 =?utf-8?B?RlV0NStKY0JDTjJPRFBuT1BLUHg0Q2EweFpreHhxMnhBajBUMU9VYzhGZjhE?=
 =?utf-8?B?NXprOFN5cVJxUmt1T1c2bks0MFFLdjUrTitkWHMySHEwSjdkSnR3dlhrQzJ1?=
 =?utf-8?B?SEZiWFhSRzdhYkFJbC93WGo0eVFPbFlLSFNCQVJWeExiWlEweWNMZituS1Uy?=
 =?utf-8?B?MisrWWhGRUhjWXFvb1kzTTlVclRkUDd5QTdzZ3lpbVkvN01tWXVvd0s3K2hm?=
 =?utf-8?B?c21XU1lsMzFyb0tWOFlMRiszRG9GMTJIVUNaNGppNmdkSkJhT1BiVXdtMTRH?=
 =?utf-8?B?WkhkdHl6YWl2UHZUNjZmZFpmTU90WW5TbXZTUUwyK2Q2ZlFTRkZMVjlOcUVC?=
 =?utf-8?Q?v/7asZJIYbOxNlMZFDGJKCg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QW1DdXUvWURlU2hHU2xIYVJLL1k4NndVdG5yYm03YklZZmpRbVpmamg1ZFg3?=
 =?utf-8?B?K3V6WjdwMW1xd0xVQlh1VUVodWNiWGlGWDZNd2ZvTUdrZ2R0clN2SktjbW8z?=
 =?utf-8?B?TDI3QmErNllOOVhMdkFXTGFIM3hJby9Nelhaa2piSDI0QmovMmxvamh2WEph?=
 =?utf-8?B?cHFvVlBiTW0yM1hnNmhlY3dneTY3WENVWjl5TlBCS25Ra0czOUNEWG11T2NX?=
 =?utf-8?B?NEtTTkp2MVUvWDNMbVZZd2ZmTjgzUmM2NCtpTlk4bjVoSW9RbzJzZFlOdzNH?=
 =?utf-8?B?dzdEQXVEY1V4ZXpXWHRzaktwaUQ1aE1sNGlzMC9KeW1NNk1EVVhGYVJxRlJ1?=
 =?utf-8?B?QnNSVXBwaW56UEM5bE5tc0dsWHJYdmkvTGJFbjBKOG5PenhSMENiVmNJYVIw?=
 =?utf-8?B?cFV5Qkh2K0NkdU5kTFhyL1lVN1ByL244d3FGQlJJeFpxUTNQd2tpaWlNeGsy?=
 =?utf-8?B?U2pWY0R3RjcwZVZvYzlON0cySUlyd1cxTGgxNmtyY2d0VWoyM1lzdVV6emxY?=
 =?utf-8?B?VWJhWEcvZzR1TTgxd2JCTzVIL1BLaTRpcmhDK0VScUI1MG9aMmY4MlE4NmdX?=
 =?utf-8?B?aGVKOGNVTTFPbG1ORDJpc1diQXlyV1BEMThoWVpERWxIUjVSTWdlN2Q2dER5?=
 =?utf-8?B?aFA2dGE4ZWJ3UEwwbnZQU1VuZ0h0NGNjd0Q0YjRjL3hURnBVUHJCRHdZd2FU?=
 =?utf-8?B?S3BXU0x2MjAxaW5sVm53SjBvbzI3STZ4QmYxRGxiajVDU1F1ckJoM2E0Vyta?=
 =?utf-8?B?OGVpNHgxYjFSSE1OZnF1YzNQOGh2OCtKQ3RUMktCV3BtK0IwM2NLU0tnUldz?=
 =?utf-8?B?RHFPbUxEbGdhWjBORWhadTJjQmtwd0hhdXlneDN3QWY3Mm5XYUkvQis0dWJE?=
 =?utf-8?B?QXUzN2paY0VEZEQyYkkxTDNyRXljMDJycjZlYXlCWEwwTmdtNEdqSS9EOHpC?=
 =?utf-8?B?aDY5ckM3RDRDbFR6T0pqMFZQKzdqR09Ic2xaMERUNXlJSDlqYTdBbFgrVWlK?=
 =?utf-8?B?Zkh5OVlObDhpUmFReTEzVkxEb2pha05MZUhvbnRCOXd3djkzTmlLYzJpalhs?=
 =?utf-8?B?c0xPL3k5NTZQTmtYY0FKVStvS05VNnM4SlhyN1h0ZE1PNUV1K2RpK0tHTUtC?=
 =?utf-8?B?ZGlveXFSVEZ4L1FvazBlSXVTdXhhRmxtNHFWS2JqT001ZVlFS2MyeFJGYnlN?=
 =?utf-8?B?YkJCU0o3d3V5cFZOYW1KL3N5QkV3TjZNMUlNT0UxblNETWVTTThzSXl2T2Rj?=
 =?utf-8?B?OG9xREliM09PWFN1QzJlcFcxUHcrZXNOaDJoMUNjMEE5NFl0K0NHZnRQTFVo?=
 =?utf-8?B?eEpGN3YwOXR3OTZOemNoL2JKOTR4WE5sam40d1A0T3VtVmRVSzNzSWFUVXFs?=
 =?utf-8?B?SVI2MmpYR01OaUcvaE9NUWtWNjJLY0JLYjY0NU50SlpTdG92d2xJZWt4V2h6?=
 =?utf-8?B?eWJHeXFmc0xsK0RPWUpzejViTFB6aVUwRHZ6SkNycmNoUGhkV2F6MDVYZzd2?=
 =?utf-8?B?SGdqSXZ2RUpUOTdGSmV4RXpZVjdEeTk1MHAyQXNob045ZEx3LzZqVXh2UHlV?=
 =?utf-8?B?MFFzeUZvUks3SDgza2NwNFdpeW8zZ04rZlFxajZELy96RjhJcmtueHdJUjF6?=
 =?utf-8?B?UkNISjh6Y29lZDQ4TXZ3TkFPbWV2K2QvNWoxNWxIT09qZUpsSWRuenc5ajFC?=
 =?utf-8?B?UVdFVWpjR0ttSXlDNTB1YmdNVFBoaHVZTWdvZ1pmcm1XVi9NV2dNUkpMNWhD?=
 =?utf-8?B?SmxGQ3hxQU96WWxJbFNBdUhGc0JlSm5CZHlNTkk0enVUNkxpSDZ2VEVJcVEz?=
 =?utf-8?B?Mkw3ME1zQ1BxTDNZWmJkek15OGVWTk9nWG4zY0VhMElXRzhDR0tOVWhjZCt6?=
 =?utf-8?B?bHZqTjE0MUF6UCtUS1VFNmZ5SGh0RkVEL1RjQkZ5bHFlYWlMR2pEemhBSWRh?=
 =?utf-8?B?RWt2UUQxS2xTeDI1L2NxV0VkL2k3NGlDNGdHV3E1Mm9mZEV3UFRHbnVQdnlK?=
 =?utf-8?B?Q1BMRjVYV21uSy8way9XUlBQdkEvaWQyd0lqWU5sazJROGp3RklXZGNDWFl2?=
 =?utf-8?B?UVErSFJwTHErcDJkWjNzaVhuTStUMXpwYnF3YzRQWjF0YmZ2VEhWRENnUXpG?=
 =?utf-8?B?N2cxTk1nc3FEMW5ZUGUxSk05RjRvU2I3SzdjRTA2dWN2dzBQVHNFTldHQ2VG?=
 =?utf-8?B?RlJvSldZQzh6TjVCU0xuenNuOTRXcXZDZGZoVkpsOElDbG95eklQVWF0ZjFt?=
 =?utf-8?B?OUpMR0lRRnViSm5LMkFwcFJoeW93RjYrUU5OYlJCVzVJcXVaVU5SejN3a2VN?=
 =?utf-8?B?Q3dVVkNnRXhubXJyWUFXVGFVSW9uUUJYVnN6T0JEaHBOQTkzWGJPMDJleHZE?=
 =?utf-8?Q?qO9zBMVy23E01hOQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E37C178ACA91094BBEFD226060D32397@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56847fe1-0b97-471b-7edd-08de6f445fef
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2026 23:20:59.0955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B3kGwoRrqUPPWRhjnFaqe36xKlWZd83hALd9E6XuBIBCnHGwxPURpvXnMIF7fBoMM5TjTQbLI+6EpoGIz+0ibhIOI1iDs4iS2kawqll9B3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7365
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

T24gVHVlLCAyMDI2LTAyLTE3IGF0IDIwOjMzIC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IGRlc2NfcmVhZCgpIGlzc3VlcyBhbiBWUkFNIHJlYWQgd2hpY2ggc2VyaWFsaXplcyB0aGUgQ1BV
IGFuZCBkcmFpbnMKCkZldyBzcGVsbGluZyBuaXRzIGluIHRoZSBjb21taXQgbWVzc2FnZQoKL3Mv
YW4vYS8KCj4gcG9zdGVkIHdyaXRlcyBvbiBkR1BVIHBsYXRmb3Jtcy4gVGhlIEgyRyB0cmFjZXBv
aW50IGV2YWx1YXRlZCBpdHMKPiBhcmd1bWVudHMgdW5jb25kaXRpb25hbGx5LCBzbyBldmVuIHdp
dGggdHJhY2luZyBkaXNhYmxlZCB0aGUKPiBzdWJtaXNzaW9uCj4gcGF0aCBwYWlkIHRoZSBmdWxs
IFZSQU0gcmVhZGYgbGF0ZW5jeS4gR3VhcmQgdGhlIHRyYWNlcG9pbnQgd2l0aAo+IHRyYWNlX3hl
X2d1Y19jdGJfaDJnX2VuYWJsZWQoKS4KPiAKPiBBZHNvIG1vdmUgdGhlIGRlc2NyaXB0b3Igc3Rh
dHVzIHZlcmlmaWNhdGlvbiB1bmRlcgoKL3MvQWRzby9BbHNvLwoKPiBDT05GSUdfRFJNX1hFX0RF
QlVHLgo+IFRoaXMgcmVtb3ZlcyBhbm90aGVyIHVubmVjZXNzYXJ5IFZSQU0gcmVhZCBpbiBub24t
ZGVidWcgYnVpbGZkcy4KCi9zL2J1aWxmZHMvYnVpbGRzLwoKPiAKPiBUaGlzIHJlc3VsdHMgaW4g
fjEww5cgZmFzdGVyIEgyRyBzdWJtaXNzaW9uIGFuZCBzaWduaWZpY2FudGx5IHJlZHVjZXMKPiBs
b2NrIGNvbnRlbnRpb24gYWNyb3NzIHRoZSBkcml2ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWF0
dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+Cj4gLS0tCj4gwqBkcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjX2N0LmMgfCAyNSArKysrKysrKysrKysrKysrLS0tLS0tLS0tCj4gwqAx
IGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jCj4gYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3VjX2N0LmMKPiBpbmRleCBlYTA3YTI3NzU3ZDUuLjM3ODQyYzkzZTBlZSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2N0LmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3VjX2N0LmMKPiBAQCAtOTM5LDIyICs5MzksMjIgQEAgc3RhdGljIGlu
dCBoMmdfd3JpdGUoc3RydWN0IHhlX2d1Y19jdCAqY3QsCj4gY29uc3QgdTMyICphY3Rpb24sIHUz
MiBsZW4sCj4gwqDCoMKgwqDCoMKgwqDCoHUzMiBmdWxsX2xlbjsKPiDCoMKgwqDCoMKgwqDCoMKg
c3RydWN0IGlvc3lzX21hcCBtYXAgPSBJT1NZU19NQVBfSU5JVF9PRkZTRVQoJmgyZy0+Y21kcywK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHRhaWwgKgo+IHNpemVvZih1MzIpKTsKPiAtwqDCoMKgwqDCoMKgwqB1MzIgZGVzY19zdGF0dXM7
Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgZnVsbF9sZW4gPSBsZW4gKyBHVUNfQ1RCX0hEUl9MRU47
Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgbG9ja2RlcF9hc3NlcnRfaGVsZCgmY3QtPmxvY2spOwo+
IMKgwqDCoMKgwqDCoMKgwqB4ZV9ndF9hc3NlcnQoZ3QsIGZ1bGxfbGVuIDw9IEdVQ19DVEJfTVNH
X01BWF9MRU4pOwo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgZGVzY19zdGF0dXMgPSBkZXNjX3JlYWQo
eGUsIGgyZywgc3RhdHVzKTsKPiAtwqDCoMKgwqDCoMKgwqBpZiAoZGVzY19zdGF0dXMpIHsKPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZ3RfZXJyKGd0LCAiQ1Qgd3JpdGU6IG5v
bi16ZXJvIHN0YXR1czogJXVcbiIsCj4gZGVzY19zdGF0dXMpOwo+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBnb3RvIGNvcnJ1cHRlZDsKPiAtwqDCoMKgwqDCoMKgwqB9Cj4gLQo+IMKg
wqDCoMKgwqDCoMKgwqBpZiAoSVNfRU5BQkxFRChDT05GSUdfRFJNX1hFX0RFQlVHKSkgewoKU29t
ZWhvdyBpbiB0aGUgcHJldmlvdXMgcmV2IEkgaGFkIHJlYWQgdGhpcyBhcwpDT05GSUdfRFJNX1hF
X0RFQlVHX0dVQy4uLiB5ZWFoIG5vIGlzc3VlIGhlcmUuIE1haW5seSBJIHdhbnQgdG8gYmUgYWJs
ZQp0byBzZWUgdGhpcyBpbiBDSSBydW5zIHdoaWNoIHNob3VsZCBtb3N0bHkgaGF2ZSBYRV9ERUJV
RyBzZXQuCgpTbyBhcGFydCBmcm9tIHRoZSBzcGVsbGluZyBmaXhlcyBpbiB0aGUgY29tbWl0OgpS
ZXZpZXdlZC1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4KClRo
YW5rcywKU3R1YXJ0Cgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdTMyIGRlc2Nf
dGFpbCA9IGRlc2NfcmVhZCh4ZSwgaDJnLCB0YWlsKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHUzMiBkZXNjX2hlYWQgPSBkZXNjX3JlYWQoeGUsIGgyZywgaGVhZCk7Cj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHUzMiBkZXNjX3N0YXR1czsKPiArCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRlc2Nfc3RhdHVzID0gZGVzY19yZWFkKHhlLCBoMmcs
IHN0YXR1cyk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChkZXNjX3N0YXR1
cykgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVf
Z3RfZXJyKGd0LCAiQ1Qgd3JpdGU6IG5vbi16ZXJvIHN0YXR1czoKPiAldVxuIiwgZGVzY19zdGF0
dXMpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290
byBjb3JydXB0ZWQ7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiDCoAo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHRhaWwgIT0gZGVzY190YWlsKSB7Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGVzY193cml0
ZSh4ZSwgaDJnLCBzdGF0dXMsIGRlc2Nfc3RhdHVzIHwKPiBHVUNfQ1RCX1NUQVRVU19NSVNNQVRD
SCk7Cj4gQEAgLTEwMjMsOCArMTAyMywxNSBAQCBzdGF0aWMgaW50IGgyZ193cml0ZShzdHJ1Y3Qg
eGVfZ3VjX2N0ICpjdCwKPiBjb25zdCB1MzIgKmFjdGlvbiwgdTMyIGxlbiwKPiDCoMKgwqDCoMKg
wqDCoMKgLyogVXBkYXRlIGRlc2NyaXB0b3IgKi8KPiDCoMKgwqDCoMKgwqDCoMKgZGVzY193cml0
ZSh4ZSwgaDJnLCB0YWlsLCBoMmctPmluZm8udGFpbCk7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqB0
cmFjZV94ZV9ndWNfY3RiX2gyZyh4ZSwgZ3QtPmluZm8uaWQsICooYWN0aW9uIC0gMSksCj4gZnVs
bF9sZW4sCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBkZXNjX3JlYWQoeGUsIGgyZywgaGVhZCksIGgyZy0KPiA+aW5mby50YWlsKTsKPiAr
wqDCoMKgwqDCoMKgwqAvKgo+ICvCoMKgwqDCoMKgwqDCoCAqIGRlc2NfcmVhZCgpIHBlcmZvcm1z
IGFuIFZSQU0gcmVhZCB3aGljaCBzZXJpYWxpemVzIHRoZSBDUFUKPiBhbmQgZHJhaW5zCj4gK8Kg
wqDCoMKgwqDCoMKgICogcG9zdGVkIHdyaXRlcyBvbiBkR1BVIHBsYXRmb3Jtcy4gVHJhY2Vwb2lu
dHMgZXZhbHVhdGUKPiBhcmd1bWVudHMgZXZlbgo+ICvCoMKgwqDCoMKgwqDCoCAqIHdoZW4gZGlz
YWJsZWQsIHNvIGd1YXJkIHRoZSBldmVudCB0byBhdm9pZCBhZGRpbmcgwrVzLXNjYWxlCj4gbGF0
ZW5jeSB0bwo+ICvCoMKgwqDCoMKgwqDCoCAqIHRoZSBmYXN0IEgyRyBzdWJtaXNzaW9uIHBhdGgg
d2hlbiB0cmFjaW5nIGlzIG5vdCBhY3RpdmUuCj4gK8KgwqDCoMKgwqDCoMKgICovCj4gK8KgwqDC
oMKgwqDCoMKgaWYgKHRyYWNlX3hlX2d1Y19jdGJfaDJnX2VuYWJsZWQoKSkKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgdHJhY2VfeGVfZ3VjX2N0Yl9oMmcoeGUsIGd0LT5pbmZvLmlk
LCAqKGFjdGlvbiAtIDEpLAo+IGZ1bGxfbGVuLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRlc2NfcmVhZCh4
ZSwgaDJnLCBoZWFkKSwgaDJnLQo+ID5pbmZvLnRhaWwpOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDC
oHJldHVybiAwOwo+IMKgCgo=
