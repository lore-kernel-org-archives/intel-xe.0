Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04754606A326
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 21:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J5sTnA0A
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0AFB10E6F3;
	Mon,  2 Nov 2026 21:14:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC03810E6F3
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 21:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793654050; x=1825190050;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oS96iBPTC4VUi3okiyBAxu2kltMZawW7sG3iXowil5c=;
 b=J5sTnA0AjHaTKkkZQK4YgKyMjE1e+XN9Y8d7nsC7rhMZBa7pwJ5cD+2C
 24PEyDL0EE2aUwQJtQagCy9EU2amqi957T2WN8jaR15e2kzqxrZGJyoeb
 IbPZmo+435AmifmRTXkvDqd58iafAnExW7zWuvtRRQBOl07fJ0UGBggA9
 kK34nYYwI8TD8KqvuNfj7FrU6xDQ4BJqvqnv7tw2uSO48j+IS8It5aFzo
 /WL/nm8rPx6+hnnVUFdY42BacMHZ/bBVzk+VI+JhUnzAbSgj9ZF58s8Bw
 zmuu4Fo3qCLIkoR0YWUx9KifnsRSBhHQzb9wryYhoJNgHbZl2e+rar7gE A==;
X-CSE-ConnectionGUID: /QxnzNBUQq2sLY+fHQ1O/g==
X-CSE-MsgGUID: GFNIt6UNSC+EyLNHzPiieQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2241767"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2241767"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 13:14:10 -0800
X-CSE-ConnectionGUID: +Wf4axk8S1qALxMReV2K4A==
X-CSE-MsgGUID: tdjqO70fRa21xUAl00pmIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="8059981"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 13:14:09 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 13:14:08 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 13:14:08 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.35) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 13:14:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vVeq2QSjn3VasNQdc7UPzLhosszbBaicSqh4j/mvt5UiaEotUaeRXLw2pH29gopJ21XVga7oNduxChVaMMeIPJpGIk+bS1+YHdngbdhQBsHQe3n81BMqdR3tJ5L+5Ue9+cSff+HR1KJpKtAevzloMX+wObWEyQ/4HtTsx9saxCWpq08Fx/03nt1kU+jMSv8sHp6S6u1dm8T3rGshKo72xzbpqKmXUGSEb1yCxb4wm/KaMpaVdzihqU7Xthd3f031SXSD6DYnqP9mcKLt5bPqPxNUVteBXwzODTH+UEMNFNLFOlQB2gsTerCyZk5cXxS+Rsm8hRToyfinRrkgbhy3cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oS96iBPTC4VUi3okiyBAxu2kltMZawW7sG3iXowil5c=;
 b=qo9C3FmYza96l6GnmEnoIU4kWax9NWaCvvqeh3LbKi8mLP+vMWE2EOiDWCs6hSoN0dL0Vj4oUyWY2UzqDWVAkG8kVZwcCmJsguc0zHv1IoXcFITn3R7ekQ8cmb6nKueNQVVklts5WV2soaa+QnMy6vVRQNPsB9a2Dj4X1Uqdoqk5XU0jcorxIZXH4AXOOdhlwAqiEtQ0kfnHQohbDBBGXb8RSN8iwy6kukVvPp3ctVi735yjh7g2FEWAo/sIWObCjKg1Nq0zvrj/Q7/IjhldtJ3Y+EaKpGGymEEVZTKGLJRViMMwUCKRKRyDZh7XwJJlmVwYrEhu2lrqPZMmMv/wXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by DS4PR11MB546542.namprd11.prod.outlook.com (2603:10b6:8:4be::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 21:14:07 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 21:14:06 +0000
Message-ID: <c87380a7-ee5c-4ab6-98c5-b223f5f08a9a@intel.com>
Date: Mon, 2 Nov 2026 13:14:04 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] topic/for-xe-CI: drm/xe/cri: Define GuC firmware for
 CRI
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20261102163840.2231293-6-daniele.ceraolospurio@intel.com>
 <20261102163840.2231293-9-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20261102163840.2231293-9-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0158.namprd03.prod.outlook.com
 (2603:10b6:303:8d::13) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|DS4PR11MB546542:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cc1c61c-d57d-4a69-6df9-08df39263a75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|10067099003|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: qIVMRvf0j9Ct+VLZjyLh4u2PeIfcbenVkKoXjIKttTT02IA3jplPcLaTDRv4M+8wAH8Jb+/U0kxaZ/LUK+epqHDVJM79WbKCQtccRtQtxQ8RzdF9503yS9pOVIygRv1/pYaoDa3FW1G3w017MO8R9E8bWHmzHp6/BuhyFv6QD7Twz5U+F/N4HutPc7VuyCyksBVu7XrVW24kUrTXoDCvT30yWH0/DG8Yd+DyjR7X3OvgLK+Xy6D6WZDuGJaxp7/JpF1xz8lZrK8zCxLUs54+5WmeAAbQsyx3PyB5497WyjIEsL6w/Gp5FRNn/WQKCRDCKgca1PUH8Cjh70DYculG4Z+u73SJ7mzxhFBgILCORifOAdxg93+xdwMrdNlL6u8NZ6foXryISplsjHoX4aGWolk4Dw1Obg39bqSRO4eMBXVf8yzbi6Hfc1kG9+zfrGZMhnQ9Xqo3NUNDCTw0f+WkKLiLLrFHrzHTlK9n1yVZdS1E0x6+eXh3nhFgW9a/K80j4beLNVs3jn+f7Fau4MsYdYJj3a9x/wyTzfBE/noYSpk1XaGe3kiqsMNYsOoBNA+8mlT0JOF/7RvYiPelxnUDuSJIxy2bnlhBav/xI5rSRYucltgBWXX+ae1//kDNusHZGpnJvxNKeZNsN9N+055flIrueqtJOwZMn0Uon4UKFY0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGV3VTRyakxoaU0ySWJFMWRxQWtZM003bENLZG9OdDNIckRYNFZjQkJjTCtM?=
 =?utf-8?B?OTFlVFp4c2N1RkUrVTFFREtmdmQveXJRaklvODYwaEJnazZkVmRvcSsrcEF2?=
 =?utf-8?B?ZzlpeVVOVTk2cDlFOFFtaSt0VVJndjBrem52UmFaMkVVS2o1bU10bnRPUVg2?=
 =?utf-8?B?V2p5Y2RxaVA2VFN0YWxOOGpONGl4ZG85VmhJcTVneFo0ZXh1ampNNEVqVW5k?=
 =?utf-8?B?UXBEOGxocXdBZ2lkRTdOVHN6OEZZZk4wQ0l3NGhBeGg3bWRsNk9EMnQvLzZZ?=
 =?utf-8?B?SDR5NjkzT09TeWZKSldId2xYcEgvQ21qSmY0M0lzUmFRSlZFMDlOVy9nMGVv?=
 =?utf-8?B?ZjdZZUlvTU4zOVJVU0RYZEVqRlVnY0lSS3kwbXdOeU9oR082cGt4VXUyNm15?=
 =?utf-8?B?M1JJdGJxTGg3MDBhZjhKWHc2c1ZVVHFGWkJkcE5UTW0wdzI3enBZY0wrSmcx?=
 =?utf-8?B?RnVuOVBacDIyaG1WMWtBN2NIKzZWOFJUMzJxdFBoWUI2L01BNkZ4amdMOG9u?=
 =?utf-8?B?a2VqR2JkeUY5dk1FSVhYRGIydStUTmVZZmtIWVpvRlJYditRV0RwRXJYam9m?=
 =?utf-8?B?MTgrU1MwVE9UcUZXMzBGM3BIcnV0SkR1TDlUVGozczlDcHdVQUYvZll5eWJu?=
 =?utf-8?B?NGZDaW44M3d3SWk1MW52NGhxVlpKWnFBVWhSUmJ3TEZ2enFSTHVINFhCVFE3?=
 =?utf-8?B?VXhjekZJVGNpMVJ6RFJnNGIrSjFINUFPTk1kRWJjNnlwbHJhbnVJNDFhRDE4?=
 =?utf-8?B?S09CdEJ0WkRleGY1dW1OaG1zWUdQYUlIY2VIMXJyWEFlT2VTbWJQQkhhWVl6?=
 =?utf-8?B?WUdHSm9UT3pmWEtrNlVkMjlhZmRFSnEzYnJXV1dHUWNyS1dhY3BPUnY5TkMy?=
 =?utf-8?B?RnlyRzk4SmxCMDRXRm5lQnl6SjhkUHNoZ3JZTjhlNysrT3NFb2NiM0ZhTVgz?=
 =?utf-8?B?UXlLeEorVmJ5MXBoemtoSWRtL1FWMmhpSHJKTDNkbjA5dGRiZzBTUzdaUFRW?=
 =?utf-8?B?SHh3YzJXTy9RSjZadG5nVUhuNUZ0UXRXUEw0cW5sL0c3ZmhybVlDNFFuUC9y?=
 =?utf-8?B?ZkJRWW9HMlMzMGoyUm5HTWZwWGFZR29Td01QRWV6Wi9DdFhNbUpVUjRSM1Yr?=
 =?utf-8?B?T0Fxa08vZmdVNEZZeWF5UDZORnNlVm9SK3VxeDg3TGFkNWo1eHhXNFNseFVr?=
 =?utf-8?B?MDljUTFGQ2c1MmVhWmREUVVBU2dQU014WWtSTG82dVJzRWRTeVBwQ1cwaGFk?=
 =?utf-8?B?NEVrVkN6L050QVNKNU1qdDNYYTZCNGhpOW8yalQzMS9yYTRDWjUza2ZkQm0z?=
 =?utf-8?B?VFAwQjRwNXMwQmFVQ3VQdm9XY2poUWpTTk1NM0NpZzlCd2F5SldERzFWczdC?=
 =?utf-8?B?UWpwTXVHUVdLNEsrd0pmRVROczZBTStmeGNSVUs3RSs2dk5kYWZPNjhub1ZU?=
 =?utf-8?B?ZWVXUlNmWTVsQTlJWUIvbU1MTVMzd2JrWWFBNFVJUmFoemt1UHJIczNUdzRZ?=
 =?utf-8?B?RjVxbWJ1K0ZoN1lXaUFGS0pXKy9kRHc0TmNweEY3Ni9rbFh0VjUzSVMrdW1E?=
 =?utf-8?B?WnRJS1lDQXFXUldaYXk3cmhBeGZIbFI2SmF4amp3VHNFU3oyVnd6THJsaFVT?=
 =?utf-8?B?b1hlV2loRHR4c2hFc2NPWmtRdm41NElPUnJYemtlQi9zMDNYWWhWQURSQVNu?=
 =?utf-8?B?T2Y5cHhGeGV5eEl0YzBVRTV5bmlESE1sclcxcGJ3U3UxV0d2Zm5ycitIZlNP?=
 =?utf-8?B?VDNBQzBTekxPaHQ2cWM2aWpFdk1yeFdTWWwxc0lxNFJDSHkxbk9wc3lxaGQ1?=
 =?utf-8?B?V0hUd0t1cDFKYkQyRVRveVhXVzRFb1BIdDIyeDgwdHVGQVFQYXFhYXVwWWhw?=
 =?utf-8?B?cnRCK25WeWhOZk0zRGVNdmJYcWp6WWNxcVdCcVIzQ1MrSUk0Nk9kM3lvMUpn?=
 =?utf-8?B?RlFnTjVZTjBRdUR3SjFlYXlaRFMvMzBGb2hmek84dXBuZUxQZFFOUTdybGQy?=
 =?utf-8?B?K3owblJ2aFRXYVU0MVZGeXgvSmUvRlF2akFJekFOQllrV2U1Ui8wUGd2NitW?=
 =?utf-8?B?amtHZWRWWEJpRTc4c3ZMWnNKMUM2T3B6ZU1XWmwrUWtJMWZSQmpnU2RKcG9O?=
 =?utf-8?B?YWRydWdrQ1VuVmRsTXloNjZqOFBOU3V1amdydzR6aXBiWGwzQThWQmRNSDJn?=
 =?utf-8?B?Wjh0dGhtZWdtaTk5dTRYdjdzWk1mQ1lzWE5NbDlBRmJNZm4zdkF6VUlqOTgw?=
 =?utf-8?B?R3BPcS9PZFdOZG1qY0tzcjhiZ2NlUzNjU1JIWFV2cUZrVU9kb1dzTEZhcHE0?=
 =?utf-8?B?ZEhCYmNKRm1VbzdsRXo3TzJEN3dCRjhUKzBrQTZzb3d4M2gwRzgyanZJd3U3?=
 =?utf-8?Q?5lyHIdG5CE1Qc6eo=3D?=
X-Exchange-RoutingPolicyChecked: aZjl999UraBMF2NXO8jhli1SYd5Q9LEHrpN2zF5qX5NAZddGdBi6oAGT2S/d+78BC4NahZF3BvCAUsSc1+FxaBM9g1Q0B63Pu+vKWs6hQkEqIlEhu/dUNWIHGUF3Q5kSB0gRNiEabpsUcIYMyLik7lBN+nzNiCvqByKZDF569JqzOH1AdfeeO7+2cGhNTkR6qcPUYzk+iAvsPOTq+8IsvqvM80mi7aTbuXWftK0uknihLvjhyLbh5QeKq+KB0StN0MdEmS6TZOqOnVETYO5nDlzYWplyWIPWwc2ezN7Jvq49/tvPSEiWg3G+oJYYmyU8zmYYr+pN+0ML7Y8YMvdXAQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc1c61c-d57d-4a69-6df9-08df39263a75
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 21:14:06.4234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z3O0ENit/rLHtDig7Ga5MhFUCFUPglBofEp6Mi1CUHtLgzmJ+UQSY7S71UjQSRVi4mkAxMzYADJVjWC9Gfy3PjprhplleIpGk1oFCswOlms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB546542
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Acked-by: Julia Filipchuk <julia.filipchuk@intel.com>
