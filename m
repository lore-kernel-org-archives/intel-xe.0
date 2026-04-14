Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7082F9D0D8
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 21:24:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F4C10E0B4;
	Tue, 14 Apr 2026 21:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k33sHNxV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1F410E0A8
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 21:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776201890; x=1807737890;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=vrpld85E+a0kijhTXhjsegR56FHdWbTDFXsHUeq4qaU=;
 b=k33sHNxVgq+kgbrRMOwElzvR4II1yCP9z7FidezXnDZTFhQ4l/QUtafO
 koekv8ztQIza0eiJFd4uy+bhvbZmattiamrgOWCym9N6MXJokKcf+2tfE
 uQDyMDdyqkjGBU0FGWCwv2nejf7y2qsxWMvd+QU2BSXhoU2L17T6KNxmb
 MmbNAP4tOtxJMS+pI0wpva9USG5gxHQKKZA9LMpoiY6r6NHXg7WE24Kke
 QVWy7pYnUR3YQnLsHSlKRXH1bY114Xa9EZAC7vpF0yQhEOgN8+rHn3GWL
 v2PX9ubaUcaHpDFCSqdKd/8CZh+C+GlxdVdWyX2w/vj7tQ430u0TADBxK g==;
X-CSE-ConnectionGUID: yIgK8k+BR0qRIVPc/FthQg==
X-CSE-MsgGUID: VLrmMMQyTEuC1CVRSZ/kJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="76204543"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="76204543"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 14:24:50 -0700
X-CSE-ConnectionGUID: KeglR/eATKGRs5CUhntkEw==
X-CSE-MsgGUID: 16qYEaObTsu98wJgz8KPEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="231965003"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 14:24:49 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 14:24:49 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 14 Apr 2026 14:24:49 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.69) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 14:24:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0ikxXykwBK7XFdEaNYMKyfZG61a5W78HSPd1iBZZUG4yUBywWYg4dOUvd4OG0Wgj/g2W2XdqxcJMNCjSL3Y3WYry3msYK+hXbZAymorM+HPKFcFwabLuDkhJCh6CqNbfxKOCLNhsv7yEmBDwxLCRG4z5CNIsQn8lN1/bncxgzpN9ZblBvST3rgMA7ba40Frdt897SQbyIxwOxFeouG2WVLsdZCcppzVyJDVaj9cX+csFF2/CbSoeJgj77Ieyq7JaDxQzQesrXwG2ZVS9pgAW6C/GHifbm1+7XhGXhFgmokgjxZUg1c/OW7x6ild6oeRQLyzVsUY12m19yuezT+5iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vrpld85E+a0kijhTXhjsegR56FHdWbTDFXsHUeq4qaU=;
 b=KCmUDNmp/KBBJXljjcl52NZv7IgQ+o+0yqzm6dOLJ6C1BYY3gPPRFAdN7/ePMtcxr4uv4HlOx9UhyK/JvF0WNRDVtGbiwpO6iFs9xkOA86J3aCpIuwSk/xylrn2WaH+8tTRl/VdLdAQumUKH7IcGy7TPw+GdUeTOiDTEkkyRjAlbmcFRC+SdEJamsy1HFyPKsUDhge4JBGaW2MLvbzh61tTsGIgy/Kc1Q5LUldwcGR9Vh61uORiQfzApuzM26mTil31OxEx98wx+y5GRk0/3N9Bzq/nlrWS8ShiAMcvuYGHGwyoHtt0tleGc4kc2sE+sht4/6LYMPHPrVpXBmouaLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CY8PR11MB7686.namprd11.prod.outlook.com (2603:10b6:930:70::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.48; Tue, 14 Apr 2026 21:24:47 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%5]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 21:24:47 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>, "Yadav, Arvind" <arvind.yadav@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC 11/15] drm/xe: Add xe_guc_access_counter layer
Thread-Topic: [RFC 11/15] drm/xe: Add xe_guc_access_counter layer
Thread-Index: AQHctqZXuwm+hmdVG0iq0DeiWyLPWrXfPO2A
Date: Tue, 14 Apr 2026 21:24:47 +0000
Message-ID: <e8ac4c453abcb1d76cfbfee258a2c0b6d509204e.camel@intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
 <20260318074456.2839499-12-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260318074456.2839499-12-himal.prasad.ghimiray@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CY8PR11MB7686:EE_
x-ms-office365-filtering-correlation-id: 492d242e-9a56-4ddf-e927-08de9a6c413a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: hX+bk/k7k/GJTkoLQZAWNziRGKIYOW8E655CmS1oXYBzeRBjeNr4aVAODz8DOVphnX6lYgY4p6siNDZT+yyAwwcWbx2vpcV8qFSNG+3y/k9bK4BeRYUi/0qeRKHhF9fbGR+4sWnZ6ubdlFyGebbTSHQF/eJYSQAKVKrOq7t1T3ckHbV2Niand/rtdTrbXVuTLhlG3F4dXBr8T6bZPyNVXcD8avBqaXhPtcvTqbcQwgNi7iITA0olCOrOHjTpz1QpsI2cWjdAHCgKtEaEZoMVmXkV29z/ol91sLnm/7WU2nhjb3+d7EMntwpSAoBcly7ioOx1hapgZMr66KGyfiMPv4yz27cdSflmrnZ+O11n86yhHDg4zk6Q3++njFlmHnG5vlbi+c7UskPJ7BwXfeHZ76bhvMMepV5hapYSDxBVgzJ6o6J/x8J9WNzrRosrmQqZ7JcBDR2PrkRhf1YKGvtG9yK+lUdCsty4Va4AqOqpJ0+oWkrELvAcNvHLEklRv3xyJ6ElaRABHlzLWNuawUDFIWgYYc53lqI+J7szW/VH+2Ion8uggElMQtzdT2TGylHQlG9mCIK83guFElzBSBNGpcIPWxdazJykmA8h0I/fmjI+M8M9j9KjFtYYDasuD4d9FLJsaPeqrcaJjGpR6xCHRHmd2QfoUJcoT42nrFLK8V2Id5vWbKGYf4zvxHtoT0JWyA0fCuvFggaaL5T5NGnQ7Wv56/6N3U0C8jMkG7unYBp7NvF5+sstFrYtj9rDSX8/EevkQz3BwHzSK7jmJjjmM2LmZAmzgKBlKfh1KZR3oKc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z1diUS9qSHVJc3R0L29kZ2JwRTRwejVZRWpjOTR2akprZExaRWhCRGVRbmJR?=
 =?utf-8?B?SDU0UWwxWlpWMnRLOCt2MGVxSFNDN3hlQXByTjMyUHRqQlNkZm9FbTVWME5D?=
 =?utf-8?B?d1NZK1F1bG11dUlEc1ZzbitLdW4rY282aUFaWCtGUTlNZ1Q5U3ZqZ1ZRVjZN?=
 =?utf-8?B?TFBqU1JlT21xT0hrMjFPM204UUs1dEcwSDFYalNFaW8xZTljOTBvUWNxbE1M?=
 =?utf-8?B?eGlPS2h3UURuS3VRQzdkdnZhenkvL1lpbXJwKzNHT3liT1RUSGFLSUQxSGF4?=
 =?utf-8?B?MEZGSm5oekpoYnlTbjFMK0NhTk04WWt4VW81S3VjUnNrNXlHQi85amo0YlNX?=
 =?utf-8?B?cGJxTTJLT2w4NnZFcjNodWIxSk9QUTFyb282WFg1RzRqaHg4SDAzNTdBb2o1?=
 =?utf-8?B?Y2U0Z3pHT3ByOVYrTzRENkUrNXBNdE9yeENVRnpFM3NQZklDQkRrVFlXenI3?=
 =?utf-8?B?aUFhZkl5OVo2WDhBeGhPNTZnU05oeHcySHljRTY1THlaWFV5ZGFWeXFnMFo4?=
 =?utf-8?B?K0s5emlPdTJwYkE5L0Z6RjVPZ1RMSjZ1KzJCek1NNmpsemF2K0pIS3I3NS9P?=
 =?utf-8?B?eFZMK3dkVXM5WS8zMzN2eWhJQm1OOWNZL1psVTJiQ1lPdnFuVHREdGIvYzVQ?=
 =?utf-8?B?NHAvVW03SXdjVWE0ekszSUE4TFVPSkZ6MUozVTF6SFozekp0V3lJa2R5Z0di?=
 =?utf-8?B?N1pJUi90OVk4VjJqTExQRUxxVXFEREltRVF4dmpJNHRUenFTdFdqc1dsSFJq?=
 =?utf-8?B?K3FmVnRJSXhVd2dIMDlHOWxqeXc5b3ZJQ0E2TTV5Mlk4aUU5YUpRbnpnaXNT?=
 =?utf-8?B?OHNXSWthZllDeGFvOTBKRGlrUm4yaVdkWjVJcEUzUzRZQ21mNFA5ZGFidkxu?=
 =?utf-8?B?M0F0MUlzempzd1d2T2VNT1ZpTkdjOGFiVVUvZ3ZadlBWck1SWUZiczgyMVA3?=
 =?utf-8?B?eU91U2xXYXo0b1k0TEF2eVN0NVViU1BCZ1dwMmhJNW9PVnVwMVRuSnVZWUVL?=
 =?utf-8?B?UXIwMkkxSlZ4Rnoxa0s0K3RMZ2FWNk1RY3k1bVZLc1dMQWQ0cW1Ca2hmeEpG?=
 =?utf-8?B?MFRoak8zWEVVbStJc29yWVh4ZTRzMGRJRk5uRmx0NWxhV01PNUJmaStsaFdu?=
 =?utf-8?B?SXVXcjZkZk5ibEg2RFJweEtPcVhUaFRlemMrY0JyL3dHZFltSzZ1by9JMmRz?=
 =?utf-8?B?NzZFMExadTB5M1Q3dUFoaUtFYWo4dVN6bkJ0Yk1oRFFyN3ZMUWFKU0tVcWJS?=
 =?utf-8?B?b0ZRYlVCZStRTHZYQXN4Q1ZpRkdVZCs3dzB2dmJGUmRPSmEycFloTmpqaHIw?=
 =?utf-8?B?S0pHaUxhMEowcWFSN3I0Rm4wRGw1MWtqQVEwakhZQXRaSjVsMllkZnYvWE43?=
 =?utf-8?B?NTVjZ0ZBQjI3MDNBM3hyQm01R211RjVXcFNxWHJsak5vYms5Rm92cUhCaGVY?=
 =?utf-8?B?ais0THB2QWdKdUhGM0RqUEJSS0I0MklYSDdFTC9Bb1d4TXUzL1BIcnFOOCtq?=
 =?utf-8?B?NFhIVEtoNUhCUUtla1puWldxQmFwY3IxOStpMjJZbTc4cVJPeU5Kbm82UDc5?=
 =?utf-8?B?dHJPVUIwWU00Yk9hU3JKRmhpcHc2TDBTYTVkWTRCb2llMlNsRzhvYVdkM0xK?=
 =?utf-8?B?MzQxdFZuSjRCMVd5bnovUUY0TDFLOCs1QmY5N0Q5M0RFQjV1Q3JKS0lEd0Q2?=
 =?utf-8?B?TGpNV1Q0M1U3OFEvRk9uc09ia0ZjY1d1OTdFQVlOUFZPYnZpcHVLUUN6dGxr?=
 =?utf-8?B?T3pJci9VYTJiTE5wcGZBSmVLYUg5Zm44WGE3YTJVSVZzRGNISjNqbitETVo0?=
 =?utf-8?B?NFU5c09VRlZaWXJpSTZKL1c0N1h5Q2RaRFZoUWxoVlJhYm4yZzlvZi9wK3FP?=
 =?utf-8?B?ZUw5Y3dRRERzek9uWnhWU09vTU05NC94U3lYVVZCcHNabEY3dGRxRlYwYjZ3?=
 =?utf-8?B?NXB4bWovMkplaENBMTAxR3dueDhpMis4VkI0YXZFNGU0ZlJoamFDRVIxKytk?=
 =?utf-8?B?YWRQam5RWDNiMGptbk91VThxWjNScUE1YVBOU3ZsUzR6c25NWVMzK2d3eFpi?=
 =?utf-8?B?aDBDK2NSR2Q5b05PRjlLTHEyOVhJSnh3TGFad0N4V2NPSWJtczFwdXFFTnNM?=
 =?utf-8?B?cW1Pb05kRUVHRkdiREV4RmFPSzNQODhxUDBzMlhBUk4rQ1lnaVVwbkpEM1ls?=
 =?utf-8?B?eHdXU3FiNnN3SWM2TzNOd29abHFkY0FhQkRHcGhrYndnZ0NDMUZoSGQvRFVh?=
 =?utf-8?B?UHJIQ0ZZZkRtSmtkeEIvZ0FtMmgza2kvMURsZUhaV0MwMzNxdVFBN3MrOW52?=
 =?utf-8?B?TWRKaThJSXMrWmNwemFOQXdmNURKVlRYVXc1YVFMN2hXdEtXeHd5d0pmWjYw?=
 =?utf-8?Q?xMMpDHE43asinzXo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D82CBB5D23AC6948A67416F54C50FDC4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Qn3h0u9o7eBuws8PA/f1aisCsbyxwhZFqCZNFxB+uxxLsKnU6dt5Q7pJyGLHIsjcB/0pbzeQxjZCfwR9MabYY79d4Q1kCMJKwOdLGF6jLYK472RLBZX/Erudx5BvPQ+6gx5yCOrHOFX2q+v3w/bWhSX9MQs8Id5B/M32ysbr008UD9IrPEnJzQOc4b+x0qDAf4S3P89wezYWjZ2jUf5aaFf580j1/CHTVykk1T7qNhLKmmm/vYvuWi+8Km+7rZQk+OXakZOD56yYq5ZHt8DytUjVPK5Htx0c+0v8ZicdwwBhwigfvpCZQRloUm9jSlxUJkIiXf1wh3K030iNmphPhg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 492d242e-9a56-4ddf-e927-08de9a6c413a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2026 21:24:47.4208 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: whEYA15YRW3A44WqH51XCDNsGvFDerrD88+tGtUqc43VeGt8HpPRjtRNAJ7Xix1q5sw9UANP9JImLROtNUXYqWpeuaX2kfhDABdnjF4EAL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7686
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

T24gV2VkLCAyMDI2LTAzLTE4IGF0IDEzOjE0ICswNTMwLCBIaW1hbCBQcmFzYWQgR2hpbWlyYXkg
d3JvdGU6DQo+IEFkZCBHdUMgdG8gaG9zdCAoRzJIKSBhY2Nlc3MgY291bnRlciBub3RpZmljYXRp
b24gaGFuZGxlciB0byBwYXJzZQ0KPiBHdUMgZmlybXdhcmUgbWVzc2FnZXMgaW50byBzdHJ1Y3Qg
eGVfYWNjZXNzX2NvdW50ZXIgYW5kIGZvcndhcmQgdG8NCj4geGVfYWNjZXNzX2NvdW50ZXJfaGFu
ZGxlciBmb3IgcHJvY2Vzc2luZy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhpbWFsIFByYXNhZCBH
aGltaXJheQ0KPiA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT4NCj4gLS0tDQo+IMKg
ZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoCAxICsNCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2FjY2Vzc19jb3VudGVyLmMg
fCA2Mg0KPiArKysrKysrKysrKysrKysrKysrKysrDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Y19hY2Nlc3NfY291bnRlci5oIHwgMTUgKysrKysrDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d1Y19jdC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA0ICsrDQo+IMKgNCBmaWxl
cyBjaGFuZ2VkLCA4MiBpbnNlcnRpb25zKCspDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndWNfYWNjZXNzX2NvdW50ZXIuYw0KPiDCoGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2FjY2Vzc19jb3VudGVyLmgNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUNCj4gYi9kcml2ZXJzL2dwdS9k
cm0veGUvTWFrZWZpbGUNCj4gaW5kZXggOTJkOGQ2ZTRhNDQ3Li4yOTZiM2NiYTBiODkgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZQ0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUvTWFrZWZpbGUNCj4gQEAgLTc0LDYgKzc0LDcgQEAgeGUteSArPSB4ZV9hY2Nlc3Nf
Y291bnRlci5vIFwNCj4gwqDCoMKgwqDCoMKgwqDCoHhlX2d1Y19pZF9tZ3IubyBcDQo+IMKgwqDC
oMKgwqDCoMKgwqB4ZV9ndWNfa2x2X2hlbHBlcnMubyBcDQo+IMKgwqDCoMKgwqDCoMKgwqB4ZV9n
dWNfbG9nLm8gXA0KPiArwqDCoMKgwqDCoMKgwqB4ZV9ndWNfYWNjZXNzX2NvdW50ZXIubyBcDQo+
IMKgwqDCoMKgwqDCoMKgwqB4ZV9ndWNfcGFnZWZhdWx0Lm8gXA0KPiDCoMKgwqDCoMKgwqDCoMKg
eGVfZ3VjX3BjLm8gXA0KPiDCoMKgwqDCoMKgwqDCoMKgeGVfZ3VjX3JjLm8gXA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19hY2Nlc3NfY291bnRlci5jDQo+IGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d1Y19hY2Nlc3NfY291bnRlci5jDQo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uMjE1ODQwMGJjNTBhDQo+IC0tLSAvZGV2L251
bGwNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19hY2Nlc3NfY291bnRlci5jDQo+
IEBAIC0wLDAgKzEsNjIgQEANCj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQNCj4g
Ky8qDQo+ICsgKiBDb3B5cmlnaHQgwqkgMjAyNiBJbnRlbCBDb3Jwb3JhdGlvbg0KPiArICovDQo+
ICsNCj4gKyNpbmNsdWRlICJ4ZV9ndWNfYWNjZXNzX2NvdW50ZXIuaCINCj4gKw0KPiArI2luY2x1
ZGUgInhlX2FjY2Vzc19jb3VudGVyLmgiDQo+ICsjaW5jbHVkZSAieGVfZGV2aWNlLmgiDQo+ICsj
aW5jbHVkZSAieGVfZ3QuaCINCj4gKyNpbmNsdWRlICJ4ZV9ndWMuaCINCj4gKyNpbmNsdWRlICJ4
ZV9ndWNfZndpZi5oIg0KPiArDQo+ICsvKioNCj4gKyAqIHhlX2d1Y19hY2Nlc3NfY291bnRlcl9o
YW5kbGVyKCkgLSBHMkggYWNjZXNzIGNvdW50ZXIgaGFuZGxlcg0KPiArICogQGd1YzogR3VDIG9i
amVjdA0KPiArICogQG1zZzogRzJIIG1lc3NhZ2UNCj4gKyAqIEBsZW46IExlbmd0aCBvZiBHMkgg
bWVzc2FnZQ0KPiArICoNCj4gKyAqIFBhcnNlIEd1QyB0byBob3N0IChHMkgpIG1lc3NhZ2UgaW50
byBhIHN0cnVjdCB4ZV9hY2Nlc3NfY291bnRlcg0KPiBhbmQgZm9yd2FyZA0KPiArICogb250byB0
aGUgWGUgYWNjZXNzIGNvdW50ZXIgbGF5ZXIuDQo+ICsgKg0KPiArICogUmV0dXJuOiAwIG9uIHN1
Y2Nlc3MsIG5lZ2F0aXZlIGVycm9yIGNvZGUgb24gZmFpbHVyZQ0KPiArICovDQo+ICtpbnQgeGVf
Z3VjX2FjY2Vzc19jb3VudGVyX2hhbmRsZXIoc3RydWN0IHhlX2d1YyAqZ3VjLCB1MzIgKm1zZywg
dTMyDQo+IGxlbikNCj4gK3sNCj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2FjY2Vzc19jb3Vu
dGVyIGFjOw0KPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGd1Y190b194
ZShndWMpOw0KPiArwqDCoMKgwqDCoMKgwqBpbnQgaTsNCj4gKw0KPiArI2RlZmluZSBHVUNfQUND
X01TR19MRU5fRFfCoMKgwqDCoMKgXA0KPiArwqDCoMKgwqDCoMKgwqAoc2l6ZW9mKHN0cnVjdCB4
ZV9ndWNfYWNjX2Rlc2MpIC8gc2l6ZW9mKHUzMikpDQo+ICsNCj4gK8KgwqDCoMKgwqDCoMKgQlVJ
TERfQlVHX09OKEdVQ19BQ0NfTVNHX0xFTl9EVyA+DQo+IFhFX0FDQ0VTU19DT1VOVEVSX1BST0RV
Q0VSX01TR19MRU5fRFcpOw0KPiArDQo+ICvCoMKgwqDCoMKgwqDCoGlmIChsZW4gIT0gR1VDX0FD
Q19NU0dfTEVOX0RXKQ0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1F
UFJPVE87DQo+ICsNCj4gK8KgwqDCoMKgwqDCoMKgYWMuZ3QgPSBndWNfdG9fZ3QoZ3VjKTsNCj4g
Kw0KPiArwqDCoMKgwqDCoMKgwqAvKiBQYXJzZSBhY2Nlc3MgY291bnRlciBkZXNjcmlwdG9yICov
DQoNCkl0IHdvdWxkIGJlIG5pY2UgaWYgdGhlc2UgY2FuIGJlIG9yZGVyZWQgYnkgd2hhdCB3ZSBo
YXZlIGluIGJzcGVjIGFuZA0KdGhlIEd1QyBpbnRlcmZhY2Ugc3BlYy4NCg0KPiArwqDCoMKgwqDC
oMKgwqBhYy5jb25zdW1lci5ncmFudWxhcml0eSA9IEZJRUxEX0dFVChBQ0NfR1JBTlVMQVJJVFks
IG1zZ1syXSk7DQo+ICvCoMKgwqDCoMKgwqDCoGFjLmNvbnN1bWVyLnN1Yl9ncmFudWxhcml0eSA9
IEZJRUxEX0dFVChBQ0NfU1VCR19ISSwgbXNnWzFdKQ0KPiA8PCAzMSB8DQoNCm5pdDogY2FuIHlv
dSBhZGQgYSBub3RlIGhlcmUgdGhhdCB0aGlzIGlzIGp1c3QgYSBzaW5nbGUgYml0IGluIHRoZSBu
ZXh0DQpkd29yZCwgaGVuY2Ugd2UgZG9uJ3QgbmVlZCBhbnkgY2FzdGluZyBoZXJlPw0KDQpUaGFu
a3MsDQpTdHVhcnQNCg0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEZJRUxEX0dFVChBQ0NfU1VCR19MTywg
bXNnWzBdKTsNCj4gK8KgwqDCoMKgwqDCoMKgYWMuY29uc3VtZXIuY291bnRlcl90eXBlID0gRklF
TERfR0VUKEFDQ19UWVBFLCBtc2dbMF0pOw0KPiArwqDCoMKgwqDCoMKgwqBhYy5jb25zdW1lci52
YV9yYW5nZV9iYXNlID0gKCh1NjQpKG1zZ1szXSAmDQo+IEFDQ19WSVJUVUFMX0FERFJfUkFOR0Vf
SEkpIDw8IDMyKSB8DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAobXNnWzJdICYNCj4gQUNDX1ZJUlRVQUxfQURE
Ul9SQU5HRV9MTyk7DQo+ICvCoMKgwqDCoMKgwqDCoC8qIHhlMzogVXNlIEFTSUQgYW5kIGVuZ2lu
ZSBpbmZvICovDQo+ICvCoMKgwqDCoMKgwqDCoGFjLmNvbnN1bWVyLnhlMy5hc2lkID0gRklFTERf
R0VUKEFDQ19BU0lELCBtc2dbMV0pOw0KPiArwqDCoMKgwqDCoMKgwqBhYy5jb25zdW1lci54ZTMu
ZW5naW5lX2NsYXNzID0gRklFTERfR0VUKEFDQ19FTkdfQ0xBU1MsDQo+IG1zZ1sxXSk7DQo+ICvC
oMKgwqDCoMKgwqDCoGFjLmNvbnN1bWVyLnhlMy5lbmdpbmVfaW5zdGFuY2UgPSBGSUVMRF9HRVQo
QUNDX0VOR19JTlNUQU5DRSwNCj4gbXNnWzFdKTsNCj4gK8KgwqDCoMKgwqDCoMKgYWMuY29uc3Vt
ZXIueGUzLnZmaWQgPSBGSUVMRF9HRVQoQUNDX1ZGSUQsIG1zZ1syXSk7DQo+ICsNCj4gK8KgwqDC
oMKgwqDCoMKgLyogU3RvcmUgcHJvZHVjZXIgbWVzc2FnZSBmb3IgcG90ZW50aWFsIGFja25vd2xl
ZGdtZW50ICovDQo+ICvCoMKgwqDCoMKgwqDCoGFjLnByb2R1Y2VyLnByaXZhdGUgPSBndWM7DQo+
ICvCoMKgwqDCoMKgwqDCoGZvciAoaSA9IDA7IGkgPCBHVUNfQUNDX01TR19MRU5fRFc7ICsraSkN
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGFjLnByb2R1Y2VyLm1zZ1tpXSA9IG1z
Z1tpXTsNCj4gKw0KPiArI3VuZGVmIEdVQ19BQ0NfTVNHX0xFTl9EVw0KPiArDQo+ICvCoMKgwqDC
oMKgwqDCoHJldHVybiB4ZV9hY2Nlc3NfY291bnRlcl9oYW5kbGVyKHhlLCAmYWMpOw0KPiArfQ0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19hY2Nlc3NfY291bnRlci5o
DQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19hY2Nlc3NfY291bnRlci5oDQo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uMWFjOGU3NjM5OGQyDQo+IC0t
LSAvZGV2L251bGwNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19hY2Nlc3NfY291
bnRlci5oDQo+IEBAIC0wLDAgKzEsMTUgQEANCj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBNSVQgKi8NCj4gKy8qDQo+ICsgKiBDb3B5cmlnaHQgwqkgMjAyNSBJbnRlbCBDb3Jwb3JhdGlv
bg0KPiArICovDQo+ICsNCj4gKyNpZm5kZWYgX1hFX0dVQ19BQ0NFU1NfQ09VTlRFUl9IXw0KPiAr
I2RlZmluZSBfWEVfR1VDX0FDQ0VTU19DT1VOVEVSX0hfDQo+ICsNCj4gKyNpbmNsdWRlIDxsaW51
eC90eXBlcy5oPg0KPiArDQo+ICtzdHJ1Y3QgeGVfZ3VjOw0KPiArDQo+ICtpbnQgeGVfZ3VjX2Fj
Y2Vzc19jb3VudGVyX2hhbmRsZXIoc3RydWN0IHhlX2d1YyAqZ3VjLCB1MzIgKm1zZywgdTMyDQo+
IGxlbik7DQo+ICsNCj4gKyNlbmRpZg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d1Y19jdC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jDQo+IGluZGV4
IGExMWNmZjdhMjBiZS4uOGFjMDkzOGY3YTI4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3VjX2N0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5j
DQo+IEBAIC0yNiw2ICsyNiw3IEBADQo+IMKgI2luY2x1ZGUgInhlX2d0X3NyaW92X3BmX21vbml0
b3IuaCINCj4gwqAjaW5jbHVkZSAieGVfZ3VjLmgiDQo+IMKgI2luY2x1ZGUgInhlX2d1Y19sb2cu
aCINCj4gKyNpbmNsdWRlICJ4ZV9ndWNfYWNjZXNzX2NvdW50ZXIuaCINCj4gwqAjaW5jbHVkZSAi
eGVfZ3VjX3BhZ2VmYXVsdC5oIg0KPiDCoCNpbmNsdWRlICJ4ZV9ndWNfcmVsYXkuaCINCj4gwqAj
aW5jbHVkZSAieGVfZ3VjX3N1Ym1pdC5oIg0KPiBAQCAtMTYzMCw2ICsxNjMxLDkgQEAgc3RhdGlj
IGludCBwcm9jZXNzX2cyaF9tc2coc3RydWN0IHhlX2d1Y19jdA0KPiAqY3QsIHUzMiAqbXNnLCB1
MzIgbGVuKQ0KPiDCoMKgwqDCoMKgwqDCoMKgY2FzZSBYRV9HVUNfQUNUSU9OX1JFUE9SVF9QQUdF
X0ZBVUxUX1JFUV9ERVNDOg0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9
IHhlX2d1Y19wYWdlZmF1bHRfaGFuZGxlcihndWMsIHBheWxvYWQsDQo+IGFkal9sZW4pOw0KPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOw0KPiArwqDCoMKgwqDCoMKgwqBj
YXNlIFhFX0dVQ19BQ1RJT05fQUNDRVNTX0NPVU5URVJfTk9USUZZOg0KPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0geGVfZ3VjX2FjY2Vzc19jb3VudGVyX2hhbmRsZXIoZ3Vj
LCBwYXlsb2FkLA0KPiBhZGpfbGVuKTsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGJyZWFrOw0KPiDCoMKgwqDCoMKgwqDCoMKgY2FzZSBYRV9HVUNfQUNUSU9OX1RMQl9JTlZBTElE
QVRJT05fRE9ORToNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSB4ZV9n
dWNfdGxiX2ludmFsX2RvbmVfaGFuZGxlcihndWMsIHBheWxvYWQsDQo+IGFkal9sZW4pOw0KPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOw0KDQo=
