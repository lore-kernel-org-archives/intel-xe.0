Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD06CEFC38
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 17:37:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2389910E1BA;
	Tue,  8 Oct 2024 17:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kHZpLzln";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE2510E1BA
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 17:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728409063; x=1759945063;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Og/4WTr9txyq6cnLUfvbt32/H/zA1MG/O95tlLjvdvE=;
 b=kHZpLzln79TKeZVI/5ECXlpsRpGOff8ueFX/HOgUtUyQB6OORuwoy5Q/
 moFW96TJh7mddHHrg/pZhJB4N47dlEZCHo84y2rp9rGXBT4C6+uB11+IW
 FvSMw/GVeL6o+2c0nJ7V+OB9FILJqIf/GjUnwCuQBglHEHzYgQo/excqZ
 T7/zym9QL5/i2oCggxUyJ9QDVW2lWjCWA0OHi0KUYYBeyQhvbHjovAwzL
 PVTEeUFI/MKTnh5yV+okai+2AKrrWpD79RCHUqt2D89VTV9wO5rRwwYqP
 iLfHzJ9GDazq3Rfss3Cx8ewRwLVuyAKQy88+5XeeMHCDUNOOQdbt28Eon Q==;
X-CSE-ConnectionGUID: 8C2bvI8HTWebwzDWsrcnZg==
X-CSE-MsgGUID: 3TOAbyodSZG28/gDzTw6WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="50167216"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="50167216"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 10:37:43 -0700
X-CSE-ConnectionGUID: cA4WxKLARi6WuDKhur3EIw==
X-CSE-MsgGUID: 0z4rfhkcRIW3vvXWpXDlCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="113394380"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 10:37:43 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 10:37:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 10:37:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 10:37:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 10:37:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gBeUztTY5U30gQIaUgK/DUoqHHLcyJjHfzqTHahkSwQE7Ecik2SEI0zSFQYmKiBuGywqCV4DlXOPdzBL+SZuTAn3NDPRRSm9R7F77IylsV5HgLysyo6WjJ5dbncl9LpiQDOq9KCdAiB44hcbaxRV7YeTz9XyudjgKqrIslXispjEvnT/aEAbRLbbhRdbL5vbfWurzLsHO+NpMl6dBS5NZVOCqDv1ZMJzHrKTa+VsUehPCzRHlvZ3zg+jKzc0h+9w80e6jtWBFLmcAkZG4EN2HZISvH45HfXa9zgkEc5T9bay2cOFxuPksq/1aUHnr/OKDvWUNtlar01jxWaKqBPKIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Og/4WTr9txyq6cnLUfvbt32/H/zA1MG/O95tlLjvdvE=;
 b=gNe5BvndPliakChPEEPiGGLusnIiqHfWXZQI+4Idw6ucf/bqX9GXL/P5z0Z17fScZAp97mzlOpPMroI/kIj/kjm3ppEd9RHCLLVA3/OyWS5O00oVjzwkVZ1fquWK8DhhRYcYxy68y1HSi1Y2PwGTA5vS0K3b+X2rCxWX6g1knRkc069nE2CgwepJIhphjHQDstbvRyvjED3f8ojrBZPEvcPPfh2JscyXX3ZuJsLdyaT31WwqM23qXh+PVRiyypDWz+6V4jORVb83bkrxzqp1Q5/ydhmbfzwvMcGiBR1thdl/OnFY8NSW0Zs/jQhm9cUPeQfWSDmrd1Mrg4Isih2pKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) by
 MN2PR11MB4648.namprd11.prod.outlook.com (2603:10b6:208:26f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 17:37:39 +0000
Received: from DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::eaaf:292e:8706:bdfe]) by DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::eaaf:292e:8706:bdfe%5]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 17:37:39 +0000
From: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Poosa, Karthik"
 <karthik.poosa@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nilawar, Badal" <badal.nilawar@intel.com>, "Zhang, Rui"
 <rui.zhang@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Saarinen, Jani" <jani.saarinen@intel.com>
Subject: Re: [PATCH] [core-for-CI PATCH] x86/apic: Stop the TSC Deadline timer
 during lapic timer shutdown
Thread-Topic: [PATCH] [core-for-CI PATCH] x86/apic: Stop the TSC Deadline
 timer during lapic timer shutdown
Thread-Index: AQHbGL420yFs9sHLxU2okWvPZWs5LrJ9HxcAgAAA9QA=
Date: Tue, 8 Oct 2024 17:37:39 +0000
Message-ID: <db359db0916475865e2c2a615a7dfb92eeb65c6b.camel@intel.com>
References: <20241007135242.3028131-1-karthik.poosa@intel.com>
 <ZwVtFJzWMUrTwg5C@intel.com>
In-Reply-To: <ZwVtFJzWMUrTwg5C@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.4 (3.52.4-1.fc40) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5592:EE_|MN2PR11MB4648:EE_
x-ms-office365-filtering-correlation-id: aafda51a-21da-46d0-062b-08dce7bfe7d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OEZWM2VlQ2JwY3Z2MHRiY3Y0M2l3WXlXekJVUFRYUks0UVRTWVVqdS81SHBh?=
 =?utf-8?B?T1UySVRNek5ubyttcU95UlRLU2dWcTJoK2x3UXVwcUFLUUdxR1dYQ3BoYXpP?=
 =?utf-8?B?eFVyWnMxUWJJU1pubEFzajRKaFJXNHZ0U2tIU2Y3SHhRZ0FUR1daU040d1RV?=
 =?utf-8?B?ZTdrOExLWTRRSWk5QVhUb2xKRmtYemJ1Y0xCRE96UUtONE9EcHZndmhSSTl5?=
 =?utf-8?B?dDlSZmZJSllDTWJZV0dvZjVHNTVvNkdOTDhsQmhZbU1oQ1ljTmw4WENYQTIw?=
 =?utf-8?B?aDRyV0cwRUtKcHYzclNRaEpTZ0ZXMDV2eU1RTGZNbU1uQkIxbVJUbjBvWXRp?=
 =?utf-8?B?QWNWNisvazNiWnZKQXJiQ3duY3VvYmk3b3lERE1nYVEvVFhvZXpkTzNJNjBy?=
 =?utf-8?B?bHFoRkxlazFPNU9BY1lDRmZJR3RsQmxuRmF4dDdBNUwwcFlRVWFqRjhjZ2Va?=
 =?utf-8?B?Z1FwbGJVV2R4RXVUVWtXSGVCZXB5YkhnV0U1ZkdaVVFzYWxKTFhVVStFWGxt?=
 =?utf-8?B?QnJlSzY4azgzN2JKUEw5bzRwZlJxWEJXY2RSS0daN0UvK1dIQzVEWkpsc25S?=
 =?utf-8?B?MFdlTG83VmM1Qmdma0psblRGTUw1TW94SnJOeTFoTDZBTjFVZXdOQ2JwRVJx?=
 =?utf-8?B?YlFhaGVEUGs1SkpoTmN5YUo4RmZBYkg0TzM1VUxFbml5U1N5ZmFKOVVBc0py?=
 =?utf-8?B?N0dWUkY2TXBtTllheTBCTFhKRTZzNTBJRkVRdzkraUtEY2pFRlkzZHEvT3hC?=
 =?utf-8?B?aWdzeXdseFVxKzlsNDE3ai9nZXV6NW1yU0JGR0pvb0ExZERHZVBTbUhMemtk?=
 =?utf-8?B?Q2lZZTAybHY4RVVIcVBXcGJzRjRhdzBabnE0M2RWNDBSekE0TE01VVlwODNG?=
 =?utf-8?B?MjN2REhQRDVmSTFNbGI5TFhQMEVidVZielRRRHlyMnBCOFJjdkw5MUJsZjhq?=
 =?utf-8?B?RHZVb1AvTm9CSFpYdmIwb0J5UXhSNDJwaXhhOHNDNjBrVDdRTGdheWhQWXZa?=
 =?utf-8?B?QVIwZmt4RjBXZWlteE1qUWlEV2dmdzBjb3VUVDZSOTE1eFN3aWxYUVBhTFY4?=
 =?utf-8?B?QVdzL29DazdoWTNnQXM0ekxpZHREaCtYdnBTQTluMHlxS0ZQZFF2bEFFWnAz?=
 =?utf-8?B?YlhJaE12M2JIa2tpdmR6OVV4dEREN3JmblQrQkQyZkJoSDd2VmcwRjh6TEpP?=
 =?utf-8?B?UTMzNzBXRE1MYU5wcVZIUjlFa2VxSVlpOVhNZ1pGaFVrZUdTbElORHVwdk5Z?=
 =?utf-8?B?TnE4WHZsNFZDZXIrUy95TzBRaG1SVzFKZmQ5TkFxSWFlTjNmM2ZjdW5JeTJ3?=
 =?utf-8?B?cTU4SWcxZ00vUFQxTXQyVzFFK0xtbTFBaU5uT2dSdDYyc1ZPNEo2VzdmcFVL?=
 =?utf-8?B?WlJQWFdkWFE5TkJhSEx4K1N0YzF0Q3p3WFRmME10NWJFMHRhMUtRR3VsRHlu?=
 =?utf-8?B?Q3RuR3J5RGxubVNhVmxlRHRFV2JhK2pzZS9oQXowaEY2S3VxWnZYU01XMUl1?=
 =?utf-8?B?NHNuNFBJSlE5QTdra1JlNnRtZ2RoK0sxcEhNdzBvOWUzaXA1akE0Y1QzaHk4?=
 =?utf-8?B?ZFhrbHVDZElVL01KWDEvekdscWFLZWFpTFJUSm1YZXByV0p4dlAwTmZ0eDB2?=
 =?utf-8?B?YVovcWlhMFhMVVRVZGQ3RmViVTJlOXc4UFJ2WnNtNTVha0YyMlN2Q1NQNlp3?=
 =?utf-8?B?VXovaHlyNlMxblJvaWc5OEpiamJlVllReUI1a01mWUVVdjRHWjhReGNmcDF6?=
 =?utf-8?Q?RWTfTWcVjpHy7DdJsU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5592.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a21JQVZrcGdDUENmRjk2N1F4cHBIaU9YTnM5bWg5RVlJL21jOWJQc2pHYktt?=
 =?utf-8?B?Z1o2MjMrTjY4THpUTnc3OU5TMGNUVFhSNFVMbnBzUzJPUzBzb2xpdGJmam9I?=
 =?utf-8?B?T2xwUDVkaEwzQWZkZDh6bjJwQkpLbE5VcW5rZG5tcTdiM0dkaENHOGNDeEdr?=
 =?utf-8?B?R2pzU2FaUUw1YUdZUEUvNE1DSnM1Y0FKUStQaDgxU2h2cTJ1WjdNSlF6azNE?=
 =?utf-8?B?WjkvUG0rMnhNTjhnMDNZUmdVcXRzUVRDMmlTQmQyVnRVMFRESjg5WTdBdVM4?=
 =?utf-8?B?OWp6K0lXTWlFQVlFSmVvakpTQ3g5eUYydWt2c2M2RXNCMy9mdFY2NjlmbXNW?=
 =?utf-8?B?aW4yZjhHeUo2T3FReHRoUlZvZ2VJbGptZWZQSDFVUDV4dzRMcEpISnZYbmhQ?=
 =?utf-8?B?ZFNoS0ZvQjQ0SGR0bHEyWXE2aUlvTmE1bVNGamROY28wZHFmV3NkQlhZdlo5?=
 =?utf-8?B?VXRXMUJnK1dHRkllOVdXTWw4MGM0NUs4WWN4eGtBYWJ1Zk40ZDdDMFhycjBv?=
 =?utf-8?B?c0NtNnpzNGtUVUEyTklaK2ZibEVGZlB4bHpKRzlvWTE4NWhjTzZiL1ZRR3oz?=
 =?utf-8?B?OEJINzR1dEVGSG5GR245elJsdmIrRDViRytnZlNxTldRck5aN3VPN2R2RTc3?=
 =?utf-8?B?emhycy93aUthVi9OMUpyc2FHQ085UnMxWXRZMkk1clZWa0g1c2tYaUlTd0h4?=
 =?utf-8?B?TTlxcnlNcGpYRk9rNmVIT2JHVlp4UWFBbmNsWjVpRHVNVlhQNzFMaVNNUGs0?=
 =?utf-8?B?cUNOZGxnNE9DL2FYMTZHL3d5ZjlvQzhDby9sc3VzWlNMdE44YzhRazZGaXkv?=
 =?utf-8?B?ZzZud1l5YVFuV0VaN0oxcFFGVmVYVlR4OHoxZVpyNW0rNmdOMXBXMHlNTnJu?=
 =?utf-8?B?djN1aGZMbS92VjQxWVFMU2p5a0c2MEpFSDNFdlNFbEdRQ0w4ZVRUY3ZvUFlj?=
 =?utf-8?B?N29Nbms5RnB6MDQ0bzBJNXpQUTJVd1lJUlZPS1hsRDNkSDhzSjd0MS9LTEo1?=
 =?utf-8?B?U2FidmtEK1ViZDJSYTFQMTMwRW5UTTBIMWs2Q3hKa216Y2FhT2tLSFR5K29v?=
 =?utf-8?B?aDdsT2tObmFVVDcySW5SUkJBemlxazVla1ZHb2swL2FyTGRDR2M1TXArZzdj?=
 =?utf-8?B?dDFjcGZmSkowWHhKUWZUK21mMnFhdmdTdjcrcnZGSHlqNWNxQ1plTEl0Vjl2?=
 =?utf-8?B?MnhCUnVEcnBmUWM1RzdrbjVsYmQ2WXZaYzFmNE1XTjgyTGxYS0pxMFV1VXk2?=
 =?utf-8?B?STZpcUcrbTRVMTBuSktjdUJoY0tqR1dLU2xRRXpRby9BRHFFTHBnNmpjTG5y?=
 =?utf-8?B?UURQNkd6QzdFaFIrRUhxS2d5dE56ZHJIZXNQTlVpTVVtSFp5dFdhNGVRdVla?=
 =?utf-8?B?R2Y0b3lqMnhaK0dCVDVic3N2MERqbHBnTWZJK0VkOXVNaFJhdFhEdVRLYWlv?=
 =?utf-8?B?WnRhRitGQkVwWVdYRFdwcTFxTEd5dXM0YnJ4LytXLzNsZGxCSm5rTEltUjlQ?=
 =?utf-8?B?ckVHUkF5RjN4UmM5bXFSa0xSMkhBaEVWZXNQajBlYUZnLys2OThtZ1BvSHZD?=
 =?utf-8?B?MlhnVGhCc1R5aXpTcVlMTVdxOTMvNjNRN0xpdC94OTFLK0RpYk5Ccm9CRkk5?=
 =?utf-8?B?UGRybDdqVmNiSzVZMnREcFJheDFhWURWTVhoTEp0T1pFanJ0R3B2R1ArUTVk?=
 =?utf-8?B?MGdpY3R6ckpNNWNPVUkxeWVZK0dvaS9yeWN2eHpBZEV5d3dKV2RLcmo0U2Iz?=
 =?utf-8?B?cXdRdWMxU1lhOWVTNVFjVzMrZEdvb25YV29JZWpKU1FTSEdHSU40cFNucFhK?=
 =?utf-8?B?M2FMRG8rTzlqQ2tmMTd5b0FhSVA5S3BzK0NwcWYyYkd3dXQ0U2QrU1lFVDZs?=
 =?utf-8?B?bXpDcDc5TUhwMUR1QXdkQkpnUnVXTkRvdXlnU3VnNDRYc0ZnTzlGQlBqVElV?=
 =?utf-8?B?a0s0VzBpZUFhOC9QRnp6VnFQY293TFJJMG9ENUtWYXZzNTVqNTBuR3lldktK?=
 =?utf-8?B?elE2cjdQTmFXeFY4Mzk5ZGRhdS9SZlVWRUl3Q0VyY2ZCZVNHdHhhai9GekY5?=
 =?utf-8?B?aWZXamRYWjhzM3VSanVyYWk2akxIQ2xzeGFpM1lJNm5WL2FkWTJ5RVIyeUpH?=
 =?utf-8?B?LzlOcDVBL2VEQk9DTGs3bThieVhTRis0cmNkaTg2NGN2dVVrMHpTb1VzWThR?=
 =?utf-8?Q?CRhoNr2faKWTHiUQnmLZrcM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <881E4DA6D761CE4FBCF84852A492BDA8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aafda51a-21da-46d0-062b-08dce7bfe7d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 17:37:39.3771 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mktzi+DDPCswjn4eKibGVJgq6YaF2yjG52pTDXhyBwIXUn8ryOACepue0u05UPtxQxmbtypr3Nt5BTkO+/Kvdnpu4JBrSszayhuRfBBJ9M4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4648
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

T24gVHVlLCAyMDI0LTEwLTA4IGF0IDEzOjM0IC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIE1vbiwgT2N0IDA3LCAyMDI0IGF0IDA3OjIyOjQyUE0gKzA1MzAsIEthcnRoaWsgUG9vc2Eg
d3JvdGU6DQo+ID4gRnJvbTogWmhhbmcgUnVpIDxydWkuemhhbmdAaW50ZWwuY29tPg0KPiA+IA0K
PiA+IFRoaXMgaXMgYSBjb3JlLWZvci1DSSBwYXRjaCBmb3INCj4gPiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvMjAyNDA5MjkwNjM1MjEuMTcyODQtMS1ydWkuemhhbmdAaW50ZWwuY29tLw0K
PiA+IA0KPiA+IEFjY29yZGluZyB0byBJbnRlbCBTRE0sIGZvciB0aGUgbG9jYWwgQVBJQyB0aW1l
ciwNCj4gPiAxLiAiVGhlIGluaXRpYWwtY291bnQgcmVnaXN0ZXIgaXMgYSByZWFkLXdyaXRlIHJl
Z2lzdGVyLiBBIHdyaXRlIG9mDQo+ID4gMCB0bw0KPiA+IMKgwqAgdGhlIGluaXRpYWwtY291bnQg
cmVnaXN0ZXIgZWZmZWN0aXZlbHkgc3RvcHMgdGhlIGxvY2FsIEFQSUMNCj4gPiB0aW1lciwgaW4N
Cj4gPiDCoMKgIGJvdGggb25lLXNob3QgYW5kIHBlcmlvZGljIG1vZGUuIg0KPiA+IDIuICJJbiBU
U0MgZGVhZGxpbmUgbW9kZSwgd3JpdGVzIHRvIHRoZSBpbml0aWFsLWNvdW50IHJlZ2lzdGVyIGFy
ZQ0KPiA+IMKgwqAgaWdub3JlZDsgYW5kIGN1cnJlbnQtY291bnQgcmVnaXN0ZXIgYWx3YXlzIHJl
YWRzIDAuIEluc3RlYWQsDQo+ID4gdGltZXINCj4gPiDCoMKgIGJlaGF2aW9yIGlzIGNvbnRyb2xs
ZWQgdXNpbmcgdGhlIElBMzJfVFNDX0RFQURMSU5FIE1TUi4iDQo+ID4gwqDCoCAiSW4gVFNDLWRl
YWRsaW5lIG1vZGUsIHdyaXRpbmcgMCB0byB0aGUgSUEzMl9UU0NfREVBRExJTkUgTVNSDQo+ID4g
ZGlzYXJtcw0KPiA+IMKgwqAgdGhlIGxvY2FsLUFQSUMgdGltZXIuIg0KPiA+IA0KPiA+IEN1cnJl
bnQgY29kZSBpbiBsYXBpY190aW1lcl9zaHV0ZG93bigpIHdyaXRlcyAwIHRvIHRoZSBpbml0aWFs
LQ0KPiA+IGNvdW50DQo+ID4gcmVnaXN0ZXIuIFRoaXMgc3RvcHMgdGhlIGxvY2FsIEFQSUMgdGlt
ZXIgZm9yIG9uZS1zaG90IGFuZCBwZXJpb2RpYw0KPiA+IG1vZGUNCj4gPiBvbmx5LiBJbiBUU0Mg
ZGVhZGxpbmUgbW9kZSwgdGhlIHRpbWVyIGlzIG5vdCBwcm9wZXJseSBzdG9wcGVkLg0KPiA+IA0K
PiA+IFNvbWUgQ1BVcyBhcmUgYWZmZWN0ZWQgYnkgdGhpcyBhbmQgdGhleSBhcmUgd29rZSB1cCBi
eSB0aGUgYXJtZWQNCj4gPiB0aW1lcg0KPiA+IGluIHMyaWRsZSBpbiBUU0MgZGVhZGxpbmUgbW9k
ZS4NCj4gPiANCj4gPiBTdG9wIHRoZSBUU0MgZGVhZGxpbmUgdGltZXIgaW4gbGFwaWNfdGltZXJf
c2h1dGRvd24oKSBieSB3cml0aW5nIDANCj4gPiB0bw0KPiA+IE1TUl9JQTMyX1RTQ19ERUFETElO
RS4NCj4gPiANCj4gPiBGaXhlczogMjc5ZjE0NjE0MzJjICgieDg2OiBhcGljOiBVc2UgdHNjIGRl
YWRsaW5lIGZvciBvbmVzaG90IHdoZW4NCj4gPiBhdmFpbGFibGUiKQ0KPiA+IExpbms6DQo+ID4g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwOTI5MDYzNTIxLjE3Mjg0LTEtcnVpLnpo
YW5nQGludGVsLmNvbS8NCj4gDQo+IFRoZSBwcm9ibGVtIEkgc2VlIGhlcmUgaXMgdGhhdCB0aGlz
IHNlZW1zIHN0YWxsZWQuIE5vIHJldmlldyB0aGVyZS4NCj4gSXMgdGhhdCBtZXJnZWQNCj4gaW4g
c29tZSBicmFuY2ggYW5kIG1vdmluZyB1cHN0cmVhbSBhbmQgdG8gc3RhYmxlPw0KTm90IHlldC4g
YXJjaC94ODYgcGF0Y2hlcyBhcmUgdmVyeSBzbG93IHRvIGdldCBtZXJnZWQuDQpXZSBjYW4ndCBw
aW5nIHVubGVzcyBubyByZXNwb25zZSBmb3IgMiB3ZWVrcy4NCg0KVGhhbmtzLA0KU3Jpbml2YXMN
Cg0KPiANCj4gQ2M6IFpoYW5nIFJ1aSA8cnVpLnpoYW5nQGludGVsLmNvbT4NCj4gDQo+ID4gUmVm
ZXJlbmNlczoNCj4gPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2k5MTUva2Vy
bmVsLy0vaXNzdWVzLzEyMzQ0DQo+IA0KPiBUaGUgcmlnaHQgcmVmZXJlbmNlIGxpbmsgd2Ugc2hv
dWxkIGhhdmUgaW4gdGhpcyB0b3BpYy9jb3JlLWZvci1DSQ0KPiBwYXRjaA0KPiBpczogaHR0cHM6
Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS94ZS9rZXJuZWwvLS9pc3N1ZXMvMjc2Ng0KPiBz
aG93aW5nIHRoZSB3aHkgd2UgbmVlZCB0aGUgcGF0Y2guDQo+IA0KPiBodHRwczovL2RybS5wYWdl
cy5mcmVlZGVza3RvcC5vcmcvbWFpbnRhaW5lci10b29scy9jb21taXR0ZXIvY29yZS1mb3ItQ0ku
aHRtbA0KPiANCj4gQnV0IHdhcyB0aGlzIHJlYWxseSBjb25maXJtZWQ/DQo+IA0KPiBBbnl3YXks
IEknbSBoZXNpdGFudCBoZXJlIG1vc3RseSBiZWNhdXNlIEkgZG9uJ3QgYmVsaWV2ZSB3ZSBzaG91
bGQNCj4gYWRkIHRoaXMgcGF0Y2gNCj4gaWYgdGhhdCBpcyBub3QgZ2V0dGluZyBwcm9wYWdhdGVk
IHRvIExpbnVzIGFuZC9vciBzdGFibGUgdHJlZXMuDQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFpo
YW5nIFJ1aSA8cnVpLnpoYW5nQGludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBLYXJ0aGlr
IFBvb3NhIDxrYXJ0aGlrLnBvb3NhQGludGVsLmNvbT4NCj4gPiANCj4gPiAtLS0NCj4gPiDCoGFy
Y2gveDg2L2tlcm5lbC9hcGljL2FwaWMuYyB8IDQgKysrKw0KPiA+IMKgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwv
YXBpYy9hcGljLmMNCj4gPiBiL2FyY2gveDg2L2tlcm5lbC9hcGljL2FwaWMuYw0KPiA+IGluZGV4
IDY1MTNjNTNjOTQ1OS4uZDEwMDY1MzE3MjlhIDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gveDg2L2tl
cm5lbC9hcGljL2FwaWMuYw0KPiA+ICsrKyBiL2FyY2gveDg2L2tlcm5lbC9hcGljL2FwaWMuYw0K
PiA+IEBAIC00NDEsNiArNDQxLDEwIEBAIHN0YXRpYyBpbnQgbGFwaWNfdGltZXJfc2h1dGRvd24o
c3RydWN0DQo+ID4gY2xvY2tfZXZlbnRfZGV2aWNlICpldnQpDQo+ID4gwqAJdiB8PSAoQVBJQ19M
VlRfTUFTS0VEIHwgTE9DQUxfVElNRVJfVkVDVE9SKTsNCj4gPiDCoAlhcGljX3dyaXRlKEFQSUNf
TFZUVCwgdik7DQo+ID4gwqAJYXBpY193cml0ZShBUElDX1RNSUNULCAwKTsNCj4gPiArDQo+ID4g
KwlpZiAoYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX1RTQ19ERUFETElORV9USU1FUikpDQo+ID4g
KwkJd3Jtc3JsKE1TUl9JQTMyX1RTQ19ERUFETElORSwgMCk7DQo+ID4gKw0KPiA+IMKgCXJldHVy
biAwOw0KPiA+IMKgfQ0KPiA+IMKgDQo+ID4gLS0gDQo+ID4gMi4yNS4xDQo+ID4gDQoNCg==
