Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F73CC3064D
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 13:53:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F8D10EAB6;
	Thu, 27 Jun 2024 13:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YjfV4Es7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43EE10E32F
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 13:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719496394; x=1751032394;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=YMi0HFcmySnKCqUyFT09Cw4zIayx15BmUi1jTSN/yDA=;
 b=YjfV4Es79pKFE0KP3wqSe4UoMcMd1YQKLQKWZn4Uu+VQEEQlwryTJ9Hk
 I/cBK24hOFSeWkbBkDurFuKxElnBdv91alf8GzQXN3sArTY7gEFZVOJxx
 ANhKAHjABx4tkN8MKWAf/QeB46ugcLU9US+e6Qo/9FObPcy3HZndYdFQ1
 PAUcPStM5JrOCzHU8YOZIKMnMoSCS9dbZINohTItV0feyb6a9Rm+u/bcS
 G9gN7SC4FUVvPZmTPPqbWdFFGz2t8E+YMYED8/OVy9S5EpQh6RA1K2yyP
 SRNQIsNOj8SX0c/RTbxts7dUBkM030te40sNhyVcFwAUv/yNOf4tMhsTT A==;
X-CSE-ConnectionGUID: I2P1alggRlS5s9wwc+24Kw==
X-CSE-MsgGUID: dCh9eWXLRce4sK+x3o+iRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27246307"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="27246307"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 06:53:13 -0700
X-CSE-ConnectionGUID: S1KdU2cKTZ2qdpy4zzx9Zg==
X-CSE-MsgGUID: m78uAJ4ZRW2iHaIrN7eAVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="75140197"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jun 2024 06:53:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 06:53:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 06:53:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 06:53:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lxyHxmS1fqHff1cLBYxn+epO13UdNnzuZ+/ekqZ8Lhq7uEtPqwPnL5sKvn1AnCYmylfBB/05Z7O+3u8bnPxyzhQOrLpYuq9ssKso36o4Kwr/BsHpOvBgQUZNjB7rKzORFPJMYcgJ5BUSRvPQqAoZUoxPPkFFVRUWNLC3d/FBzoDACrV7xG5NPyxiXnuMRqlXBFN7JcleaUovu/K/+kAlTw4oBDybraUoKJm3MvDiS4EVfi+DBO2A5INiMmBPXibtEtPhCt5gJDmMRvJlqo2Pi7D3aT+QZkDAGAkeds+qguyE24SNquCrxTT2XYZ8kvacJO+L4Ie4SslkIYUslXZHVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YMi0HFcmySnKCqUyFT09Cw4zIayx15BmUi1jTSN/yDA=;
 b=hSKFvg9p+yK0dgKP0mS8YoeQHDPf/eB+YPC0zXGLCQcYQMiR8lf0xu+nuhJyPIYC1ZaCimUXMsyUCkwmb/kR8nbnC3kl4lWohEbNeVqG9JfsYEY+lgcOcoZkpIbt8Nztzpg4hEVuCQyWM/4KeuodIhUZq0aJ5d5Sa4ACKVKdW/E/asOK/9PaAVyQo1QgyPwa1f16ISpiEvH19GPMX/1ML/F+TfNSf0x5JJlV+jaql8Skv9QwIkkZmltYqqPB0EWEGnWJIN+PyfbVwfvMnKabTSA98ymgfyJPQXIyADRtzR88gDG5JECFZ6/l9ysfLXvYzmIxdUefiorRWM0yvsq0Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CH3PR11MB7203.namprd11.prod.outlook.com (2603:10b6:610:148::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Thu, 27 Jun
 2024 13:53:07 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.7698.032; Thu, 27 Jun 2024
 13:53:07 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: Re: [CI] drm/xe/guc: Remove spurious line feed in debug print
Thread-Topic: [CI] drm/xe/guc: Remove spurious line feed in debug print
Thread-Index: AQHayAU83xinEb2HGkejtw2Ih/H2gbHagNOAgAAL/gCAARXPgA==
Date: Thu, 27 Jun 2024 13:53:07 +0000
Message-ID: <d06de2f9329d59b92b8156f43b4374fe62d0e6c8.camel@intel.com>
References: <20240626201206.1433-1-michal.wajdeczko@intel.com>
 <bf81ea948d144186d471b653ffd5dd9a45b03d09.camel@intel.com>
 <4ae7c9a4-b0f0-46cd-b53f-3c19e1936b5d@intel.com>
In-Reply-To: <4ae7c9a4-b0f0-46cd-b53f-3c19e1936b5d@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CH3PR11MB7203:EE_
x-ms-office365-filtering-correlation-id: 0e2d526c-50e6-450d-92f1-08dc96b0794f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OE9LQS9MVkNjUTd1UUV4c2k4bVF5Z21qMjhPemZBNkhoY0U3eDdyc3dxMjdP?=
 =?utf-8?B?VFQwekdjLy8xcmJadHEzOTNUTHlCQk5rOW9aaUxIRjI3ZU1RS29YVU4vU3gy?=
 =?utf-8?B?NlJhNTkxNERycWY0R3haL3I3L0psdGM2Q2F2NzUwTGx5Vi84bkhRYUQ3K0cw?=
 =?utf-8?B?NUlRa29ZQ1lKZTRRdHVma2o3SHNrdHh1bTNRYkdNL2NOVHlDRDJUbS9XMGgr?=
 =?utf-8?B?NGhGM3lEWnIxTEtiNlFBUjVWcmNnSzFBeXJldlFKRWlpcEhMZDhRWDYxMlMz?=
 =?utf-8?B?RWhHTWp4RFJqOG9wUFcycUo0WktLZVhVeTRhZ0ZJUVRYSzVhZzFrL0RNR3Zn?=
 =?utf-8?B?SFQ0Nm9vMzZtRlZhWnFvdHFPSndNS0U0Tkd5SFErRVJTb2ZoMWs2NTdYdHMv?=
 =?utf-8?B?SDEwZUhUbUZVckR4bmhpRjVXSjg2OTNwSk1RTUNObzFwL1I3MkJCQXdOWXMz?=
 =?utf-8?B?VENjR1JhWCtYQXNPazZWTDdrWWMrRFdpYmZURjF5M0h4ODEzWkNpMDJyS2VI?=
 =?utf-8?B?bDkyOUs2R1l6Q283ZDJ0dUttQVFXMHRZZTJ0UURkaFhpZ1Zqb2VwZ1FoSVVN?=
 =?utf-8?B?OTNpbXR5SXhyd1ZMK2pwN2did1I0TENYbFVFa3BJdzNnVXZBZHA5WXA1WTV5?=
 =?utf-8?B?Q3NQaWNsY3VqQnhFWXZLdW5BOCtYZFIvRitpTGNIZWxoNGgxckd6YjdOWXp3?=
 =?utf-8?B?a3J5Z3ZXd3NFY1F6TzhrMHNnQWYySzFxUWZIZ2lIaUFHbHM3UEU1VlJTeE9w?=
 =?utf-8?B?d2FHWU5TUUNVb3ZNbFVBK3FvblJIYlZoUnoxcmdYMUt6ZWIzL0F4eENVU2tT?=
 =?utf-8?B?VGZMUFNOWXdCNEltckJvenZWb3ZvS1lqODFtbGlSUk1oLzZDZlh1am9uejlR?=
 =?utf-8?B?QmpRS2gxTXBTRmlRV0dHeStLK0tNMGhVaU5iYkEvZUVlaStTa3ZTTldtZzYz?=
 =?utf-8?B?R1ZMUlpmb0xURk9JVHhybnN0aXdMQUZIR2EzQmxrVFFuMmJYUGI0dTB1TDFG?=
 =?utf-8?B?T2hOai9rRDJ6cGU1R1NWVnRhVFZSby9sUjFjRnlRUjB5UjZqeUFJNGhzM1F0?=
 =?utf-8?B?SGxaeThHTmpRclZwT1I4TWtLZGVUZmF2OTJUdEtKdGhadkI4OW1idDVmUmtV?=
 =?utf-8?B?MTNpMW5OR3pkVjNFY1pFSjcwOUVLQmZWZGJGT0dqSHkrS3hpSXpreXdqeDRa?=
 =?utf-8?B?bHZqQ05oVHhuZ241SWFleXpFbHpWMEpQYVBtVFoyVks0T2F0c2FiZU5YM3gy?=
 =?utf-8?B?UWpBdXo4cGpjMGFtRWNQZFowZ2UyaW82ZXdENktsY0hXSUQ3dzZENGtSM0l3?=
 =?utf-8?B?eDZNcWh2R2t1bkxuV21mY1FDeklobXZzR0FORk9FcU1manZraUJ4QmRGWTRX?=
 =?utf-8?B?Slc2Y1U3QkR6TFdOTDhHN3Y2U0FDZ0xyVW9qbzFUNUVjM3prOUROeUFZdG1Y?=
 =?utf-8?B?VlkrbkN5VWxqeEhIeXJxVmZoU2ZxanI5SWZwSnJBcXZ1UHJ2UFVJVW1wWEh5?=
 =?utf-8?B?eUQ2VzUwNWpQcGIzbjk5Qmx5bk1ORnQ1andCQTJ3b20xdzEyWWpmRFhLREh5?=
 =?utf-8?B?Z3BTYkNjajN1cTY3dWNVcHhkZWlDdld5Mi85OWx6cng4K1pJSzRob3pDYnM5?=
 =?utf-8?B?M3VZZEtiVjd5Vkd4MnNrV3FYMW43Q2tkcGtaa0VzcFpSdmFlOFV3MWhURFBx?=
 =?utf-8?B?NEJRZ3VnUkUrd3NmYW51ekx1M3pMVUZqNk1CUEVPZ3QxUVZTZUpPWFU0UmtC?=
 =?utf-8?B?TVprUmdPQWZ1VGI3cjA4QUk1NE9ETVo2QWxvamJzS3pCSG1mNVpQcUJOQnFT?=
 =?utf-8?B?L2g2Mzd2cjNKZVVPZUM5QT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3VpOWpia0lReHVvcGhaQ1BLcThVT3RFMXh2K3VTUEdpZ0x5R3k5WWovR0Z0?=
 =?utf-8?B?ZUNTZ2JlOFFTc0JTeUdaZ3Q5UUlTQXZQOUdOZlZqckoxZElmZDR4OFE1SWZU?=
 =?utf-8?B?UXQ1aU1sV2VCVmI2dlRvUkdldkltb2kyZlowVVZscTFUN3dTY2FNc01weERJ?=
 =?utf-8?B?M3dYcHkzRE1VNyt2blNLcXlSYUpNd0Y2Z0I0SUhTSk5DMGp0Nm5lQTJPaFJP?=
 =?utf-8?B?U0hWS3RpVVBIQzJTSE4wRCsrNTFjT09UWDlsd1pjSnZEZE9GQ1lpNHNIc2VZ?=
 =?utf-8?B?RzlUdzZGdVZJM3hOcnVMa3FzWHRDelppRGdUM2RhN28wUDZFMUl2QXFncFlm?=
 =?utf-8?B?Sk5wN2I5eUxtYzZjbkxxYWVZaDZCT1U0N2x4MXFmdThoUTljdkYvamdNYnZI?=
 =?utf-8?B?MjFUT1JnUmI5TitnZTJEZjZ0dys3VU9sd3poQk55VHhKZFdYNUxWd0liazls?=
 =?utf-8?B?OHQvL2lTV0dBbkVCUG4wRnFQMytaZXA4Vkhqa3grZTBaZUc0b3p2cG83NnVT?=
 =?utf-8?B?M2xsdEdZdE5kU1hXejRtSyt6Sm9ETTVhVUMrbkxjbFJVcjBScmlGZStUYmkv?=
 =?utf-8?B?WE5uVTBtR091a0Fwc01SUGRsaVlnUGd2T3FNNGFxZFYyNlF3ZmVHMDRPeUFl?=
 =?utf-8?B?N2FtUW1sMWFsQ2V6ZTk5WFMzWG53V2g2S29pZ25yWmdhbXllYmc3K3RTaHc4?=
 =?utf-8?B?L3hDMC9lY3pWUmZtYnB0WGxXeDZvRFVFQ3hHNzdjOWcrQkZvL3NEclJ4Tzl1?=
 =?utf-8?B?RE9yQUlKUGloZUlDNGVQWUFoMFNJeUNscXR1VnA4SC9sSktPSDdNYUpSWTBE?=
 =?utf-8?B?ZlNmVzByZ2VlMUhWa2RtSmlwajI2cGpXT3A3NGExMkovcDRhaE04UzRGMkVn?=
 =?utf-8?B?aWhOUTJxVkxUZmM3OThBNjhTSXZiaGZBb21NUkFueE42WlRJRzMwZjNHR3h6?=
 =?utf-8?B?V210cFo4RTV1MTdZOXc3V3JvT2xuNFVtZ25vaHRtaEE4WFM3YkdMVFFkTjNU?=
 =?utf-8?B?bGN3RjVpK0EwazllS0lzK0FCNHZYWmV4Y3ZyMFF1YitaS0IrNmtINXBDcXg2?=
 =?utf-8?B?NmhNRlE2TEQ5eGcvSFdrWGROTzl5RXppMUQ1WklkYU5pVE1ySnlaQTkwZytS?=
 =?utf-8?B?M1NxZW1lYnZua0FYYUV5U2hmNnBYbHFHVzRNaWxiTWM5aVNQV1R3L3UxTEtX?=
 =?utf-8?B?VWFoVVNMbTZLSGlHdEp3RjhWcFZ3WkRwZVgvSDlERlpRK2lxU08vOVAwdWE3?=
 =?utf-8?B?WlUzMEtZYmFGZmNyUkdCUUd3R3JXMm1qMFdYd3V2WTVvQU8zZ0RUakRGSHpK?=
 =?utf-8?B?UDAwWkE0VWdsUWNYTkJnQUxkdDdpSzh6bjNRMlRBd0tGUnJZMHZGSVppNVla?=
 =?utf-8?B?cTZ1SGpXLzc1aVQzaWtoMG5vUXJvM1dHdFgxeVF5U3dCelUyNzV4L1k5ZzQx?=
 =?utf-8?B?cWNKWjZuRFVVbWJHKzgySmFpWGNpSEsvbGFCRmpoamFtNGllMnprYWJxdTdC?=
 =?utf-8?B?UjlqenFIOWFyYUhOOGN0WmlacEM5SFZnRlYwNlZsWTExa1JESjUrcjlyeEwy?=
 =?utf-8?B?Ti9XSzZzZTl0cFhaTEZvU20vTUhudVZCak1vSUdjUFBFOUczTHNRZ1l6eHFv?=
 =?utf-8?B?YUNCYitJUjYrdGUrTnZIK0hYZEQyQS81Wit2VFR6aVVacmVVcGtuZU5NYW5Y?=
 =?utf-8?B?Z2VabVp5STNjVmczc0YyZ2tiTVFRdi9iUFEyYkdDMFJsN3hFNUE5ZFpYelRY?=
 =?utf-8?B?WE4vNlgvQ2dYQmQxTVkvMUdpTTJRanQvZ2grWkNyMVFFT3FmL25NYXZ6US9B?=
 =?utf-8?B?Smo4OTZwWG5GZXM4d0gyREpranFDMGd4bUNUVjJ6TFBUQzhROFhwT3JHL1dk?=
 =?utf-8?B?SmJiVzh3SWtmK1hSTFJsM0tPVDgyZ2o3eUxaVmtDRHpYdmw2YmIxbGN4ZGVQ?=
 =?utf-8?B?bUxDMmd5ZkVHRHVVVGNRRHkyMmN4eFVsTVRiZ0lBZzd5SXRHK01XRWxFcnFJ?=
 =?utf-8?B?Tk9jakJYSkk3aS9Db1BPbW1SRzBFbS9jMVpwbWZsZVJGZkhVa0psVHE0R1ZQ?=
 =?utf-8?B?SG5wOTBoaWVqRVJyVGFOenhERmxhcytrQ1BNL0hzbXNuY1g1V1c0Q2h2OFdp?=
 =?utf-8?B?bE5QQklqT1VjbjljSEFCSmRSSWdXL2tWZko3TG45cy9IWWhrOWkwSXZHQVU4?=
 =?utf-8?B?dGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <131105D5D1B9394B8D8E4B1981E99AFB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e2d526c-50e6-450d-92f1-08dc96b0794f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2024 13:53:07.3095 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JNtfo9Q1lj4C7pLlp6ZNT8uQf1He0RRtnR3Sif/6Sdh7+t9Wfxv/8GHEx4yMfLX4rwpLSRBZT4u11kpWY+ViQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7203
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

T24gV2VkLCAyMDI0LTA2LTI2IGF0IDIzOjE4ICswMjAwLCBNaWNoYWwgV2FqZGVjemtvIHdyb3Rl
Og0KPiANCj4gT24gMjYuMDYuMjAyNCAyMjozNSwgU291emEsIEpvc2Ugd3JvdGU6DQo+ID4gT24g
V2VkLCAyMDI0LTA2LTI2IGF0IDIyOjEyICswMjAwLCBNaWNoYWwgV2FqZGVjemtvIHdyb3RlOg0K
PiA+ID4gRnJvbTogSm9obiBIYXJyaXNvbiA8Sm9obi5DLkhhcnJpc29uQEludGVsLmNvbT4NCj4g
PiA+IA0KPiA+ID4gSW5jbHVkaW5nIGxpbmUgZmVlZHMgYXQgdGhlIHN0YXJ0IG9mIGEgZGVidWcg
cHJpbnQgbWVzc2VzIHVwIHRoZQ0KPiA+ID4gb3V0cHV0IHdoZW4gc2VudCB0byBkbWVzZy4gVGhl
IGJyZWFrIGFjdHVhbGx5IGFwcGVhcnMgYmV0d2VlbiBhbGwgdGhlDQo+ID4gPiB1c2VmdSBwcmVm
aXggaW5mb3JtYXRpb24gYW5kIHRoZSBhY3R1YWwgc3RyaW5nIGJlaW5nIHByaW50ZWQuIEluIHRo
aXMNCj4gPiA+IGNhc2UsIGVhY2ggYmxvY2sgb2YgZGF0YSBoYXMgYSB2ZXJ5IGNsZWFyIHN0YXJ0
IGxpbmUgYW5kIGFuIGV4dHJhDQo+ID4gPiBkZWxpbWV0ZXIgaXMgcmVhbGx5IG5vdCBuZWNlc3Nh
cnkuIFNvIGRvbid0IGRvIGl0Lg0KPiA+IA0KPiA+IEkgZ3Vlc3MgdGhlIGluZGVudGlvbiB3YXMg
dG8gaGF2ZSBvbmUgYmxhbmsgbGlrZSBiZXR3ZWVuIGd1Y19jdGJfc25hcHNob3RfcHJpbnQoKSAn
Y21kW1hdJyBsaW5lcyBhbmQgJ0cySCBDVEIgKGFsbCBzaXplcyBpbiBEVyk6Jy4NCj4gPiBJIGFn
cmVlIHdpdGggdGhlIGNoYW5nZSBpZiB5b3UgYWRkIG9uZSBsaW5lIGJyZWFrZXIgaW4gdGhlIGVu
ZCBvZiBndWNfY3RiX3NuYXBzaG90X3ByaW50KCkuDQo+IA0KPiBidXQgJ2NtZFtYWFhdJyBsaW5l
cyBhbHJlYWR5IGhhdmUgYWRkaXRpb25hbCBpbmRlbnQgY29tcGFyZWQgdG8gJ0gyR3xHMkgNCj4g
Q1RCJyBoZWFkZXJzIHNvIElNTyB0aGlzIGV4dHJhIHNlcGFyYXRpb24gbGluZSBzZWVtcyB1bm5l
Y2Vzc2FyeToNCj4gDQo+IFsgXSB4ZSAwMDAwOjRkOjAwLjE6IFtkcm1dICpFUlJPUiogR1QwOiBU
TEIgaW52YWxpZGF0aW9uIHRpbWUnZCBvdXQsDQo+IHNlcW5vPTI3LCByZWN2PTI2DQo+IFsgXSB4
ZSAwMDAwOjRkOjAwLjE6IFtkcm1dICpFUlJPUiogR1QwOiBIMkcgQ1RCIChhbGwgc2l6ZXMgaW4g
RFcpOg0KPiBbIF0geGUgMDAwMDo0ZDowMC4xOiBbZHJtXSAqRVJST1IqIEdUMDogICAgICBzaXpl
OiAxMDI0DQo+IFsgXSB4ZSAwMDAwOjRkOjAwLjE6IFtkcm1dICpFUlJPUiogR1QwOiAgICAgIHJl
c3Zfc3BhY2U6IDANCj4gWyBdIHhlIDAwMDA6NGQ6MDAuMTogW2RybV0gKkVSUk9SKiBHVDA6ICAg
ICAgaGVhZDogMA0KPiBbIF0geGUgMDAwMDo0ZDowMC4xOiBbZHJtXSAqRVJST1IqIEdUMDogICAg
ICB0YWlsOiA1NzINCj4gWyBdIHhlIDAwMDA6NGQ6MDAuMTogW2RybV0gKkVSUk9SKiBHVDA6ICAg
ICAgc3BhY2U6IDQ1MQ0KPiBbIF0geGUgMDAwMDo0ZDowMC4xOiBbZHJtXSAqRVJST1IqIEdUMDog
ICAgICBicm9rZW46IDANCj4gWyBdIHhlIDAwMDA6NGQ6MDAuMTogW2RybV0gKkVSUk9SKiBHVDA6
ICAgICAgaGVhZCAobWVtb3J5KTogNTY4DQo+IFsgXSB4ZSAwMDAwOjRkOjAwLjE6IFtkcm1dICpF
UlJPUiogR1QwOiAgICAgIHRhaWwgKG1lbW9yeSk6IDU3Mg0KPiBbIF0geGUgMDAwMDo0ZDowMC4x
OiBbZHJtXSAqRVJST1IqIEdUMDogICAgICBzdGF0dXMgKG1lbW9yeSk6IDB4MA0KPiBbIF0geGUg
MDAwMDo0ZDowMC4xOiBbZHJtXSAqRVJST1IqIEdUMDogICAgICBjbWRbNTY4XTogMHg4MDY3MDAw
Mw0KPiBbIF0geGUgMDAwMDo0ZDowMC4xOiBbZHJtXSAqRVJST1IqIEdUMDogICAgICBjbWRbNTY5
XTogMHgyMDAwNzAwMA0KPiBbIF0geGUgMDAwMDo0ZDowMC4xOiBbZHJtXSAqRVJST1IqIEdUMDog
ICAgICBjbWRbNTcwXTogMHgwMDAwMDAxYg0KPiBbIF0geGUgMDAwMDo0ZDowMC4xOiBbZHJtXSAq
RVJST1IqIEdUMDogICAgICBjbWRbNTcxXTogMHg4MDAwMDAwMw0KPiBbIF0geGUgMDAwMDo0ZDow
MC4xOiBbZHJtXSAqRVJST1IqIEdUMDogRzJIIENUQiAoYWxsIHNpemVzIGluIERXKToNCj4gWyBd
IHhlIDAwMDA6NGQ6MDAuMTogW2RybV0gKkVSUk9SKiBHVDA6ICAgICAgc2l6ZTogNDA5Ng0KPiBb
IF0geGUgMDAwMDo0ZDowMC4xOiBbZHJtXSAqRVJST1IqIEdUMDogICAgICByZXN2X3NwYWNlOiAx
MDI0DQo+IFsgXSB4ZSAwMDAwOjRkOjAwLjE6IFtkcm1dICpFUlJPUiogR1QwOiAgICAgIGhlYWQ6
IDIxMA0KPiBbIF0geGUgMDAwMDo0ZDowMC4xOiBbZHJtXSAqRVJST1IqIEdUMDogICAgICB0YWls
OiAwDQo+IFsgXSB4ZSAwMDAwOjRkOjAwLjE6IFtkcm1dICpFUlJPUiogR1QwOiAgICAgIHNwYWNl
OiAzMDY4DQo+IFsgXSB4ZSAwMDAwOjRkOjAwLjE6IFtkcm1dICpFUlJPUiogR1QwOiAgICAgIGJy
b2tlbjogMA0KPiBbIF0geGUgMDAwMDo0ZDowMC4xOiBbZHJtXSAqRVJST1IqIEdUMDogICAgICBo
ZWFkIChtZW1vcnkpOiAyMTANCj4gWyBdIHhlIDAwMDA6NGQ6MDAuMTogW2RybV0gKkVSUk9SKiBH
VDA6ICAgICAgdGFpbCAobWVtb3J5KTogMjEwDQo+IFsgXSB4ZSAwMDAwOjRkOjAwLjE6IFtkcm1d
ICpFUlJPUiogR1QwOiAgICAgIHN0YXR1cyAobWVtb3J5KTogMHgwDQo+IFsgXSB4ZSAwMDAwOjRk
OjAwLjE6IFtkcm1dICpFUlJPUiogR1QwOiAgICAgIGcyaCBvdXRzdGFuZGluZzogMQ0KPiANCj4g
YW5kIElNTyBwcmludGluZyBlbXB0eSBsaW5lcyBpcyBqdXN0IGEgd2FzdGUgb2YgcGFwZXIgOykN
Cg0KVGhpcyBzYW1lIGZ1bmN0aW9uIGlzIGNhbGxlZCBkdXJpbmcgZ3B1IGhhbmcgY2FwdHVyZShk
ZXZjb3JlZHVtcCkgYW5kIHRoZSBvdXRwdXQgb2YgdGhhdCBmaWxlIGhhcyBuZXcgbGluZXMgYmV0
d2VlbiBzZWN0aW9ucyBmb3IgYmV0dGVyIHJlYWRpbmcuDQpUaGlzIGEgb2xkIHNhbXBsZSB0aGF0
IEkgaGFkIGFyb3VuZDoNCg0KDQoNCioqKiogWGUgRGV2aWNlIENvcmVkdW1wICoqKioNCmtlcm5l
bDogNi45LjAtcmM2LXplaC14ZSsNCm1vZHVsZTogeGUNClNuYXBzaG90IHRpbWU6IDE3MTU4Nzc0
MjAuNjQ3MjExMzc3DQpVcHRpbWU6IDcwNjg0LjYwNTk4MjY2NQ0KUENJIElEOiAweDlhNDkNClBD
SSByZXZpc2lvbjogMHgwMQ0KR1QgaWQ6IDANCglUeXBlOiBtYWluDQoJSVAgdmVyOiAwLjAuMA0K
CUNTIHJlZmVyZW5jZSBjbG9jazogMTkyMDAwMDANCg0KKioqKiBHdUMgQ1QgKioqKg0KSDJHIENU
QiAoYWxsIHNpemVzIGluIERXKToNCglzaXplOiAxMDI0DQoJcmVzdl9zcGFjZTogMA0KCWhlYWQ6
IDk3OA0KCXRhaWw6IDU5OQ0KCXNwYWNlOiAzNzgNCglicm9rZW46IDANCgloZWFkIChtZW1vcnkp
OiA1OTkNCgl0YWlsIChtZW1vcnkpOiA1OTkNCglzdGF0dXMgKG1lbW9yeSk6IDB4MA0KDQpHMkgg
Q1RCIChhbGwgc2l6ZXMgaW4gRFcpOg0KCXNpemU6IDQwOTYNCglyZXN2X3NwYWNlOiAxMDI0DQoJ
aGVhZDogNjI2DQoJdGFpbDogMA0KCXNwYWNlOiAzMDcxDQoJYnJva2VuOiAwDQoJaGVhZCAobWVt
b3J5KTogNjI2DQoJdGFpbCAobWVtb3J5KTogNjI2DQoJc3RhdHVzIChtZW1vcnkpOiAweDANCgln
Mmggb3V0c3RhbmRpbmc6IDANCg0KR3VDIElEOiA5DQoJTmFtZTogcmNzOQ0KCUNsYXNzOiAwDQoJ
TG9naWNhbCBtYXNrOiAweDENCglXaWR0aDogMQ0KCVJlZjogNA0KCVRpbWVvdXQ6IDAgKG1zKQ0K
CVRpbWVzbGljZTogMTAwMCAodXMpDQoJUHJlZW1wdCB0aW1lb3V0OiA2NDAwMDAgKHVzKQ0KCUhX
IENvbnRleHQgRGVzYzogMHgwMTQ4MDAwMA0KCUxSQyBIZWFkOiAobWVtb3J5KSAyODANCglMUkMg
VGFpbDogKGludGVybmFsKSA1NTIsIChtZW1vcnkpIDU1Mg0KCVN0YXJ0IHNlcW5vOiAobWVtb3J5
KSAtMTI1DQoJU2Vxbm86IChtZW1vcnkpIC0xMjYNCglbSFdTUF0ubGVuZ3RoOiAweDEwMDANCg0K
Li4uLg0KDQoNCj4gDQo+ID4gDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEpvaG4gSGFy
cmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20+DQo+ID4gPiBSZXZpZXdlZC1ieTogTWlj
aGFsIFdhamRlY3prbyA8bWljaGFsLndhamRlY3prb0BpbnRlbC5jb20+DQo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBNaWNoYWwgV2FqZGVjemtvIDxtaWNoYWwud2FqZGVjemtvQGludGVsLmNvbT4NCj4g
PiA+IC0tLQ0KPiA+ID4gY2hlcnJ5LXBpY2tlZCBmcm9tIFsxXQ0KPiA+ID4gDQo+ID4gPiBbMV0g
aHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzU5ODAyNC8/c2VyaWVzPTEz
NDY5NSZyZXY9Mg0KPiA+ID4gLS0tDQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19j
dC5jIHwgMiArLQ0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Y19jdC5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jDQo+ID4gPiBpbmRleCA4
NzNkMWJjYmVkZDcuLjExM2U2MzQ4YzZhYyAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndWNfY3QuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1
Y19jdC5jDQo+ID4gPiBAQCAtMTQ4OSw3ICsxNDg5LDcgQEAgdm9pZCB4ZV9ndWNfY3Rfc25hcHNo
b3RfcHJpbnQoc3RydWN0IHhlX2d1Y19jdF9zbmFwc2hvdCAqc25hcHNob3QsDQo+ID4gPiAgCQlk
cm1fcHV0cyhwLCAiSDJHIENUQiAoYWxsIHNpemVzIGluIERXKTpcbiIpOw0KPiA+ID4gIAkJZ3Vj
X2N0Yl9zbmFwc2hvdF9wcmludCgmc25hcHNob3QtPmgyZywgcCk7DQo+ID4gPiAgDQo+ID4gPiAt
CQlkcm1fcHV0cyhwLCAiXG5HMkggQ1RCIChhbGwgc2l6ZXMgaW4gRFcpOlxuIik7DQo+ID4gPiAr
CQlkcm1fcHV0cyhwLCAiRzJIIENUQiAoYWxsIHNpemVzIGluIERXKTpcbiIpOw0KPiA+ID4gIAkJ
Z3VjX2N0Yl9zbmFwc2hvdF9wcmludCgmc25hcHNob3QtPmcyaCwgcCk7DQo+ID4gPiAgDQo+ID4g
PiAgCQlkcm1fcHJpbnRmKHAsICJcdGcyaCBvdXRzdGFuZGluZzogJWRcbiIsDQo+ID4gDQoNCg==
