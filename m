Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B68CD98CC
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 22:49:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9BF10E8BB;
	Thu, 11 Jun 2026 22:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NfLI9Ze3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19A510E8BB
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 22:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781218164; x=1812754164;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=mDiY0WMCw2czmlecPWBbJdBhAB3pAC8kNyNQOov5tu4=;
 b=NfLI9Ze3PaFk1ID3QUK5KidNq+7UYDVbp3QZvDgt8uhpQOrOKOSgSxNb
 VSKmYh0DmNRy7l1sa4wXNYEpSJogzy2lehLRytxwIA2EP5PUN4ozkw3TN
 THvOYqgOdOvdwx5SQJRF+jXROEng/2IhGLJabKmFMySNSDSWGBOmgYXwu
 IlZKUcCZo6j12wyJPwtvL9OzzRKZDNifWNQFCdjyM9iy/yzzvYzJP7ZGA
 g0Rt889nalF0a4pO9h8D8tgu2aT207+PtSZP+WfF4FaQ3aiibQFsp2Ab4
 uvXvsIzjURnGb0rAs+kb/IQgPtdB2773i8yfNEu4NcJO4Yx5lEeGVDFff A==;
X-CSE-ConnectionGUID: t1NXNd/JSxiN6xZ5p5TnEg==
X-CSE-MsgGUID: 19YahsSRQ32plzG+Yctpsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93437331"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="93437331"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 15:49:24 -0700
X-CSE-ConnectionGUID: n5uVwcaaQti1/TD2v6F1RA==
X-CSE-MsgGUID: ar79qdmPSBqkraCuG+2SkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="242267131"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 15:49:23 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 15:49:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 15:49:23 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.19) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 15:49:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RQwzK4loNZMjRsluUUlXNvsKFFL9JgVt62Uz69wCxesx/0RhhQKe8FGkEivumWSWMXK59KT6nzTSDxjSHzBT9E61bl4YfepYxkQVJCLLIpOnNiKS0igDUtNH8vODJcyZmrQRuZ+kWOem58uIUtDXaITINtw7Rqh22xHvddx9kpzMvepMys051Kht5heutQnga0+piAJSj8ZtLhvyg+yb+8eF4IIMrpwmjJi6U3v3sXt841u3BaXryFTZZXz3PlJUKuB6JThH+Kw8BhOYKvvUSrY46dkJ+uQ4kXOtJIQzF/dB1HchYZ67cHxX+Yy0JEUFzakYv9lE+5Hb9CIGY+KIUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDiY0WMCw2czmlecPWBbJdBhAB3pAC8kNyNQOov5tu4=;
 b=q19USOa6/iMqnrL99h0Pq8AVKVTyJRw4/4wMvePq+9blhQrl7A659bM6gvcQhhwFwBAAZHLMdmqFwih8fxfl4FDxmT5eL42e6urHvR01PII2WbO3w01nRHXXyrSJP06lDVgsv54My6rUo9g2DZvIso4ob0Q1cYtM6xp4+y/Es0UDMx0QG1CqJ3pS9c+9M3vqrE5rakpEBD4fZ1nZeq4nxK6K4Yx6Jp6RJuAklYvps6u573Q78+fKF/ADQoByNgupG7KJ5aAGaHu6anCSF43ph+8QhXv8DblMKX0RihSJqxaIvY7JJmDCNxAtMBbEoNxecD9bP+iS8eIEmyW4sn6h7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9)
 by DS0PR11MB8082.namprd11.prod.outlook.com (2603:10b6:8:157::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 22:49:12 +0000
Received: from CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76]) by CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76%6]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 22:49:11 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "maarten@lankhorst.se" <maarten@lankhorst.se>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Wang, X" <x.wang@intel.com>, "Teres
 Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Levi, Ilia"
 <ilia.levi@intel.com>, "Wajdeczko, Michal" <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 03/11] drm/xe: Cap MSI-X vector count to XE_MSIX_MAX_VECS
Thread-Topic: [PATCH 03/11] drm/xe: Cap MSI-X vector count to XE_MSIX_MAX_VECS
Thread-Index: AQHc+SAfTXlVFoUcxUCO95DX8tWo0LY5LT4AgADJhwA=
Date: Thu, 11 Jun 2026 22:49:11 +0000
Message-ID: <33176777e912d36550455b221bac5f4b355c7819.camel@intel.com>
References: <20260610212833.153366-13-stuart.summers@intel.com>
 <20260610212833.153366-16-stuart.summers@intel.com>
 <cff1c411-59a6-4b1c-acb5-5c3b8762f628@lankhorst.se>
In-Reply-To: <cff1c411-59a6-4b1c-acb5-5c3b8762f628@lankhorst.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6320:EE_|DS0PR11MB8082:EE_
x-ms-office365-filtering-correlation-id: 96141b82-b666-4875-6951-08dec80ba758
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|4143699003|3023799007|11063799006|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: PvwlhNmnzlNIf0DSGXI2y4XBJ5pI04fTkynG82yCBgRRj4pJglK5Unss9pqw+s68pH9UQdzMOk9ObmqOJLnNc6TlQlNv0jqE81IqhqlMrIsvYPujUt3iBMJXEfcMyB6h3ve4wq9SQkKoIHwDxfupPExor7WmcEpgV+u8GLwKkkyt4fRK3C8IgboJe2PacUMZlV2KJIbTZDe7Rt7U8tV3cRW8RIFrsag09pq4PhStMZl4LVHZQ1PFKdxAz1ylcy+aIX/c6Bkb629190NTlQ+dMdijetc8jLYEkwkrpCMOOqVDEdR84fZ5HkiJ4Xl3x5QFBQtI/TYQ4LBniAJFSDGFW9wUo8UJUIA8LaHibMv+3S/vzCj5UdoH4ndWeiDg08wbYm1fGcDcQXtIs36+YTBhLo75pp/t5s82F3A9t6c6qAI3agkcVRWBR5OXOrfoKnv37Bx/YneYkgRrOdYVccKn2gVKL2knfpvvAwHvDJC7iQ9B5X7pMYi9cki9zHbmX+ovS/D8GxkmEMXJj6MzLWjQi1UW6Cp7EzM6hvvsXfgsHynjLYebJD9EXu04gF5LFHpj/w5L6hHFnUTmMMwC5SW4YdPuqODzyLva1/17FoXdksdkcdFlCcZZrncoew2jLFjFn5evA+r2G+Jcw2++ltm38zdWrglcPCL2qydMMwWdQq430xbP+dlb9MHZnMA7B+5/VE1gNueqWRjX8y3Q3PnboT0juiTpFF1zOO5bzWful0Hv7OSb04X7nqtB7ANF5aQx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6320.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(4143699003)(3023799007)(11063799006)(56012099006)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nmt6SS9LaDhoNE1pUWFzcXBGR0F1TnVpTFBCV2tUeVJieTMwemtOSzgwTVpv?=
 =?utf-8?B?Y2hCR2NFU2Qxck84Rk1sS2JQWEtoaXp5QXc4ZEJta0Njbm9SUlB6dFUzMVov?=
 =?utf-8?B?ajZBNWFMMytOdWtxVXBYUXFrY1pBVmNnckRuaWg4Z1hWS1VQeW5XdFJUVzhk?=
 =?utf-8?B?eElYWjZaMlphMWNTck4wR3RpREh3a1F1NmxTbWZzaGhQY1NUdGt0dDVLRmFu?=
 =?utf-8?B?K1c4MXBlYUNqUjRWT0RKZlBheUl1djFVRTVIRjBEYm96Q3kyMnNhNlFPQU9B?=
 =?utf-8?B?WnJzTGVLZ3FxUjhEenpLRE9XdFA3STlHTDZFT3ZLbEhiNVN3bWcxZmI3YVp2?=
 =?utf-8?B?WDlxbDhFOVRuY1EyaHFPK0VHSFlzbXlSbGt0T2cvNzZtSEVBVGRkOXM0UXE5?=
 =?utf-8?B?NzlzcDl4UUN4c2ZUa09TTEptVzQzYnJDdEs0Y3NYbkdjNTBZQ0NVeTk3TWlL?=
 =?utf-8?B?Zm9KVnphdVR0NFZURkF0a3FhWUZTU1dUZUxoZXA4a1hLVk9XdENWZWxDUGFJ?=
 =?utf-8?B?bG1vYlpsZml5b25VQXBEbFN5N2FONjhWTTRIdUlwTkFTSlp3YWE1QWZLbjNo?=
 =?utf-8?B?RExZLzMyR25ZZXZIbCthTzFISW9iaWwvcU9TdlNneUNySTE5TTJGTkFtL3hL?=
 =?utf-8?B?RXJnTFVWZUJZUVZFRnBMamhEaTFUd0JEOEV0Z3paSkZROUdPUGx1QWFkTlNL?=
 =?utf-8?B?NXJ2NnNBSEdUWUFWalZISWNva1NNVTREYm9zNFl3K2dzSlNlNlpCd00ySzBS?=
 =?utf-8?B?MUxKOEpiaTNOMnlCT2tvdVVXMS9iYVE0UkNoTjROL2pGamdnZlY1Zjh5S2Zq?=
 =?utf-8?B?emtxV2pqeDdlNW0zQUg0dzh1ZHFveFVSUXYvZUpiaS84aGo3Y1Y1MUhPYkUx?=
 =?utf-8?B?OHJaQTRUbVhPVWpHQUlBbGtCUy9KZWhWazhvdXhpalhEQ1RiYXpLQUhvMVVR?=
 =?utf-8?B?RkRsamZLRTZHKzZTMDB0bVM3VzdDZ3RRS3gyR2V0YVpEeVpWQ05WZ1ZmdWFQ?=
 =?utf-8?B?OWRUWER0QnBrNDZMcldTK2I2RHgySjk3MlFzTWdhaC9YTEp4dlJ2dFBhRzdn?=
 =?utf-8?B?U1FqWkhLOFIreER5VnoyS2RpcVh5YWNGaFJkUHAvYmlNWVpLNWtKRk00ZXJX?=
 =?utf-8?B?OTlkNWJvbnBRSllpalNZcTFyRTZiVTRXcjhuajBDRjlrSEk5RzV2RlgwZXA1?=
 =?utf-8?B?aWdxNHNCdjl6YkthQ25jME0wV2haT0xQakt6UXZPWXJYM2lXclRpcG9YcTM2?=
 =?utf-8?B?M0pKYXBhQmdlSEZiMjFQbDgxVVZPazkyMHJIL2EzMDlPLzVxQ1dmV1I4V09B?=
 =?utf-8?B?aHZIeXhGR2xlNXpMc1hFdXY1S0RBTE5TaU9DK3VGRC9QcFlkd25tTE9JZ2lF?=
 =?utf-8?B?eWdHQnFqR1N2Z0VZOXV4MlZUK3lpRFZuakx0K3hueUFRTm5KQW5TMVVHUTFt?=
 =?utf-8?B?U1dMUENnYnRnSEo1bkN2ZE1yTmh1YlJwSFAwU1pvemZNQVpjbEpBc2dGZW1U?=
 =?utf-8?B?QXhTdVJiemxJYndEbkZHMno0anMwLzd3UHdFYTFXOFVxUXRUNHZNU0R6SGZM?=
 =?utf-8?B?NmUvRm9aSE9WMEdIcmlMQ042RkQyTFUwNjBpc0Y5MU8rWEFtVFkrVWFyNlFi?=
 =?utf-8?B?c21CQ1JBcGtYbGE2WnhybEJkbnducHEzQThPN0xTcUdYLzJiVTFQRGF0N3R2?=
 =?utf-8?B?S3o1SmpjWFhiV0I3aWd6NlJQNW1sOXAzSGwvVnZyY0NybUd3dTNQcHdhWkpG?=
 =?utf-8?B?MHo5Ny8xZU9BWnk3blVUT1ViKzJmaUtTaDNOR2FBMGFwWHVPNURvOUhsSldz?=
 =?utf-8?B?R1IrR2JWUzJMbzF1MEZmNGsvTHkwWkZOblZoczBLemRJdHZtc0dSVG5QZGxT?=
 =?utf-8?B?eXIvaWpkeGRJQmxoV250ZHFXb2ttcDZoRWNRSVlia0Y0ai9ZQmd2SS9sOUlU?=
 =?utf-8?B?cEpKdmtEWklURzZ4MUU1SS9uejZjYVVoeEpJZzhkcWsxNHREMDQ2Y1ZJeXdn?=
 =?utf-8?B?Sm5DYWlhUGxqNzkrbWZzMVhHR1d6aFIyTlh5SFdQNTVHbzdBMTNkeENHNkJx?=
 =?utf-8?B?SEN5OUsvWTBsRTJCRXErMWQwQ00vUmRLV20rd3Y4STFrdDRNa0Ztd2hHUzlC?=
 =?utf-8?B?UVIvQ1ZUVEVUTm1TbXBGZmVVTHpOMER1VmhrTnBLOFpkWHRBWUN2M3ZZK3FH?=
 =?utf-8?B?dE5WMXJXYms1QXcvYVQzR1VXU2lncWVJaW5qWkZrR1dFZGViNWhxYTVDSHZM?=
 =?utf-8?B?TjViK1pSMlFLUEYwSENVNWxwV3QvaDdkY2ZhaVR1NG8rQkJRTXlEMFpRUzJK?=
 =?utf-8?B?Q3lsaW5HeXFSU0ovTzM0VFlvUEFIZVpxTVNPR1pTaEtZNEVHK0NCMllEcGhC?=
 =?utf-8?Q?1NbFG5tdrsTIht6w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <878E17F51A1EC940B82EE331895B7686@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bIGy/+7UYdPeqsfZreG7R1lgk0SVv8/2v8bIbGKaQBTCPgR4k4AmA7Z9MSQO7ZxnvBnwhAGvsfxW+8dcsNRdfqRJ85oaMJ9usm1tLTojgHYW00ucYApEiqg1v1ROF3KpZ71wMOyLfgJU4CyMasRmAhUbMNGvRRFGpyJ1/I2n0n/n+ilA3exCEMkbckFkws3Tksu8UwFjgJJLmXK5/Q6pz2wUdxzRLG66WP5vcQmvXqmf03COkIWA5kMJlTjzcxbqJrvthtNjRQoAdyVdYTsdjyHtvIQ2Pawn8PbBW52alrgLyjtf1IPzt2MtORX8tnUMKcPwT999MiA98OhTHqbmaQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96141b82-b666-4875-6951-08dec80ba758
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 22:49:11.0704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mAJ+EJ/enA7bWha6hlIEqW8kJ34P3iqGrbhkCebyh3QBomQeS3/ELzF0CT0YpVkgzNqPqI80eP1hS5dhHP0ZPIOUVMi60iAjGJ/NTJPq/XI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8082
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

T24gVGh1LCAyMDI2LTA2LTExIGF0IDEyOjQ3ICswMjAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gSGVsbG8sDQo+IA0KPiBPbiA2LzEwLzI2IDIzOjI4LCBTdHVhcnQgU3VtbWVycyB3cm90
ZToNCj4gPiBJbnRyb2R1Y2UgWEVfTVNJWF9NQVhfVkVDUyAoMTAyNCkgYXMgYSBzb2Z0d2FyZSBj
YXAgb24gdGhlIHRvdGFsDQo+ID4gbnVtYmVyDQo+ID4gb2YgTVNJLVggdmVjdG9ycyB0aGUgZHJp
dmVyIHdpbGwgdXNlLiBXZSB3YW50IGEgd2F5IHRvIGNhcCB0aGUNCj4gPiBudW1iZXINCj4gPiBv
ZiB2ZWN0b3JzIHNlcGFyYXRlbHkgZnJvbSB0aGUgUENJZSBjYXBhYmlsaXR5LiBUaGlzIHdheSB3
ZSBjYW4NCj4gPiBtb3JlDQo+ID4gZWFzaWx5IG1hbmFnZSBjZXJ0YWluIHN5c3RlbS13aWRlIGNv
bmZpZ3VyYXRpb25zIHRoYXQgbWlnaHQgZGlmZmVyDQo+ID4gZnJvbSB0aGUgcGVyLWRldmljZSBs
ZXZlbCBjb25maWd1cmF0aW9uLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFN0dWFydCBTdW1t
ZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQo+ID4gQXNzaXN0ZWQtYnk6IENvcGlsb3Q6
Y2xhdWRlLXNvbm5ldC00LjYNCj4gPiAtLS0NCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9p
cnEuYyB8IDIgKy0NCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9pcnEuaCB8IDcgKysrKysr
Kw0KPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2lycS5jDQo+ID4g
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaXJxLmMNCj4gPiBpbmRleCA5ZTQ5ZTIyNDFkYTQuLjM0
MjliYjMwNTI5MyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaXJxLmMN
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaXJxLmMNCj4gPiBAQCAtODk1LDcgKzg5
NSw3IEBAIHN0YXRpYyBpbnQgeGVfaXJxX21zaXhfaW5pdChzdHJ1Y3QgeGVfZGV2aWNlDQo+ID4g
KnhlKQ0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIG52ZWM7DQo+
ID4gwqDCoMKgwqDCoMKgwqDCoH0NCj4gPiDCoA0KPiA+IC3CoMKgwqDCoMKgwqDCoHhlLT5pcnEu
bXNpeC5udmVjID0gbnZlYzsNCj4gPiArwqDCoMKgwqDCoMKgwqB4ZS0+aXJxLm1zaXgubnZlYyA9
IG1pbl90KGludCwgbnZlYywgWEVfTVNJWF9NQVhfVkVDUyk7DQo+ID4gwqDCoMKgwqDCoMKgwqDC
oHhhX2luaXRfZmxhZ3MoJnhlLT5pcnEubXNpeC5pbmRleGVzLCBYQV9GTEFHU19BTExPQyk7DQo+
ID4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiAwOw0KPiA+IMKgfQ0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfaXJxLmgNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9p
cnEuaA0KPiA+IGluZGV4IGEyOGJkNTc3YmE1Mi4uNWY0ODI0OWRhZThhIDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9pcnEuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9pcnEuaA0KPiA+IEBAIC0xMCw2ICsxMCwxMyBAQA0KPiA+IMKgDQo+ID4gwqAjZGVm
aW5lIFhFX0lSUV9ERUZBVUxUX01TSVggMQ0KPiA+IMKgDQo+ID4gKy8qDQo+ID4gKyAqIFNvZnR3
YXJlIGNhcCBvbiB0aGUgdG90YWwgbnVtYmVyIG9mIE1TSS1YIHZlY3RvcnMgdGhlIGRyaXZlcg0K
PiA+IHdpbGwgdXNlLg0KPiA+ICsgKiBBbGxvd3MgdGhlIHN1cHBvcnRlZCB2ZWN0b3JzIHRvIGJl
IG1hbmFnZWQgaW5kZXBlbmRlbnQgb2YgdGhlDQo+ID4gUENJDQo+ID4gKyAqIGNvbmZpZyBzcGFj
ZSByZXBvcnQuDQo+ID4gKyAqLw0KPiA+ICsjZGVmaW5lIFhFX01TSVhfTUFYX1ZFQ1MgMTAyNA0K
PiA+ICsNCj4gPiDCoHN0cnVjdCB4ZV9kZXZpY2U7DQo+ID4gwqBzdHJ1Y3QgeGVfdGlsZTsNCj4g
PiDCoHN0cnVjdCB4ZV9ndDsNCj4gDQo+IEkgdG9vayBhIHF1aWNrIGxvb2sgYXQgdGhlIFBDSSBk
b2NzIGZvciB0aGUga2VybmVsLg0KPiANCj4gcGNpX2FsbG9jX2lycV92ZWN0b3JzIHdpbGwgcmVx
dWVzdCBhIG1pbmltdW0gb2YgMTAyNCB2ZWN0b3JzIGluIHRoaXMNCj4gY2FzZSwNCj4gYnV0IGlz
IGFsbG93ZWQgdG8gYWxsb2NhdGUgbW9yZS4NCj4gDQo+IEFsdGhvdWdoIHdlIHNob3VsZCBzZXQg
YSBzZW5zaWJsZSBkZWZhdWx0IHVzaW5nIHBjaV9tc2l4X3ZlY19jb3VudCgpLA0KPiBJJ20gbm90
IHN1cmUgaXQgbWFrZXMgc2Vuc2UgdG8gc3BlY2lmaWNhbGx5IGxpbWl0IHRoZW0gaWYgd2UgY2Fu
IHVzZQ0KPiBhcyBtYW55IGFzIHdlIGxpa2UuDQo+IA0KPiBUaGUgcmV0dXJuIHZhbHVlIG9mIHBj
aV9hbGxvY19pcnFfdmVjdG9ycyByZXR1cm5zIHRoZSBhbW91bnQgb2YNCj4gdmVjdG9ycyBhY3R1
YWxseSBhdmFpbGFibGUsIHNvIHRoaXMgcGF0Y2ggY2xhbXBzIHRoZSBhbW91bnQgYXZhaWxhYmxl
DQo+IHdpdGhvdXQgbmVjZXNzaXR5Lg0KPiANCj4gV2hhdCBhYm91dCB0aGlzIGluc3RlYWQsIGFu
ZCBkcm9wIGNvbmZpZ2ZzPw0KPiANCj4geGUtPmlycS5tc2l4Lm52ZWMgPSBlcnIgPSBwY2lfYWxs
b2NfaXJxX3ZlY3RvcnMocGRldiwNCj4gTlVNX09GX1NUQVRJQ19NU0lYLCBwY2lfbXNpeF92ZWNf
Y291bnQoKSkgPw0KPiANCj4gSW4gdGhpcyBjYXNlLCB3ZSBnZXQgdGhlIG1heGltdW0gYW1vdW50
IG9mIHZlY3RvcnMgYXZhaWxhYmxlLCB3aXRob3V0DQo+IHJlcXVpcmluZyBhbnkgY2FwcyBvciBy
ZXF1aXJpbmcgY29uZmlnZnMuDQo+IA0KPiBJZiBNU0ktWCB2ZWN0b3JzIHJlYWxseSBwcm92aWRl
IGEgc3BlZWR1cCwgd291bGQgaXQgYmUgYmVuZWZpY2lhbCB0bw0KPiB1c2UgdGhvc2Ugb24gdGhl
IG1pZ3JhdGlvbiBxdWV1ZXMgYXMgd2VsbD8NCg0KU28gdGhlcmUgYXJlIHR3byBpc3N1ZXMgSSdt
IHRyeWluZyB0byBzb2x2ZSB3aXRoIHRoaXMgYW5kIHRoZSBjb25maWdmcw0KcGF0Y2ggKG1vc3Rs
eSB0aGUgY29uZmlnZnMgcGF0Y2gpLg0KDQoxKSBPdXIgaGFyZHdhcmUgbWlnaHQgcmVwb3J0IGEg
dmFsdWUsIGJ1dCBkZXBlbmRpbmcgb24gdGhlIGdlbmVyYXRpb24sDQp0aGUgZmlybXdhcmUgbWln
aHQgbGltaXQgdGhlIGFtb3VudCB3ZSBjYW4gcmVhbGlzdGljYWxseSBjb25maWd1cmUgZm9yDQp2
YXJpb3VzIHJlYXNvbnMuIEkgcmVhbGl6ZSB3ZSBkb24ndCB3YW50IHRvIG5lY2Vzc2FyaWx5IG92
ZXJyaWRlIHRoZQ0KUENJZSBjb25maWcgd2l0aG91dCByZWFzb24sIGJ1dCB3ZSBhbHNvIHdhbnQg
dG8gbWFrZSBzdXJlIHdlIGFyZW4ndA0KdHJ5aW5nIHRvIGFsbG9jYXRlIG1vcmUgdGhhbiB0aGUg
ZmlybXdhcmUgaGFzIHNldCB1cCBmb3IgdXMgaW4gdGVybXMgb2YNCnNlY3VyaXR5LCBldGMuIFdl
IHdhbnQgdG8gY2F0Y2ggdGhpcyBraW5kIG9mIHRoaW5nIGluIHNvZnR3YXJlIGlmDQpwb3NzaWJs
ZSByYXRoZXIgdGhhbiBhbGxvY2F0aW5nIHZlY3RvcnMgdGhhdCBhcmUgbWFza2VkIGluIGhhcmR3
YXJlIGFuZA0Kb25seSBmaW5kIG91dCB3aGVuIHRoZSB1c2VyIGFwcHMgc3RhcnQgaGFuZ2luZyAo
YmVjYXVzZSB0aGUgaW50ZXJydXB0cw0KdGhleSBleHBlY3RlZCBhcmVuJ3QgY29taW5nIGluKS4N
Cg0KMikgVGhlcmUgYXJlIHVzZSBjYXNlcyBsaWtlIHZtd2FyZSB0aGF0IGxpbWl0IG5vdCBieSB0
aGUgZGV2aWNlLCBidXQgYnkNCnRoZSBlbnRpcmUgc3lzdGVtLiBPdXIgZGV2aWNlIGFuZCBmaXJt
d2FyZSBtaWdodCBzdXBwb3J0IHNvbWV0aGluZyBsaWtlDQoxMDI0LCBidXQgd2UgYXJlIGp1c3Qg
b25lIG9mIG1hbnkgZGV2aWNlcyBpbiB0aGUgc3lzdGVtIGFuZCBpbiB0aGUNCmh5cGVydmlzb3Ig
d2Ugd2FudCBhIHdheSB0byBsaW1pdCB0aGlzIHdpdGhvdXQgaGF2aW5nIHRvIGNoYW5nZSB0aGUN
CkJJT1MgY29uZmlndXJhdGlvbi4NCg0KVGhhbmtzLA0KU3R1YXJ0DQoNCj4gDQo+IEtpbmQgcmVn
YXJkcywNCj4gfk1hYXJ0ZW4gTGFua2hvcnN0DQoNCg==
