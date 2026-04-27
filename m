Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C9DFF8868
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 16:39:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B20810E81F;
	Mon, 27 Apr 2026 16:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NJv28DvV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6615210E816
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 16:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777307980; x=1808843980;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZZqID8RiCRrdENZEgTGxd4UD35VukwR+NiQsMY2meP8=;
 b=NJv28DvVani9lZGZ9mxBeh/83kCimv4sbBbdpyLF6CXC8fx2WfGfaH/r
 sObdk6GxwYIgvsMt6CQiR0ltjJwxKokTFjcML6xPiEmY14mOlEVLjMXIM
 jTlbNNnuEnp5ZZnpE5bXJJrc8L4iniLcuxTFnKV2T4wB7EnmNeUN0FNan
 tWBGXqERHXYIeNtNbKWabAuxxOie99LTPS9d4DN3HJmRtcDkvb1Kn6PXV
 QkmeU0+Tj+hUeZcSrnA2m5lRWddJ14WeA6WFQ7v0b88R4L4IT9X8bAcd7
 NpzZhgmavLj721Lg87AMgiZ7zyBm5ykf0AlbWBj/DkgRsZR5HZXNCjTw9 w==;
X-CSE-ConnectionGUID: w3k2joZYQSeTazhyzKx9sQ==
X-CSE-MsgGUID: tdHwo8DQTFOk8K7u0LGT8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78261312"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="78261312"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 09:39:40 -0700
X-CSE-ConnectionGUID: 4kHrKxi1RB+JMS55Gmskmg==
X-CSE-MsgGUID: xhNyKIEeTKyd33LJgiup1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="233560076"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 09:39:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 09:39:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 09:39:39 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 09:39:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FMW9N4MHRqMfj378dGmc2LeT6n5PVHt8z9yLb4uTc+NIpnyXlYYE06YrGOPPxVmX+EkRYdiscvmJ41cb3tOxVVcvuFIA8LwIstnhAtcrzVqz+u0m1gcWU3r55vQ4wtSpWxlfBNgYds9SOGreaCBstNhtd3LVHZAmK5Rkn4kmz+sNB0wsEilf6sjlRTrdDPrtwWXUhCwjC0L0iRUnNEYiN8kAltkMyaPmG5/aRbRsLc2l/W4BocCG+n1V6lLpO6tlmNJ5pv7d/2OUXufuBAzrEqE6jolxbu63MdE9Z3um6Uk94qNs5exYLLQFbPNHguV5d8tHDQBayrKVSu5FfRoyXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZqID8RiCRrdENZEgTGxd4UD35VukwR+NiQsMY2meP8=;
 b=R3iOz66tozc5c9FR5PSIWZKxoBTIOG3FmT9gOshNNFCrKyjzPbTURQi+LFkNBbLbvWekCWGS+xNOa876BZlNmIFIyz6wC1VUHryhVTmE94SZ6RQR3UgLiB5+LYoQnTayayBeo0AE6RF4ORKWtTl3BFfDY1ONGwlNxae9lhmtfCnL0Qxw+62yBbZfZJgV8wz3E1qDTjwueSpH2xxES1oI6Vtuqz1am67udhhniETsmzcczoYKjfPdlCgQcwy5tW4VtncQF1rOzofs0a3BnFe4e/m0fIF7U2embnlBhqqdramOLjn+hwGVCR3LQ2bHtGZCU5Mb9VjOmh60y3wM5Yg2dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by MN6PR11MB8217.namprd11.prod.outlook.com (2603:10b6:208:47d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 16:39:35 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 16:39:35 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v2 03/10] drm/xe: Stop programming BLIT_CCTL on Xe2 and
 later platforms
Thread-Topic: [PATCH v2 03/10] drm/xe: Stop programming BLIT_CCTL on Xe2 and
 later platforms
Thread-Index: AQHc1CwM93WpAZYL902ak4UIjvuhB7XzIAYg
Date: Mon, 27 Apr 2026 16:39:34 +0000
Message-ID: <DM4PR11MB5456E86BEAC21D834084763CEA362@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
 <20260424-engine-setup-v2-3-59cc620a25f1@intel.com>
In-Reply-To: <20260424-engine-setup-v2-3-59cc620a25f1@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|MN6PR11MB8217:EE_
x-ms-office365-filtering-correlation-id: 18b1ff04-4832-4d30-0896-08dea47b90c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: e2N/MIJrRZLC/hF6ZB/aF2edCo9KL/OCxvXzERhEXfbkUvdI9uDayW364d8rcelGa4kZgHWsErbc6LmB2VcbtRiuwMSaUcGHIUyotiiAYnCL0ZNHJQBOu1YcwP6Km+1kvxv/i8W1vwtObYJyqFCP2AfRBkoIxlIHvmwqnv/NSjzrf4d2fvXKwscQpWWhUPvA/yCsWzQt3Pq5+TawdwPPIFwjfzZSTKZJok1AE8on2B2x+TE/PGVIj2Cfox7/WRjJxiMlzsJOpilMpfhmnGfTqcS98X9eqfmzdYEEyu8xNgfacenN6AO9ZXKwkPRrSo3NB/uhwNT/CAnb7JBHmJ3VNUjpbt/Hp9MPqh+GVSvQLhYaIrlrK0EY0pPo0zuFikLQvnHLcDTfq6DZLqbd/bndX8vgEEarHV6ErAH5gP9wKpvHt9gFP/Y1+hkZFhvkij22xpAWDd8/dKMt4bZA5BqA6RVEPm4N2j6EoYNaHB3TU/pdmMXG2/8PM+W4qOzFtQfX02xvaAAbebVMZ+PDCsTfogdI1KQX4CAZ/VDtEn/lqYb3J4I+dRgBSvLMGTFZnA8ZVrjbn/u/7+njvuOwTgiBDMYpReR4HXaUKRZKpbROJ9Zmhrxqh8gG/siDjAGDsB77fNBggZnLxxk/YM7zZ08thoqy5Nw7h5lOxhb8Q3PeEEM5QZYMkQpMk0as1tAhy87Zts8T5m0UKWKWiBfNuqy5u+JBK05oaPNd122AMqXyy6EsaaitS8tvjN0W8Jrx7T+C7DMNZabqfULwfzyQiw9nBDucyqT0Qbz9ORCq4PFGlZs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVo3SDZyL0Z2cVRWUnFrOThNQ3dUbmlEdVh4dkdqSEhVazhVVzF6Z1RpRGgz?=
 =?utf-8?B?bW5aRk9oNzVFbnlhc1ZOM1Q4a3VqSzMxengyY1FBTFlCSExKVHVTMFlSUDlP?=
 =?utf-8?B?SjcremVMS1k5a1JLYkg1VGFoa2VVZkxJQjEzNk1aL3hTMVdHTGVNTXZsbGdl?=
 =?utf-8?B?NnpSRmNleUFxeDg1Mmx6Qno2eXVBbXcrOXNoVnNGdCtkUHU5TnFGTkRhSVpZ?=
 =?utf-8?B?TE9uNjZwNU1MUFJTMGp3YWk5WHBCNHJrWEwrV0dFWXlqYm9QYUxBbWFsSWw3?=
 =?utf-8?B?TU83R1pxdkNWUldlS2pJTkgvRkVrSi9kbFptTy94b21XWEw2b05tR3FlMHlH?=
 =?utf-8?B?Zjc1OVR6MTE3SzNtTkJKSno1aDMxdFFkUXpoQWhJYzVBb1VEVWlIaThlQ2Fl?=
 =?utf-8?B?R3Vmam96REFSZ0ZRTk9YQythczc0T2hEeUxjM3k1cE4xNHhWUGtMZDdENTJW?=
 =?utf-8?B?TGVZMU0wQmhhUmtrTTVqdEduT1lqQkdYWHltaHhCQ2Rva3A2OGVhQXEvaThu?=
 =?utf-8?B?ZTJ2TjhUNUFDMk9FdUdVSDRJWm5HV245RHdvcVhQVGlhTGNwdGVTYVhsMlp2?=
 =?utf-8?B?aW5Nd3VVZFlKVVJiRHdPQUJrM1A5ckhIRmdROFY3aldvcE9laDM3VExkVWZ5?=
 =?utf-8?B?cnZiNHhxajFaKzBjUTlRN2h2V0NJaEIwQVhhamFqY0gzTVl3YkNGdXdFalBj?=
 =?utf-8?B?UWNFOWtHOWlKZENNVFp3SVlEbXB2ZWdQTDJHa0VjLzQ0TUlqelpWU0pheGNP?=
 =?utf-8?B?QW42WjgxM3B1K05JODFjUWlRbTdiRzB1ZWQyNjBFVlJ0Q1dCOHRNZTZEUTdK?=
 =?utf-8?B?Vm5VNlE4bjJ3bStTQXJzWkw3anVxSnFubGMxTWpickhUZ3d0MFdGeGRZWUVR?=
 =?utf-8?B?MVRUa0M1TG5VQlRmODFxcjFqeVI0Q3p5ZHlBTDJaVEg0cVN5MFFNVVZlT2VE?=
 =?utf-8?B?NU8yaGhURXMrWlVOaXJQaWdlZ29OVWMrRkZhUlhlcHhwZlk2bmVBLzN4cTVO?=
 =?utf-8?B?cW1vVUxMSDRNVndoZG0zWUN2bU5sdWxhdmkybzZpcEl0K3MyaXU5SU1Za2Jm?=
 =?utf-8?B?WmcyNEw0TjFhZ2NVV1R2TlJDS0FZQkpOMmQ1MUwxOHN6ZzZKWDJGMUhTZm9w?=
 =?utf-8?B?bG00ZlI1c3oxR21CLytKTVQydXJkbjhrK2pQVTFneUdhUm9ienNPZ2tadjFv?=
 =?utf-8?B?Y0lQQVBKM1VtcFdGdTRaTGt3NHFmcVdQZFpQcFFpdE1heHRCaVNsWGFUZlNW?=
 =?utf-8?B?TFlDREIzWTlMUFg5YkRBWUhPTjZhMFI2NE4yNWlIWDRQMUV4Tk5VRHhqTktM?=
 =?utf-8?B?UEdpR3dhMVJLRnpkTk1ZVVNzeUlOMVl6YWZIakt5alN6UlMzaFU4WVhJc1g0?=
 =?utf-8?B?SDNxVElFbXVmZjUvR2RXVE81ZktYT2NOdUk0M0tyYmw5NktmL0VITFQ0Ukkz?=
 =?utf-8?B?UzZHdEQzNld5aEwyUkxVOWRiV251cTZ1T2JVc0JWQ2FlTnU0TjRKdnpDbWNk?=
 =?utf-8?B?L0dGb01HOVJHb2EySmZqYk9EVGh3SDRsZGQzYzViVDlkakQySVRqM3lpVFBx?=
 =?utf-8?B?c1ZrVXNseTNkdE15dDI4OFdtQTZNSk1wY3Qxc295OXA0akN2dmNndnpycHJ4?=
 =?utf-8?B?SjlqU0pZSjExQ1JJNS9HY29pZmJ6VDkwNDk1eXZ6SzdlTmJtTGRHSEpBNW94?=
 =?utf-8?B?eGptSVA2dDBOUVEwS2l4aEJ3ZXBlTVFmOUJnYit5aC9OdlgreTZuUy84OTMz?=
 =?utf-8?B?YXk3NWg3bVpSbndBb2hlcTVNYnkrTEZiZHJlR3R5SHMwSlJNc0hITlVVemNw?=
 =?utf-8?B?MUtOUGRtbFJnODhTR2hwOWVMS1IzZ3BKVGlEdTgxZmdnbytMVk8vNjQ5eUdj?=
 =?utf-8?B?alpQb0hHdXEvTUN4SktrQS9rUzJrWEdRZGkrWVh6RUhDNWlQK1NCeG0zNm1O?=
 =?utf-8?B?MkpBZ3Y1ZlZEVzRkbnpKbXRuZlh4SmxrZjROSHJvRDA2Z1NzQnAyV3lPRUJK?=
 =?utf-8?B?MXZxYnpuTkM3d2lxdWxqaHozWUNYUHVhK2FnWFNsUGJ2QTUrR0Nwdm1VcVRZ?=
 =?utf-8?B?anBXWWNmQXQ5TFZiWi9OTFRKSGpBdmZuakw4K21IdDVpQU8yc2hOQXBGMTlw?=
 =?utf-8?B?d1NXaWpoOFB4S1RMMGRaT0dCQ1Z5ekhzMlNnWVhGRW5XRDlaZTlNM3VnU1Mr?=
 =?utf-8?B?dW5UNVg1SGt4bVQ4WDd5dTRtRWMvMEJ0T3NpL0FlMVFLSHFKNFZyaGh4em9x?=
 =?utf-8?B?czRjUnpSQXdvSWd5TFdoZ3dxTUJsdEJWUmJYRWM4b05PRFM1VlBZRm1Vd1ds?=
 =?utf-8?B?YnRJTUtJVUZURXYwMWl1VFg1NjFCdFl3NjRjeEMrVllMdEd4QmFNdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: eZWywDKhrKQdXX7dbteoZJ9qvs6NFSzWMEXdi9RDwUKC7n9Sf0fGuDTk9+8Xxv7CsMVudr8VQMsDY4+fYYxtTvqE0rIYgU07ybnrlRNjblWQNOqYudA58BGO6mR5aDPJQjTOorwAjeEAHr15AGRfk88+2zESTIwZb+47kRic15fc4uVX6SmyqVEuD3KVj4W/p465qnAV5AClp4V15UxBdMQ12WD6iZT+YJ0Qx7HOMFSotRcyLbJj91zAi+v3e1Btag7UpY/uHCB7KLvFqy2z0ytOdMiOeUK2fKqYKViuhptaPaV96Y5RCcg2sMfdPAS62Yk8uW5Xm6V3ddn9c65kMQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b1ff04-4832-4d30-0896-08dea47b90c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2026 16:39:34.9683 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mboMg2UYrEkL7LoyhPGXtLN2ThTgGHUwnpwlB3aHIVCW00jBthAVzxWn3PsKgkaj/x2XYcDd62j7AVQbeEeF2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8217
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

T24gRnJpLCBBcHIgMjQsIDIwMjYgMTo0OCBQTSBNYXR0IFJvcGVyIHdyb3RlOg0KPiBYZTEgcGxh
dGZvcm1zIHVzZWQgdGhlIEJMSVRfQ0NUTCByZWdpc3RlciB0byBzcGVjaWZ5IHRoZSBNT0NTIHZh
bHVlIHRoYXQNCj4gd291bGQgYmUgdXNlZCBmb3IgQkNTIGVuZ2luZSBpbnN0cnVjdGlvbnMgdGhh
dCBkaWQgbm90IGhhdmUgYSB3YXkgb2YNCj4gc3BlY2lmeWluZyBhIE1PQ1MgaW5kZXggZGlyZWN0
bHkuICBGcm9tIFhlMiBvbndhcmQsIGFsbCBCQ1MgaW5zdHJ1Y3Rpb25zIG5vdw0KPiBoYXZlIGV4
cGxpY2l0IGluc3RydWN0aW9uIGZpZWxkcyBmb3Igc3BlY2lmeWluZyBhIE1PQ1MgaW5kZXggYW5k
IHRoZSBCTElUX0NDVEwNCj4gcmVnaXN0ZXIgaXMgbm93IGEgZHVtbXkgcmVnaXN0ZXIgd2l0aCBu
byB2YWxpZCBmaWVsZHMuDQo+IEFsdGhvdWdoIGNvbnRpbnVpbmcgdG8gd3JpdGUgdG8gaXQgdG9k
YXkgaGFzIG5vIGVmZmVjdCwgdGhlIHJlZ2lzdGVyIGNvdWxkDQo+IHJlcHVycG9zZWQgaW4gZnV0
dXJlIHBsYXRmb3Jtcywgc28gcmVzdHJpY3QgdGhlIEJMSVRfQ0NUTCBSVFAgZW50cnkgdG8gb25s
eQ0KPiBhcHBseSB0byBYZTEgcGxhdGZvcm1zLg0KPiANCj4gQnNwZWM6IDYwMjgwDQo+IFNpZ25l
ZC1vZmYtYnk6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQoNCkxHVE0u
DQpSZXZpZXdlZC1ieTogU2h1aWNoZW5nIExpbiA8c2h1aWNoZW5nLmxpbkBpbnRlbC5jb20+DQoN
Cj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMgfCAyICstDQo+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4gYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4gaW5kZXggYzdkMjExMTc4MzAwLi4wNDE5Y2QwNDUw
OTAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4gQEAgLTM4NCw3ICszODQs
NyBAQCB4ZV9od19lbmdpbmVfc2V0dXBfZGVmYXVsdF9scmNfc3RhdGUoc3RydWN0DQo+IHhlX2h3
X2VuZ2luZSAqaHdlKQ0KPiAgCQkgKiBCTElUX0NDVEwgcmVnaXN0ZXJzIGFyZSBuZWVkZWQgdG8g
YmUgcHJvZ3JhbW1lZCB0byB1bi0NCj4gY2FjaGVkLg0KPiAgCQkgKi8NCj4gIAkJeyBYRV9SVFBf
TkFNRSgiQkxJVF9DQ1RMX2RlZmF1bHRfTU9DUyIpLA0KPiAtCQkgIFhFX1JUUF9SVUxFUyhHUkFQ
SElDU19WRVJTSU9OX1JBTkdFKDEyMDAsDQo+IFhFX1JUUF9FTkRfVkVSU0lPTl9VTkRFRklORUQp
LA0KPiArCQkgIFhFX1JUUF9SVUxFUyhHUkFQSElDU19WRVJTSU9OX1JBTkdFKDEyMDAsIDEyNzQp
LA0KPiAgCQkJICAgICAgIEVOR0lORV9DTEFTUyhDT1BZKSksDQo+ICAJCSAgWEVfUlRQX0FDVElP
TlMoRklFTERfU0VUKEJMSVRfQ0NUTCgwKSwNCj4gIAkJCQkgQkxJVF9DQ1RMX0RTVF9NT0NTX01B
U0sgfA0KPiANCj4gLS0NCj4gMi41My4wDQoNCg==
