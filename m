Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC57CDD56F
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 13:07:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D376210E6D4;
	Thu, 19 Sep 2024 13:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WG8py4Pz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B9710E6D4
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 13:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726751276; x=1758287276;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wAMlk92UquvonySUjxTg/ygHaRdmisUKHKTI9V2wa9c=;
 b=WG8py4PzJls/WYQSx+0vTyC6qv/pswJBuDEDJt/OAeRf9ljAxjgCZJPN
 Mc/mcjdu8F5+xIMpaGwY8Szc0tAtQoDoNPgDAgiPb2f7fQSRBAulI9cxU
 sBkUrgHGuN7lgVJdmzmZcQreQCX2k7h2YJjz/bwSf3rGdiIpDdx1ubiZT
 L/KJ7BD8n8LV/BdtolphX6yIBHNfx7Q+X9Z0sU3ommhw//CnPq4cTAAt7
 YjwV1dOsMHNxGRINkQ1nTz7Vz9lcQXy+in+HcL01I4SlPhb986zJIv1hD
 GpUj8TS2t9Uf7qJ01DEb6tZLA+u3oitaCzXOea6E/YifUZBv38VPduou/ Q==;
X-CSE-ConnectionGUID: shMSROELTu+wg43Lz8kxzA==
X-CSE-MsgGUID: hsHH4MMiQ+67UXe6k9Z6+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="29610722"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="29610722"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 06:07:55 -0700
X-CSE-ConnectionGUID: KF+RnxYLSFq4garuBj4ZbA==
X-CSE-MsgGUID: ZX0WWvIRQfKTGddMiKgKng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="74044211"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 06:07:56 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 06:07:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 06:07:55 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 06:07:55 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 06:07:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MBepY5CRwu9XlZcBBqFwlM5adLrTdhdbRmuQz7k6UUpvnAA6rfE1NUsxGCIi8smUAoa31hlt5Udh0AmqbHyGbz3IVbGkluaFQFbLLhMTyZORKynuk+jBiJgDyQe73J9kJndT3ecgxQTZ3GxazJX0jUz61GWKF85uUqo+GKRSKfLRfzo2dS78o6sODOARJFCcRoyvAowr5rDpTDf6BBcb37o3mui1LjCE6TcWk4Pqp9v23OTPvwW4bgA1L8wdniiMqHdnDCg82QIvmhDGumq3VzplWdMqko3V1EAVz8I2bZMcCUW/SCeLH2fnnnpzEdWLwcr1zVLeGAgP5uDkuyeAeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YeTi5goCe5nsUcKITeDhf3gY9acC72TWVNHy6eSL/dQ=;
 b=izMqF+y8zRC3m1MaaXeeuvhOJncytvhZhQV6eSiA/+CeTbmiRhaSYstoo8IiVj92qylLbr+2rgRtL/KZMAh2aEH2xKC+arOHLbjmctd59Ojv0vy8lIForB8iLu6VcSrhvDgrjGrSZCnfSbqnyUbE51XDMRjPrJCFjzkAi4a1P7h6JeDFrHw2AOuxGCjrGsrQt2yyMY/+0d0bFxz3ULXndfWdT8rNYHHyLIhfWDDp2ySpVYFW/FD5CquJigm4f3TUdQKkZIAWoD5hzSEGntHl3T5iVeiHIOPnqBeQQtyK8xl4VrxYNm+8EvJrTjXQF9BMnJciymxuZjKFBOs3VaQgpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7033.namprd11.prod.outlook.com (2603:10b6:930:53::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.21; Thu, 19 Sep
 2024 13:07:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7982.016; Thu, 19 Sep 2024
 13:07:52 +0000
Date: Thu, 19 Sep 2024 08:07:44 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, <intel-xe@lists.freedesktop.org>,
 <daniele.ceraolospurio@intel.com>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 2/3] drm/xe/pciids: Add PVC's PCI device ID macros
Message-ID: <hcefkofngnohwn3qukf7xo5juwbyvakfx7hlzlkh76ciy5pxly@gt3pidublp2g>
References: <cover.1725624296.git.jani.nikula@intel.com>
 <6ac1829493a53a3fec889c746648d627a0296892.1725624296.git.jani.nikula@intel.com>
 <Ztsmyp6L4vZEtad6@intel.com> <874j6bameb.fsf@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874j6bameb.fsf@intel.com>
X-ClientProxiedBy: MW4PR04CA0226.namprd04.prod.outlook.com
 (2603:10b6:303:87::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b8f05b0-1840-4bce-ece1-08dcd8ac1179
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?DQZZimeRb3g4LWGsmWgJA3+jpUpjj53TLScAc9D/cJ09fg4/qosB3fyvlL?=
 =?iso-8859-1?Q?Uf+BfE+i8nNZJmrqYJ20ACB6c4Pi+frPeEhvghP8PjDNLNexCN8hpL+7KJ?=
 =?iso-8859-1?Q?S5GjmqCVWr+LPBrL2VuepTrwR5lN6f9V6vnSHREGsTCyKNwCZvCxSQ+vTP?=
 =?iso-8859-1?Q?HSiomsmgBUWEIS1jFaBfke/YmVNXPgzKokHCdROUEhTvG7qvNeHpg1APGP?=
 =?iso-8859-1?Q?an6jA1zK/0nGGmEuNaRLi8W7k3PaZAOUUrB9CHx1RV+llcSnSojWqj58fA?=
 =?iso-8859-1?Q?0FIwspekoI7YoMPKHuv8qlrV1tqnEXjrTZjcjHvzyqQKRGT22DsUOPjqsr?=
 =?iso-8859-1?Q?MuwxetVyaUJTQy0KBXDBAOOoQM6mi+8l7QPnZHAlcyIPxLJIWbGK9zBSzC?=
 =?iso-8859-1?Q?0HL+3Qt5HEgFkywEHcHMYYN5Yvwk1HWHdwe5qQ1BEVeVOQPS12KZ5QgULK?=
 =?iso-8859-1?Q?lpI9UerNW6bb44n1RJ+Iyl6fNkfI0LRyxLz8WZ+uh9jvgU29BUbCgdQz6V?=
 =?iso-8859-1?Q?m7+WGpdaoFILmPXwRIHpdC9RFshXaR+Bqt9sxerNRXlW3MTXz6wftZbB2N?=
 =?iso-8859-1?Q?sZq3yZHs2mQyQdB/UPIN2gXreuN2qMK5kVaAL2tTSg5OUYCz5qL1T3MTA9?=
 =?iso-8859-1?Q?LFkiU17QT6KW/Mptgfpr4HyI0pqUlmzZIZaWpyycJwT11nHBrqXqxzqc0i?=
 =?iso-8859-1?Q?3KZnpljAPMytoBt3eOW5eeydqi37BQtHyeCQDYubOaYr9RHC63hRntZLgw?=
 =?iso-8859-1?Q?n2MQHOAAfipGHg8iygHAPmhNCYk+S1BN0fIamw3+hAn8kekrI6TsACUcRU?=
 =?iso-8859-1?Q?0EtGh5kPb57Wv7zMwf11IjEYnGIR46HH1W55BOi8lFCw5y9bWXYfFZCWN+?=
 =?iso-8859-1?Q?iybfixWCx11x0Bmm5rdO05/CbKjJFY6wdkRL7e0mJ+JmDzX3pRqTXFeccJ?=
 =?iso-8859-1?Q?/q8wRbbAtZS4DpiwMTMiTqEdQb4Q+HdC42xlTSNhFjAYyv2Y+tin09o1DU?=
 =?iso-8859-1?Q?lCV2JDiVQQv5Qb7xsChUULqT9IOVv+KVcKfg6g6FyJiQK+APpdlN4XslB6?=
 =?iso-8859-1?Q?JuO0SXFwrgrUtFH+axGXpT4tKnZtwcZpZDyQGVjpTMMrLoHNHHQYZrOlsu?=
 =?iso-8859-1?Q?TdO62nyHtnoj5L5O8rCiCw1BoXV/WcvUbN8poXbwwuNZsRCmGrKty4YtCt?=
 =?iso-8859-1?Q?AKAys6JCky2t36W8zFpxZAKxUtThC3hCqPsqyDu+eClnRyJLiOxqP958p7?=
 =?iso-8859-1?Q?fML3c5edcOaRaHBFki8SPA5Z8guPRomHP6kOoGiLXFiCuPvl0rC7EvsRgl?=
 =?iso-8859-1?Q?Y2dTOGNl3tIbCtSDd130AkKi7dIBDICnCR4fE2riBwB3mug=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?lIieTVNvUEB9iBtruuLvHobBthJiS6ZIFBtW4k2LbJkyyctrlXr3EzTKcq?=
 =?iso-8859-1?Q?FxMD31Ce7usY9s0q7fjMk7ldVY3nSAos/vNWVs6ilBBXJ9Y5nNtNHTUSfe?=
 =?iso-8859-1?Q?dwpyeBKZkvnZhNom/bmvoLm4W5Q2xFvkXDh5o4HVqZkB1mic3LQQwciT2Q?=
 =?iso-8859-1?Q?agB4SBfUdpoc99p4eggwjj4LU1Y6VTBt5K2Ik+oJ6iHEmtQ7MvchqIg/uj?=
 =?iso-8859-1?Q?f/d5ClBpJquZpBzKMAfD5BDujTijTPh5LyvYZMIWC0n55zqbE58GE4+5rF?=
 =?iso-8859-1?Q?xE9g9DcRu0tVNOUP/esxFgegfP8BVbQ+4z9KuNAhUwsyQHBo+WLMujWy3D?=
 =?iso-8859-1?Q?g3RtkjNazaWztSWtYApVij/HGxfxNoINKjJuuJiAW0ir8Nw8Rp+x4Aflcj?=
 =?iso-8859-1?Q?FD8/XOBdiD8iJf5beCSq2MriD4pmdZ0vdeOI1N/3pyG3RZdRjiheK2COy+?=
 =?iso-8859-1?Q?egdMD4iNltWBbyiGpUMlZO73EkTVON27qaDubkmvL93v9BLlW0lYOVvWOI?=
 =?iso-8859-1?Q?tQAeQwZyHLcHIfft3o82MOrySB90iy6ZaEMDOEQ/POOSMvs7LtIZcBT8Op?=
 =?iso-8859-1?Q?j7753hyHSNtJsXmTTLNcJAS0TYUpAO9L3eTywDlzWRjlKxhGE9JGs7nPvO?=
 =?iso-8859-1?Q?6vcYt6eO2wSJKQNHEqN9bm5TjaGp4eQk370NUmqeRXYN1QgJ7dJkRMADOx?=
 =?iso-8859-1?Q?ar3ANnUuAPPj8RF3xUtRx8k3laQVTDq4mQO/W9Z/lbrD6YmmprDmImd+AO?=
 =?iso-8859-1?Q?7OyfrJnTQ2CBY9AbSYxth3MJ5IE6GNw7GlyCSuA2pBskJ6swnKcbFkctPu?=
 =?iso-8859-1?Q?NtnBNTNqKp4yY6jBEZAIctCLp2VRKV09KOGboLyMnW9qqdzwCgGdhkNnxX?=
 =?iso-8859-1?Q?iOn35YyaTMPWl2JA4CaCq7PsQu9eJW8LVrTTfJG2jA3hwt4g6yWyAgsj3e?=
 =?iso-8859-1?Q?E8cxVcH8YYNdRx6BjvFOm8AOZ/8CwVCXiy7+uxeReaiFtEJysT01CsYGkU?=
 =?iso-8859-1?Q?KRL3/kYV5d07fQqoEqMmufMBSZ8ubXJAVu13ES+msulQOrWWGrHV5hdAqP?=
 =?iso-8859-1?Q?DMPwrf11Knh3MuBka3ry/+AQGukBXIQRDvpUJPloUJ/cVbaYx3moPozYfv?=
 =?iso-8859-1?Q?tGTL75eEmQXrDHa2gV2pisEAH9vOwANulnRvwxsVmFEmY+gSf48LJMnbai?=
 =?iso-8859-1?Q?5fltf+s4o1QWWkeVA3BbcvsNH8wt6bdsVhVd9g+vWTBPu9P135DDRHI+A+?=
 =?iso-8859-1?Q?TCzRqej8g/+L87IBwTf3lw7Cs7gs59IiQ5JS61XxO+75IVgIXqN2WYXzxB?=
 =?iso-8859-1?Q?AqARnprBNUZoisi0/lrHUsdAkjFNscCHygpP51LBIN81mcQiE2CRpQRUYL?=
 =?iso-8859-1?Q?DwnqsrnMYrPc6b9+Bi6OPohWNj8jzS/6goPlVlP6Q7Gm+W9B6CzP/f/S8c?=
 =?iso-8859-1?Q?TMcjkLD6Jt0DBIDyowQdcs3MmEuMjifEd34Wux1A/J/QrmghcwEtkPTse3?=
 =?iso-8859-1?Q?sVsab103DBc/RWSpKQpv2aBDHV5plGgqdt5rG9DxbPiN4Q9R+HLKioLmfl?=
 =?iso-8859-1?Q?8wxfG6FqoQ46AH3I/afXbx85KNywnOwexQgSdwKGf+5LaXpHFf/lZUjsum?=
 =?iso-8859-1?Q?DdDEZHQcY2KKu/GjwyDIUyseYlojZoskZB+Qn+wJPOLynQ77czyMZyMA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b8f05b0-1840-4bce-ece1-08dcd8ac1179
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 13:07:52.2358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FKstqGgrXyCxfAQ+GPjkmXldsAf/4a27pKGfcIqFqJdTzdQGBWLkGcyKk6d/CbV2gyy/IzXJ7/eulWnCb8O1OI4p9NlHWsP3Vms1xTkRkYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7033
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

On Thu, Sep 19, 2024 at 02:55:08PM GMT, Jani Nikula wrote:
>On Fri, 06 Sep 2024, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>> On Fri, Sep 06, 2024 at 03:06:03PM +0300, Jani Nikula wrote:
>>> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>
>>> Add PVC PCI IDs to the xe_pciids.h header. They're not yet used in the
>>> driver.
>>>
>>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>>
>>> ---
>>>
>>> This is for drm-xe-next. Functionally, having the PCI IDs defined
>>> doesn't mean anything, but it's easier all around to not carry these in
>>> xe-for-CI.
>>
>> Cc: Simona Vetter <simona.vetter@ffwll.ch>
>>
>> either way works for me. I believe that recently we got more conflicts
>> on the other file, then in this one here. But I believe it makes
>> more sense this way since this file can be more cleanly synced in IGT...
>>
>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
>I merged this one to drm-xe-next with Sima's IRC ack.
>
>The drm-tip rebuild works, and handles the merge just fine. But I can't
>apply patches 1 and 3 to topic/xe-for-CI, because it won't build
>standalone. It needs a rebase on drm-xe-next, but I can't push that:
>
>remote: GitLab: You are not allowed to force push code to a protected branch on this project.
>To ssh://gitlab.freedesktop.org/drm/xe/kernel.git
> ! [remote rejected]           topic/xe-for-CI -> topic/xe-for-CI (pre-receive hook declined)
>error: failed to push some refs to 'ssh://gitlab.freedesktop.org/drm/xe/kernel.git'
>
>I'll have to leave the cleanup to you.

We leave the force-push blocked in gitlab to avoid mistakes. When we
need to rebase this branch we go to
https://gitlab.freedesktop.org/drm/xe/kernel/-/settings/repository#js-protected-branches-settings
and temporarily enable it.

I was wondering why patches 1 and 3 were not applying after the
rebase... it turns out the rebase itself already put it in the right
state since it simply drops the hunk that is now applied to drm-xe-next.

Pushed. With force.

thanks
Lucas De Marchi

>
>BR,
>Jani.
>
>
>>
>>> ---
>>>  include/drm/intel/xe_pciids.h | 16 ++++++++++++++++
>>>  1 file changed, 16 insertions(+)
>>>
>>> diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
>>> index 644872a35c35..73d972a8aca1 100644
>>> --- a/include/drm/intel/xe_pciids.h
>>> +++ b/include/drm/intel/xe_pciids.h
>>> @@ -187,6 +187,22 @@
>>>  	MACRO__(0x7DD1, ## __VA_ARGS__),        \
>>>  	MACRO__(0x7DD5, ## __VA_ARGS__)
>>>
>>> +/* PVC */
>>> +#define XE_PVC_IDS(MACRO__, ...)		\
>>> +	MACRO__(0x0B69, ## __VA_ARGS__),	\
>>> +	MACRO__(0x0B6E, ## __VA_ARGS__),	\
>>> +	MACRO__(0x0BD4, ## __VA_ARGS__),	\
>>> +	MACRO__(0x0BD5, ## __VA_ARGS__),	\
>>> +	MACRO__(0x0BD6, ## __VA_ARGS__),	\
>>> +	MACRO__(0x0BD7, ## __VA_ARGS__),	\
>>> +	MACRO__(0x0BD8, ## __VA_ARGS__),	\
>>> +	MACRO__(0x0BD9, ## __VA_ARGS__),	\
>>> +	MACRO__(0x0BDA, ## __VA_ARGS__),	\
>>> +	MACRO__(0x0BDB, ## __VA_ARGS__),	\
>>> +	MACRO__(0x0BE0, ## __VA_ARGS__),	\
>>> +	MACRO__(0x0BE1, ## __VA_ARGS__),	\
>>> +	MACRO__(0x0BE5, ## __VA_ARGS__)
>>> +
>>>  #define XE_LNL_IDS(MACRO__, ...) \
>>>  	MACRO__(0x6420, ## __VA_ARGS__), \
>>>  	MACRO__(0x64A0, ## __VA_ARGS__), \
>>> --
>>> 2.39.2
>>>
>
>-- 
>Jani Nikula, Intel
