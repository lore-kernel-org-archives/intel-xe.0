Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A11C83F22
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 19:46:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C72C10E3C2;
	Wed, 16 Jul 2025 19:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SQPO6ygp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB9B10E3C2
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Jul 2025 19:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752695215; x=1784231215;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=heGv6uYrg+by4ZOzseD4L7Qvw3nEChkgXSOpT+7al1k=;
 b=SQPO6ygplp2j4mLy4T1NqqtznMVbCL5UL/+oI9Hn4YyET0F68T4NB9sz
 cj8BLDjIgYWxvS1kZlXzHvRbVs89koyeYFyhBq3v3afSy4xAmN6xUV6HL
 Fl57o6GXs7y4DCpc8NMDmqnUt+iD64Sd02i7Ca8y6O7BKzUgP8+3cFeVp
 L6cJ/hgqnT4qM+RDk5TUM1zNTdTrlq9Yx6KU/8wDDC2LydNKwfPZMFZvM
 +XoVMReFNjLiUmAH1QhDJUhOfV/+cpKEjLB+/Nn2bhsa/7msEB7rSjFr/
 Fih3ICE2vw1wr99FUQNt7kyTnm5T13WUH/XRV4Vt9uMJYGnlnH35mw+LT A==;
X-CSE-ConnectionGUID: x3ZqxhwZTp6EePHqKIoRJQ==
X-CSE-MsgGUID: dZMPxuk4QkC8ygWnIK/Uvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="55047848"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="55047848"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 12:46:53 -0700
X-CSE-ConnectionGUID: 97KcDY5nRF+vxzpJkW00WA==
X-CSE-MsgGUID: EQV01AkIQJegcQFOnMBusw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="157673532"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 12:46:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 12:46:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 16 Jul 2025 12:46:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.42) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 16 Jul 2025 12:46:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lk3TPErNxogExNrIXC43mdqHCDrbqr5ykz2bE7Lld1vw3BnP77gYegQcoH3kLNiNyECS1rvFYUW1LdWPALoqQ1MUhmumjCjn1I0VFVNicRxoxdok/CRWDFpnw/Dcjz1kH63HPKg1oflbry4/NoJSPmDR6ujVp0pmXxf+F60An5rNfZ7zy798S7p2t5Gl8EtQ8V+Y4GxJCGvzDU63T7NRrhF9aBz7iwLColU78SmR4feEvxp0+h9J66MRH3dpsKowCLeYbYaOBLJv+rsBDU9sG/8VAW7PwcVAuMiJ++S+1P2VOCgcKQrM0DiK2pdbijF50Kz7/Go6FapXrr9nhcaMQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZA5Z1lrKP9rWvznREIY/v1iNFFirabyXuG1FhUQ+SE=;
 b=gVpxhvhMvjF817ZPjV7dUucnSbAvGl2UlcWK2GgYfxtgJFXMGz+WQCSXDBa/G14//6dzRuu/vd6hfPI1Qu18iqdcLvYeroxbTIGAPitZ/lYHIoqw+85HHK/sVcfhP8Wj3sleYgFFcBwXctuzcZoSJN/tpO1b35EEUPk+xBjjAwhzoJCP4z1Caf+Npsb+B9u+prhbMHKw7/s7mahTCphPKT6AHC6idAJSzz2vOmmOf8lgSlZwGjVGfCwUifRLCTgiCi5AJlQxhj9rWsI6R3QUQQwDpWcH/PoSHf0UcK96U7XQiz1rfuAtRSaSHHC8lKM3xgE2c9rmVIeG5QvYEY18rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Wed, 16 Jul
 2025 19:46:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8922.037; Wed, 16 Jul 2025
 19:46:50 +0000
Date: Wed, 16 Jul 2025 14:46:45 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?B?UGnDs3Jrb3dza2ks?= Piotr <piotr.piorkowski@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH CI, v11 0/5] Cleaning up code related to VRAM regions and
 its initialization - part 2
Message-ID: <t5752wnus4tvwnqepo5wzb3yvff4qzszovqxhswgfhzjoemyiu@etiq6pd5hjf6>
References: <20250714184818.89201-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250714184818.89201-1-piotr.piorkowski@intel.com>
X-ClientProxiedBy: SJ0PR03CA0380.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8393:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c75b32d-c365-4f11-2855-08ddc4a181e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?mWJPnUL74pHTgvnW/C0+YjdhV7Zr+lNkwlQE4z9sfJXlaSMJePVEEFNmy1?=
 =?iso-8859-1?Q?vevXSEENRtnSeaU4MtjYtebictP9R2TIuASAsEW15tFP5YnPiNoLMWKhkM?=
 =?iso-8859-1?Q?D4B3EnWPHU14hHu5fucCme1zZ7RCc261JYA+OgY16Rdd2fB80LAtB0gMrQ?=
 =?iso-8859-1?Q?kH/w30f/Qkxlg8ayj5jyDXaMDz4du1IWriH711v/Kb/fVEIqmFKg2EWgiU?=
 =?iso-8859-1?Q?LzSnoDb8wkIbKBFnQdJOJGap+YusuUgjdeLt0xo9la9KLl8D2yywq5k1mW?=
 =?iso-8859-1?Q?Q33lewsy1Y5jQ8jo6b825gx3Ht6y+11mNOWIQdHWnu7qDjTL3OzBQwczpk?=
 =?iso-8859-1?Q?TxQQK7E6bzIC397+QLKmWyu/R0as4IldpJxzZ+Ns73zHme3qXFx5U00Gwp?=
 =?iso-8859-1?Q?p5MBBUOLVeLJUqlSQ1iEdXuxRu1Mx/xmYtcoNPU34yeVvziODIVk6ObT9r?=
 =?iso-8859-1?Q?dvmRhWMlzCXZeJ7PExMDdLFSHjCTwOkSdidrIpGDl2rrEXvs/75SRH6XKR?=
 =?iso-8859-1?Q?nciNHlulRFxAhhhKU0t3w1XC6tajacp3lZyzx/qF0MM9gDCbI+c4OvYG3W?=
 =?iso-8859-1?Q?GWIf8iDTVVxOPoUPx5u3EahHRq98SwHYTubY+hkxuxuFFqiWoHwe7+ujhF?=
 =?iso-8859-1?Q?Do66iLMAUV01DedfUu457ZjXFFrMxitxbxhsrh38jucz/R/LPR6CWinKO9?=
 =?iso-8859-1?Q?RmJ1i22URTuZv0SJgQvOrAViju9ZuRijA27AM3YJRFfk5iW3HjpdhLbsw+?=
 =?iso-8859-1?Q?5uCszBeqU7De0nUSQ57IMdCP1jr9Q3bA2hBt4TbEQ5a2ch3//2dxznwQCN?=
 =?iso-8859-1?Q?beMxLzkNNjvV3SSCyGIBKCeiKkknbzORwdYJzSl+mFiO1rGoJnomao+2IL?=
 =?iso-8859-1?Q?n47K3pc66+r3wnT4OJP/8xV7cE+myNohCLwL6OqJ77GYfJd7tNMzUEMZRb?=
 =?iso-8859-1?Q?g8pGy8HMRJCC7ACZOBisxlMVrVSmb4H/wGrizrFFGn/JR6hB05slAPPz/r?=
 =?iso-8859-1?Q?VWMeFB8WcfjG+5gg7ucohFSEmli3Ev43RJrxPPcyG84DNRjYF9Qef2/fnY?=
 =?iso-8859-1?Q?jYvsLOngxrxRvB0pT75OfkdU4Q+YsNkJB1yQdKZULZIqEM/udtVJKrHVXn?=
 =?iso-8859-1?Q?RI2/Y6rOL7OgeLbc8eBjrZ+aHwq6TzQmE8oaPlDz1ydo94S+lfSdr41Ljg?=
 =?iso-8859-1?Q?CT4FDUD6ILHbffySr8SUnn7q5W2C43TaM+UEr3yk5mDIaeGIXDygzWUpO6?=
 =?iso-8859-1?Q?QOJ4IqDZb84xD6w4dh9CjWjQTmdg5dSOp7M8p5jXWTzJRNRO+rmQS7DFR0?=
 =?iso-8859-1?Q?9pZXn+72fAOc0JkhYbAhn138ZYvdpgNgX0XVjsu6rAdvaCIVy9s5dCPJVI?=
 =?iso-8859-1?Q?0ImxxpP7f26nFs69uaHq77bqPtw+hXEOD12CakTY2MDNYAnuInuTsSrY5T?=
 =?iso-8859-1?Q?5haEXSU1CxB2KqkFNFQkIuANkFUQ8qcSAlES7ky/EXyzTDG50afS2/kTpU?=
 =?iso-8859-1?Q?c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?71YKy9vSv9cJqH9s/huF6e6rbukbEPF/BSzavhEMO+lTVe62tj/dwLVg8a?=
 =?iso-8859-1?Q?aBFF5yTT8EWBZK0FT7BTGWu/im0lxfqacbrUaMOeRaSgm3UmLdrZJwz56a?=
 =?iso-8859-1?Q?+YNJeAE6xtK18inl/+cMW7c/IIg3bCks+xc6M4DVaNFoAR01ep07Tx7Z+L?=
 =?iso-8859-1?Q?BLEMt0wFHpJoNkDfT3FNmdEe01tcG+2ZpHYFD1UgNoYh/GmsSMSFFZ2XBM?=
 =?iso-8859-1?Q?ChghgrLi/qGh/EQGQPvDfCyliJMOaEIB6uQJeADvHbWDSKlDEk77u4jBny?=
 =?iso-8859-1?Q?P+Coc101BeHOXMA66HykYJh0WLIrXFo/myGmX/3hzQxXmdyA/JthRUnoop?=
 =?iso-8859-1?Q?J5maXxivxMNinNb/HU5vlrCgiiMzGWWlMlPp+3PL5WHKCKWfezwn2dP1rZ?=
 =?iso-8859-1?Q?tYqXOZvuJUGtqOO6tsQQuqPBkFaCoQZts/uj2lDGagpn064VChCNrZBsCX?=
 =?iso-8859-1?Q?Ysmr6bWf8t09/cGnnmKJbJrFyQuZMjLA6vXLaYz4lU38aMv9Lcg9WC3OJL?=
 =?iso-8859-1?Q?jPW9oruxnsVXZn6CLmwbALZFSSYUVt4dN+4nTExql7gklDvYxfEUkuRimz?=
 =?iso-8859-1?Q?Kw4VFDfHF4iF6QiGyPiKXBcwUFU4Was0oXCxPvKp+GxTsa1/nJgFPPHLmx?=
 =?iso-8859-1?Q?DLan8lzbPZ68p9n9ZyYg623TgdSuMY8YtHysqJlHZHhNjSErmFwjbepb4e?=
 =?iso-8859-1?Q?jp6dG8Uwcr0PDvKoVNtblqcG3vWaZplTY+bV6O+iwo5NxotJyqe2cSh7mq?=
 =?iso-8859-1?Q?NnsvfGv+01Md1kQYc3OUo4/BWe1QrFs+ORfcHY2dYgnAi/Ftrv7dHz6bL6?=
 =?iso-8859-1?Q?xUg2WtuPfrX+ICr+oxV/o18kYXfna+vX8Od/w3y+ZyzdDIENPQfNs0ODus?=
 =?iso-8859-1?Q?ZLJ7jy70Bc2YgLu1o7Op7Zx/UykjlubKzOlH/i+Q26rX9xikVVWPP9/aoY?=
 =?iso-8859-1?Q?X049jkA8Ie1wlaH9+eFBOy0taDUYrKfWbhg9R/XR65KUlto4VWPLKPCdtH?=
 =?iso-8859-1?Q?DVUssAKjxIkqZw95YHxqcZS/OEYt3UvkE4kzsAatvzpxgnGoH+9ksiVjtI?=
 =?iso-8859-1?Q?t3pCA1SIshq7N0h6vwu0tXd9qGxx40ioCoeuyzMuTLmsT780wFlO90lkuc?=
 =?iso-8859-1?Q?i5KBRXH/5B3IYnohKO4JvK+Zw+M9ftCM3Jh5FRmHsdc1Zp65+N18KZbfhr?=
 =?iso-8859-1?Q?zuJyXv9EVC0FbnVst5lyrb5Nx19eFXyhmfc2yosS74ZiajtRbgtnTET3bN?=
 =?iso-8859-1?Q?HO0eoVTaQEgQwomFa1fhMMpbloxTZxVr9xhkFj4QFsRq4tnIMPcmeYkqFw?=
 =?iso-8859-1?Q?aWYkk7ruRIeoi6X14oPEkewo5qlzJkyq6TVWbrej01YNnjUuVRkEOZwBrf?=
 =?iso-8859-1?Q?aZtR3YqRku55M49NEHpzNbHX/TEhZtGVSiOct89LOw3RmzTfiXm+jMSxZw?=
 =?iso-8859-1?Q?bhgvhEW8C4ySzFqNroxE6zB8rULOf/DfNvKCbOK1BUhWKHpkgL15xM5R4J?=
 =?iso-8859-1?Q?wEKySnpW2ru/tWJPvALsDE/8j4SdClfBwGsbkN9EZxNxyaGI8u64Zdofwg?=
 =?iso-8859-1?Q?ROSV1op27IzuxPKs0H37FcYLxtE8TKagsGQhdgdh/wsDA7mC7PD94ekOJI?=
 =?iso-8859-1?Q?cE9esc3U1kJBUzR3U4d7ZxIPT3gbm53PBrWprJ0+cvANiq7CYJ0LlBHw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c75b32d-c365-4f11-2855-08ddc4a181e9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 19:46:50.8877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tgEqToNlL9tvCPBmRT8NmN4Rc2MqkgAm3h9/Q2gPXAL6g72SBKx5sy4Vx90P3LQVQlznYuFaROf/LBqGldrPH7FBK6J1MD0VVEH11mruEpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8393
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

On Mon, Jul 14, 2025 at 08:48:13PM +0200, Piórkowski, Piotr wrote:
>From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
>As a follow-up to the earlier VRAM region cleanups, this patch series
>focuses on further improving the flexibility and clarity of
>the Xe driver's VRAM management.
>
>This series focuses on preparing the VRAM region handling code for future
>platforms, where a more dynamic representation of device and tile VRAM
>regions will be required. Static allocation of these structures is replaced
>with dynamic allocation to increase flexibility and improve maintainability.
>Additionally, the initialization logic for device-wide and tile-local VRAM
>regions is unified, replacing the previously separate code paths. This
>simplification improves code clarity and facilitates future extensions
>involving additional VRAM region types.

there was a small conflict when applying the 3rd patch to drm-xe-next
and b4 got confused about the last patch since it uses a different
subject prefix. Please consider using the more common
--subject-prefix=CI -v11 when submitting.

Anyway, it's now pushed to drm-xe-next.

Thanks
Lucas De Marchi
