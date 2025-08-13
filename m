Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F28BC87FCF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 11:15:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6EE10E1C9;
	Wed, 13 Aug 2025 11:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aprjodwe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37BE10E1C9
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 11:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755083719; x=1786619719;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ErtLRzyu2APdk/tQU11EtAwgZeq7oVRdZe4mDgz7mxQ=;
 b=AprjodweAvzrhRKHCzL3YF02Ez2XJlse4X5TV4KdOMHmdyr4SWNiAUpF
 oJ1KfItfPrV1DwNnZgLDiML+rK9rAO9OKsfeKOc1yWeoVGnyLyYL50Scx
 4VlWq+msOBnly5VQpPODllU0ry2GZ464od5ShNI8WxswcaQ8WekXt/7XN
 BmhUXBCMnUORiCh8hEzHGNn6qsnosMf/4x5YNOIu+o6INrHl6g+qxZAqh
 KDkKxkhvkJzHBPHWueepZDZCsMdM4ORdNzZoF0GA5Fy9oyvPPx8HBxOTp
 vqouuI5ZJt+FcL8JFkwlTUHTcWyqufPKni5xFkullKrz5rphLtDYp/E9h w==;
X-CSE-ConnectionGUID: SwqigohFTnyGlyU7sWvBiw==
X-CSE-MsgGUID: +onbWYWSSGmUFST+dgZxIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="59995478"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="59995478"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 04:15:18 -0700
X-CSE-ConnectionGUID: iSyH9DE/QKOzp56hJU5njA==
X-CSE-MsgGUID: GixgUa7XTzW4FzZ5EzfnsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="166433046"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 04:15:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 04:15:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 04:15:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.86)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 13 Aug 2025 04:15:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VwZRQELzoGPFIylwTWXRAJYDEI50qfVNz2iFsVEb+6j/PoPBRpLgu607ufTChgTCL+U09m0cn8j7Vqu2c+D4R3nj1TxTZDYHl6k1TZAGjz0xW8Zlxcr8uMPMCmrW40wczxbISTN9MATV21NoXDC1YtuooMJAwiCxt8H453/BOwubnyyzAmVah1flIf+m6Gcx/GyX2eW9Ap1x2Zb1MR+9fUh/eVMe1vB0Ri1SCeg/lK9aBVJypcF/ia01iNabOu6XIdDq1AjIsznOtV2x2bjCWTPfzW7ZzZaCoy4JiJIW7iFKbZ4l+TRny7XOWyFxNcqtg61NLuKaE5VD72H3mnPN1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ErtLRzyu2APdk/tQU11EtAwgZeq7oVRdZe4mDgz7mxQ=;
 b=Bv0dhI2/jTQsvvPjsXVWB0/Bb6VfQ1H/wG5AAlRbAh0yLjfERn4v5RLhd4+LACpLl9ZhCfLuEW+JKU6GyzRYeP+uJ8CmEqjcVBeUNBQL93M+gk61LGnAMc5PgQGlNCexa97n/xQJFuEIqshf9F/Gw7QSuo6bc2ydf5IVTKg6A3RrhJh1bv8fK7hFGgMzfSkCkzAEDTkCh2AdV1oC9k3ehTb9ayXJkv7FGOg3/kYAyLdCkFvl+G6q4lFJgqNBN4s8ScMTdMUFs65KZfdJOMt2BVaUAW1FyYauuxJ5vn/cnB/Cb9T5U9scNgCUeyG4BXzOlCckFvZTYvHE+CkYIpgc2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by MW5PR11MB5788.namprd11.prod.outlook.com (2603:10b6:303:198::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Wed, 13 Aug
 2025 11:15:15 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720%6]) with mapi id 15.20.9009.018; Wed, 13 Aug 2025
 11:15:15 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Kumar, Prashanth" <prashanth.kumar@intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>
Subject: RE: [PATCH v3 05/13] drm/xe/psmi: Add Wa_16023683509
Thread-Topic: [PATCH v3 05/13] drm/xe/psmi: Add Wa_16023683509
Thread-Index: AQHcCIofBUehHFVXjkype71GZ3VuHrRgdZBQ
Date: Wed, 13 Aug 2025 11:15:15 +0000
Message-ID: <IA1PR11MB626656D86722837915DF332BE22AA@IA1PR11MB6266.namprd11.prod.outlook.com>
References: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
 <20250808-psmi-v3-5-a111e9f1e4b7@intel.com>
In-Reply-To: <20250808-psmi-v3-5-a111e9f1e4b7@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6266:EE_|MW5PR11MB5788:EE_
x-ms-office365-filtering-correlation-id: e3940eb3-8489-460e-cba4-08ddda5aad98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?SVZPMGhnbnlRZDhzNUpMaHRtWThpeWp1K0labTNXakRGWkh3TmtYM1hTS2Ra?=
 =?utf-8?B?VTNEUUNxV2RRNVJCcjRad2xoUzlCVWw4dTB3SGlMOFg4dGFpR0ZqOFhKLzVY?=
 =?utf-8?B?ZU1YLytSWFRxNXFhc3o4RnhiWXJoM1hvN3JRTW8vMUpkRXAxeGR1YlFXWSti?=
 =?utf-8?B?UndMSmtZUW1QaFVzVFJUNWVheWhnQlhseUF5UENsQUtvdVg1WDdtSExIcGlZ?=
 =?utf-8?B?bU84R3NkSTFTNHoyYVVrT3hyMUN2ZkhhdVNjQmtsMXVxZVpVQ2JiWjM5SXlZ?=
 =?utf-8?B?M05DRzBjZjBJamwyRFVub01QYkQvdnBaaFh3OE96cjNRVFJPQ0RuMGJ4MTBr?=
 =?utf-8?B?T25SZC9ydWdLTFRCdUhCMEMyS0hQYktxSDRya1E5MStUV3R4Mi9ob3lCN1Qx?=
 =?utf-8?B?NzBUanNkK21pNC9UTHBYbk16bENSeTNieUZmQ0JEY3lURWMvWG82MzF6RWZq?=
 =?utf-8?B?b0prL2RKM3NEeENDekpMRjRPQmRxWXFqSFk3czdPbnk4K3VMRHQyTlZna0pZ?=
 =?utf-8?B?L1VHa2NJMWQ3b1orWFhONHVSWFFIeisrYzRua3Z0VmJKa3JnVi8ya1NvcDZF?=
 =?utf-8?B?NFNGdUcxSWwyRERJLy9nZVpXTVZxa0tKekFTZ0NDNzYyVjFzRmFKMU9UTVRR?=
 =?utf-8?B?VzZ2NjdZTllGbGI1WE1vTWw4ejdwUHJVc2VCYjdyUnBHTzIrbDAwTEhheHAx?=
 =?utf-8?B?MDVBVUFZY3hlVGVFcENVZlVkMHc3c25raUtwZlhPYkhYMDNWNkU5TXVvT3Iv?=
 =?utf-8?B?dHp6MWMrMTlUcW1UV0lmNzdRR041V1FXZ2hhSTBOZHFPdUdiQWNKUU94ODZQ?=
 =?utf-8?B?cXFMRGpUUTlJNDNGTVY0bk00ZTBpSjNwVnVGazRFRCs3eFZNZkhGZUp0OGFw?=
 =?utf-8?B?VnRLajRaS2hnZVMxQlhZMmJYdEhhckUxcU9YOXJobDQ3TVpKM3NPNWNMZWta?=
 =?utf-8?B?ZnM5Q3RTYUVLNFZ5SGtESmhBYXcyQTY5N2xYeXVWaXdTMkFhMmo1RTBBT1Fx?=
 =?utf-8?B?b3BNRWpla28vUlJqSUhuaFB6L0VJc3l4cFlWYXpjY3BRTUxqV1pIaUlWWnlo?=
 =?utf-8?B?N242VFhZR1RwT05mWjBRNmRQeVBhNmk2Q3dnSG1MeUNWRG5oSEczNUs0NkJr?=
 =?utf-8?B?YkZkMjQzczEwQzRyZG9VSFp1aWFFMEVyRGJKSW51RG44WUpRMWhTaG1tN1ZN?=
 =?utf-8?B?Mnk5L2YweWx4ZmtsdzBaR2pKSWV0UkVITHdZbGN4YlFwNFh4U0g5bXpwd29S?=
 =?utf-8?B?UXl1TnJ2U0huTXVQajFKd282N2J5M1JTOGJpbW9DNVdqZjlXR0ordFZRbmlY?=
 =?utf-8?B?QzE1Z0RHaElxNmpOQUlIUUpOYXNxZWd0dGZvMmVnQmZJalZLTXVpREcveVZS?=
 =?utf-8?B?UDlmc0prSXU1aUJQRTNiZHc0cTU4S3dTcHNqczNNVC9tQ3AwejMyQmxVR1I2?=
 =?utf-8?B?Rm80dTNwOWI2bytQU0d3ZFBVMml6bW5FWVA2L3BIbTBuamVRdk9JZGZIOWVG?=
 =?utf-8?B?ODZQMEdOWlFER2lLa0o1d1IxaFZUNlJ2RFZqeTNtWUYwWTQvVFpDWFBYbFFi?=
 =?utf-8?B?TFVUbWhQc0R5c0pqYkw4UExlN24yTHRUWEIvbW8vdmhTRFFYZ1BiS2NwUmhZ?=
 =?utf-8?B?NmxqaEwyREhHbjliUUlpZ2p0UGJTdHdTU1hBeGNqMVgzQ3NEeEs0MEJLbE9D?=
 =?utf-8?B?TXdxRGNkZEloVHc3YnZqb3NMd2ZLQkc2QWlHcE1Za0xwWUw2Tzgwb3lRRmRy?=
 =?utf-8?B?WGt6L09CNkpOcUZpei9Ed3FhWHJ2WG1sTk5VTkh6U3QxSVVNQ21ZUmVKQzNJ?=
 =?utf-8?B?QXlKVUZsUUVhT0xCS0ZzT0liTG5rUllCUkpaeGZtancxNzF2RG8zUXNYaSt4?=
 =?utf-8?B?Ni9JWVJibnVUMTdwZUJKQTBBeWtRbFc0eTdlZ3pjZkJqWmc1ek1YN1k5Tmdh?=
 =?utf-8?B?Y0ptSENzWFp1SVlSdGlNeG13SEhQQ1NDT2NWaDNLcllMVzBRakJSR0NzVmsr?=
 =?utf-8?Q?tZ5+HrB6YeekqQc5lM6DlVYrsoNUIw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YXhmOURaaDhhU3ZtQTE2QnQzMUZLMTNuRFh5cWZaazE0cWRZbVViUjVtSnZ2?=
 =?utf-8?B?Q1pyc3lUd2RQOWYvTFNEclNoVUk0bVk2SWQrVlB3ZU5zRVRhTjdaaGVwSFdx?=
 =?utf-8?B?eEtBdFhwU1ArTUtISkZlZ3ZLdVppL09CNWJJWUE4TDVCeVhQYjFmTmpWTXBj?=
 =?utf-8?B?V2tPU0lkanhJMWs3K3Azc0crTHc0TGhTaklPY0xoOTFNa3RTNFdBOVBSZm44?=
 =?utf-8?B?NnRYSmNxdEFrWFRONjliV3E1Ymo1TTR6Znk2cmVHeTQxYkFSZmJ1V0JLQlly?=
 =?utf-8?B?QzdKMktVKys0bHBtMmpIeTdDdFgrRy8wS1Y3ck5ka1FHeXhiZG5wYUx6bktN?=
 =?utf-8?B?dW5QK1hRVFVTUEJkSnhqYUxJdjVCajZuRWRLcHVETzgvSVkzMXFrWXh0cTM1?=
 =?utf-8?B?WGxjVklPN3VyVXB2MzUzMzNZRlVGYTRjWlpPVGNrcndNMjlXc0V4VW5qZFpE?=
 =?utf-8?B?dStObWh0LzBxdDBGVkU1c0ZnNFRtL3hsZTlodW9CTkhHWEMwZVN1VHRNQlVL?=
 =?utf-8?B?WUx2bEJ5Z0p3REcwMzRtaGRFSlU3ODNONTBiYVRIdnJaWW5IVVlhU2hKVFZR?=
 =?utf-8?B?aVhPcGlqczJ3SlJOZFZKUmxCZjNHaEhwSGlDUi9RNVE5dndKV212ZTV3SHJt?=
 =?utf-8?B?cGNtdC9yVkdja1hQd1VEYWY1Qm1wNjJ3OFNqcitUc1l6MVNrcjViOTZwZWV4?=
 =?utf-8?B?UnRPc043VFdPQ3M0OEJFN3MwZVVkcHB3NlVHUTVYZWxKdDlXNHZLdXl5ZDhS?=
 =?utf-8?B?a2dOWDBHanVhNVh2Ni9hZHVrSjR4NnlvNWpTcDhPUmthN0NOR2c1eE05bklk?=
 =?utf-8?B?ZU43VEo4Yld6R3A3SGlvWFJJREdhRFBmaFpvckM3ckdYUjk5K29OSzVPVFNY?=
 =?utf-8?B?R05nR2VOY25udWxxSGlZZ1d3YWNPV1pGbmRCZm5wSjh6ZDlUVkFwd3VPaXlD?=
 =?utf-8?B?RmVBZElGNUgrYlFYVHBTajVEbklwdHNWbkRPSnFzU0RpdWtDOC9pMUVGOTdE?=
 =?utf-8?B?L3JrNkFPMUs4RnBGUFhqeEFybVZNeDIvRmpVWkUyd1FOSkZJdXk0d1pKd01E?=
 =?utf-8?B?eE9MMGFWSGk4MDlGV2V5UnArZHZKZWRwTHVQSUxNMVlSVlBVdWZmUUxqR2kx?=
 =?utf-8?B?bjF1dS8zMm5PY2lNc0k1YjlQWDQybXBnV3B3NlJjMzQwN1dQcDJLZkMzQVRX?=
 =?utf-8?B?MDR0SzhTWEsxb3pES3ZFOUIvUVFwQ2tIcFJFOHZCdEFGUXFnNEZ6TUVodG9M?=
 =?utf-8?B?RDZVL1BsT3BLbDNYRFFQVGp4bjEzZHZkVU5xeWRTT082Z0RuSi94eHVEVTNL?=
 =?utf-8?B?OHFIUCtIZXVOaFpvUWtQUmpFTnJ4SEJxdVpxcWU2TWNuSTFvcWtGTEljSlYr?=
 =?utf-8?B?aHp3Y0JHYWV6eVBoZm1BTnluTWdBWTQ1Zi9pQ21Cb1BUdmtOSk9TSFNUL1ha?=
 =?utf-8?B?SGdLM0RVMXY4UHdsMGRmYzA4Q2xzb3dGV0JpR3VNc1lrb0NBN0JYUS8wZjNU?=
 =?utf-8?B?Z2ljVzdtUkJlMzZGR2lua0tVK1QyVEZKVWdDa0tDWGZDemViaUJqbmtjSitP?=
 =?utf-8?B?MnRVTytpeFJFRG50cllGVnVqLzVwTFh0clRQTFVoMzFvc2k4aHFLbVhsMkp6?=
 =?utf-8?B?ejQzUERxN3dFTmgrcytvMlp6dDVkQlhXN0lmbjB5OWUxK3N3SnRXVWZqZkJT?=
 =?utf-8?B?NVcxczYycU9NbU9ZVzVvaUpncnFKQXBKNXlzSVF3SmlXenF1Y3BxTHdsQnJu?=
 =?utf-8?B?Ym1TazlhZ3JIK1hLeVVRaWZWczhSSlBrT1BzOUVQSXdTRng5TmhCZFVqNWh3?=
 =?utf-8?B?b0Fyd2p4dVNWbWt3bUJOUkZZV0d4dy90K0NQNmVuREpCRWVoaWx1WGp5S3RJ?=
 =?utf-8?B?bGJpMk1hZ28wSWh2cy9LQTlTNUdkK0prRmNXR1pwMWN0SjR6aGNUcGNFa0Jy?=
 =?utf-8?B?WXdaNlJsMWRxSnU5SEFPeG8raUY4Z3Jzc0tRVW9WTFdDRFh6MWZrSE1QZUx1?=
 =?utf-8?B?OFhaNXpvLzNuTkhqdklCMHhvVEVqQXJyZ0RxU0RyRTJMNTdpS0Z6ZmdWcjFz?=
 =?utf-8?B?WFlmdStwQVY5dlhCZWd3ZWN1bzNYeFRSdVZweElKVUpzZ1JsQUpTS3NJbnQ1?=
 =?utf-8?B?U2VsUWQzSXI3Mlp2aCtyQ1FGcHBtWnRielg4Vk01NHR4RVRhRHgwVmJKb2w5?=
 =?utf-8?B?WVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3940eb3-8489-460e-cba4-08ddda5aad98
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2025 11:15:15.0774 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w3egocCimkbbKRElrQpnIPReeAGh6xMuRmD3QpkmsNox8AYRTubmf29bh7IfWwT0bFGL21onDOP8iR3sZuJ9/AyAAfc4BHRAxJSnP6O2n3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5788
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGUgTWFyY2hpLCBMdWNh
cyA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiBTZW50OiBGcmlkYXksIEF1Z3VzdCA4LCAy
MDI1IDExOjAwIFBNDQo+IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6
IERlIE1hcmNoaSwgTHVjYXMgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT47IEt1bWFyLCBQcmFz
aGFudGgNCj4gPHByYXNoYW50aC5rdW1hckBpbnRlbC5jb20+OyBCaGFkYW5lLCBEbnlhbmVzaHdh
cg0KPiA8ZG55YW5lc2h3YXIuYmhhZGFuZUBpbnRlbC5jb20+OyBCZWxnYXVta2FyLCBWaW5heQ0K
PiA8dmluYXkuYmVsZ2F1bWthckBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCB2MyAwNS8x
M10gZHJtL3hlL3BzbWk6IEFkZCBXYV8xNjAyMzY4MzUwOQ0KPiANCj4gRnJvbTogVmluYXkgQmVs
Z2F1bWthciA8dmluYXkuYmVsZ2F1bWthckBpbnRlbC5jb20+DQo+IA0KPiBUaGlzIFdBIGVuc3Vy
ZXMgR3VDIHdpbGwgcmVzdG9yZSB0aGUgbWVkaWEgTUNGRyByZWdpc3RlcnMgYXQgQzYgZXhpdC4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IFZpbmF5IEJlbGdhdW1rYXIgPHZpbmF5LmJlbGdhdW1rYXJA
aW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFy
Y2hpQGludGVsLmNvbT4NCg0KDQpUaGVyZSBpcyBtaW5vciBjb25mbGljdCB3aGlsZSBhcHBseWlu
ZyB0aGlzIHBhdGNoLiANCg0KRG55YW5lc2h3YXIgDQoNCj4gLS0tDQo+IHYyOg0KPiAgLSBFbmFi
bGUgb25seSB3aGVuIFBTTUkgaXMgZW5hYmxlZA0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndWMuYyAgICAgICAgfCAzICsrKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19m
d2lmLmggICB8IDEgKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhX29vYi5ydWxlcyB8IDIg
KysNCj4gIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1
Yy5jIGluZGV4DQo+IGNiNzU3YTUzZGU4NTYuLmY1NWM0YTM3Y2ZlZDEgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3VjLmMNCj4gQEAgLTIxOSw2ICsyMTksOSBAQCBzdGF0aWMgdTMyIGd1Y19jdGxfd2FfZmxh
Z3Moc3RydWN0IHhlX2d1YyAqZ3VjKQ0KPiAgCWlmIChYRV9XQShndCwgMTQwMTg5MTMxNzApKQ0K
PiAgCQlmbGFncyB8PSBHVUNfV0FfRU5BQkxFX1RTQ19DSEVDS19PTl9SQzY7DQo+IA0KPiArCWlm
IChYRV9XQShndCwgMTYwMjM2ODM1MDkpKQ0KPiArCQlmbGFncyB8PSBHVUNfV0FfU0FWRV9SRVNU
T1JFX01DRkdfUkVHX0FUX01DNjsNCj4gKw0KPiAgCXJldHVybiBmbGFnczsNCj4gIH0NCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Z3aWYuaA0KPiBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndWNfZndpZi5oDQo+IGluZGV4IDRkYzAwMGM5NzdmYWYuLmExNjlh
ZDBkYTBkNDcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfZndpZi5o
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfZndpZi5oDQo+IEBAIC0xMDgsNiAr
MTA4LDcgQEAgc3RydWN0IGd1Y191cGRhdGVfZXhlY19xdWV1ZV9wb2xpY3kgew0KPiAgI2RlZmlu
ZSAgIEdVQ19XQV9SRU5ERVJfUlNUX1JDNl9FWElUCUJJVCgxOSkNCj4gICNkZWZpbmUgICBHVUNf
V0FfUkNTX1JFR1NfSU5fQ0NTX1JFR1NfTElTVAlCSVQoMjEpDQo+ICAjZGVmaW5lICAgR1VDX1dB
X0VOQUJMRV9UU0NfQ0hFQ0tfT05fUkM2CUJJVCgyMikNCj4gKyNkZWZpbmUgICBHVUNfV0FfU0FW
RV9SRVNUT1JFX01DRkdfUkVHX0FUX01DNglCSVQoMjUpDQo+IA0KPiAgI2RlZmluZSBHVUNfQ1RM
X0ZFQVRVUkUJCQkyDQo+ICAjZGVmaW5lICAgR1VDX0NUTF9FTkFCTEVfU0xQQwkJQklUKDIpDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2Ffb29iLnJ1bGVzDQo+IGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3dhX29vYi5ydWxlcw0KPiBpbmRleCAzMDNhNWUwNWQ5OTMyLi5m
ZTM2OWU4YTAxMDEyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2Ffb29i
LnJ1bGVzDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YV9vb2IucnVsZXMNCj4gQEAg
LTcyLDYgKzcyLDggQEAgbm9fbWVkaWFfbDMJTUVESUFfVkVSU0lPTigzMDAwKQ0KPiAgCQlNRURJ
QV9WRVJTSU9OKDIwMDApLCBGVU5DKHhlX3J0cF9tYXRjaF9wc21pX2VuYWJsZWQpDQo+ICAJCU1F
RElBX1ZFUlNJT04oMzAwMCksIEZVTkMoeGVfcnRwX21hdGNoX3BzbWlfZW5hYmxlZCkNCj4gIAkJ
TUVESUFfVkVSU0lPTigzMDAyKSwgRlVOQyh4ZV9ydHBfbWF0Y2hfcHNtaV9lbmFibGVkKQ0KPiAr
MTYwMjM2ODM1MDkJTUVESUFfVkVSU0lPTigyMDAwKSwgRlVOQyh4ZV9ydHBfbWF0Y2hfcHNtaV9l
bmFibGVkKQ0KPiArCQlNRURJQV9WRVJTSU9OKDMwMDApLCBHUkFQSElDU19TVEVQKEEwLCBCMCks
DQo+ICtGVU5DKHhlX3J0cF9tYXRjaF9wc21pX2VuYWJsZWQpDQo+IA0KPiAgIyBTb0Mgd29ya2Fy
b3VuZCAtIGN1cnJlbnRseSBhcHBsaWVzIHRvIGFsbCBwbGF0Zm9ybXMgd2l0aCB0aGUgZm9sbG93
aW5nICAjDQo+IHByaW1hcnkgR1QgR01ESUQNCj4gDQo+IC0tDQo+IDIuNTAuMQ0KDQo=
