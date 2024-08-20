Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B66C531DC
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 14:20:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E49510E147;
	Tue, 20 Aug 2024 14:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mmacQdaW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 363FC10E147
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 14:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724163635; x=1755699635;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TsIzHt3PlTh/Dp9WPfPgivCaL5pQKWHi3QNtbl9XN3s=;
 b=mmacQdaWKnCJhsH+qR2PTt9LWZ5m1tjqX2xE1v1ovYpEx+Tm68P8E3/9
 4nVh//5R1Zv9icDJZ6GG6KbyF3opVtjnnSYhSHPEObAWD3kE6ig22yz6P
 uASGsnffY6fenLE1Qr3yehcQLT4Sp4km+xgdXKDND1cBOXXxD1/r3kqhu
 UF8tE+sh1iMmGskqdrGf5qmefqm99n+jYu7lRKDM30rtvfTV0bvFKFwi1
 9tf3VblV8Y3XFrlfGXv86f3tnIx0FZiCzVvKQzFRnmn+lIQYVComFOtXc
 FYZeiaS5o15UO9bLWgu/EbU5kGI1EZ32oQJRcfLJa7vzyqE2B0xQJjRvj Q==;
X-CSE-ConnectionGUID: vkVl+ETfRt++6bUPJRjizA==
X-CSE-MsgGUID: v3Er+KIIRWidmsGX+sLnWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22322546"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="22322546"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 07:20:00 -0700
X-CSE-ConnectionGUID: nNr+YmYAQRGecdTOXE6pjw==
X-CSE-MsgGUID: yydH12NPQEi0mdSzq3uBVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="98215129"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 07:19:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 07:19:58 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 07:19:58 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 07:19:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VRt+Byam+5P5xpGIlGIYhwBipNDHACH7hwaB8SYAoUoU5CROCNn1i0zzPXqwAEzkRpUfrriaW6xp0U1EYz0V5EyfUUGy8dNOb6UG8PKDffsgNdZa8qkC2yEB2Mw4x81j6eJN+sepyajRSEj7n2L9Vg8kxpRbIve9qESFzS817Hvvm7GgCKjgTPMX+mnHPl+53DRr34VGJiH8MTZiI4W0xWlNc+ns5zCIjc23bnIfcvTbp4vLfYX7Pc65qDnBMbU0horFpkVXT837yHCSOMM+L9lxSQOwReXv1iy0rlaCPavXf3PE8SQ/KaDFbD2YGCwSFrs1/x/mHxHXaWwWJLHiJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEl9iDTJBvuG66CwBP2RDl8FD1qhjc0yz1wgS5p5rYQ=;
 b=xxAJEurpoXcqe9xKuuXdaxmbTBjOF2vHUnbhJGcla98R/WHynEasFT6SF4itcTmF4TW/rhLzFvwa9cpe+dUcWHWq6w/RgRNIqLsClFFfN4DrQQCdZfn3M3y9dR28SyrjYNvAh+dqWzJIkFFed6j/cu8eyOCoFgTbiLduNmcGnO8moVWYfAehxjY/7t7hgGfYD1Z8EMsfOU4aBFd2kBucZwIHxMQlo+36P8xmicOYURlN8fBDC8cKpeJLB8b2hK/ugnHC0E/QL4MTzihqLjYciDsDAlmzp91eJXItIg0Ealq/Ftle/J8YJYwkJ227LBkPIgz8uh69GdkEU33xFzVxIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7453.namprd11.prod.outlook.com (2603:10b6:a03:4cb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 14:19:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.023; Tue, 20 Aug 2024
 14:19:50 +0000
Date: Tue, 20 Aug 2024 09:19:46 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Francois Dugast <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v4] drm/xe: Add driver load error injection
Message-ID: <xed2zn4r4slzuaec5uznxc3h3s2d6z2zib2dapfj7c64fesv6v@7plcvq6llyno>
References: <20240814192322.604388-1-francois.dugast@intel.com>
 <df545392-b906-41a7-bfb9-0462c72688f0@intel.com>
 <bz6aniivkrjofu2uaemuiovjqfjz6emg4euo7kjza3ua63wq6u@7ctci7soa7io>
 <44325fa6-4816-4f96-a065-207ed66da9b6@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44325fa6-4816-4f96-a065-207ed66da9b6@intel.com>
X-ClientProxiedBy: MW4PR03CA0214.namprd03.prod.outlook.com
 (2603:10b6:303:b9::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: aa19f89a-52a5-418b-e18a-08dcc1232712
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?GFi11d+tIx669heJB0FQ9HBY9CcecUK2yIAErIMMbKlYDc6aDYvZoVBarv?=
 =?iso-8859-1?Q?c8RZFccf57X66ZaTTzJUvH7FZLJixD87ky3JSHQ7XMEa1GZubPqwqUzPHc?=
 =?iso-8859-1?Q?J92LPqcq1ZLRF415ebc90VN/cmA1ofaGX92WHlXFZvUk5doe0ggd6VFLvb?=
 =?iso-8859-1?Q?wWis0itf+si4CqMvvx0udPhs1KvNN43y0+CJkQXtwN2n/PsZxozKr+OrFp?=
 =?iso-8859-1?Q?P1ZZLLGaYuu1uPb3V38M+ZcbYT6eOg+P2h5mittpU+vS1oBtkyNpNLIeXX?=
 =?iso-8859-1?Q?K6CfOHkbhleoo2ZJyqAdJKWmHv7BgrEo4sTSBQvOCjlE1aNJTYAy/EbEFG?=
 =?iso-8859-1?Q?kMP4DpXIbvMN1xu0Dg3F9PRHBSt3XcEk7xbQ6Qy/kEH8+nvW5R81+PeEEl?=
 =?iso-8859-1?Q?+tlCO9sTfXHhIGk91a6CEqbRxze9NR5U2UA+Mk3CZb2/9pg7zrm5wEBiSU?=
 =?iso-8859-1?Q?D8vlx+CFXp2XT+zSDGMhkw3fVJdeRRlsLw4EJT9C+JhYA6IIYb++BPGe8D?=
 =?iso-8859-1?Q?XJ5wIIxh/q9kmb0GPyq6IvXoPjLOamRP9yjSTjGgFYllGa/ied1qlWkgHS?=
 =?iso-8859-1?Q?6bv5CXSm+Mb0s3GGYfyVbE/SkOID3MBZv5ED4e86uxlitje3EY7lNK+2k0?=
 =?iso-8859-1?Q?nstsxZoQW9KedD2mljRC3o4M8Yo+mztHSMobuWvK80rCCFu1dtrlk2xtZW?=
 =?iso-8859-1?Q?vRcbYKOzyCOL0mKJZkqIiaD2rnmihJgbh550K6zeIoiveLZY9VRjVWy6DK?=
 =?iso-8859-1?Q?jff9ZWvVB21bgl1r6UffajrdoHA5rw4O0fFHOz5dYPrIdE+qX8f7pXiSlW?=
 =?iso-8859-1?Q?j1SXZdVKeYnOkT9gsk15J51JbzlJAN8P8gcaVGVYRpeUprdpTLNNjgTwsf?=
 =?iso-8859-1?Q?9TarcZGlcNssb7g8ywMXwctItc1COWbvOoFWrwAEn9HiDLW+RSr16nc10S?=
 =?iso-8859-1?Q?skXSnYoFYWStMSBKqGtB838ta+QHqf9+Ahn4bgsYrc7pbVRP3rPhJ7af3z?=
 =?iso-8859-1?Q?rNM0TVqZHWjoYDKYyDP/KERMOMdfasCwiIUMWZ0yzgWED2nhlfAVDIDl+r?=
 =?iso-8859-1?Q?QRWfVaBtGifl49Wn8cIX0ag+uAfg44AuMLb7mzrufBjOJ3yHX+t0Rz8isc?=
 =?iso-8859-1?Q?8le9WLHewUsyiVZFRMkI89dbu1CG5vq7BraGhsqNMerNGGXUv4ciSQQdHW?=
 =?iso-8859-1?Q?jDoK02aiQcuU35oDumnu9k3hUWmDI/N32W37zC2Em69AYyCZXDZ5KEzA1y?=
 =?iso-8859-1?Q?r9fW9aAgzjZD39OS+h1VPoePURQLuyghikhTm2CMWWF2djCVYJq2mW6gSv?=
 =?iso-8859-1?Q?5Arw04W/iQt2BBge5iuUtPxHlMj9wpDtWsvMXExBSiNlDrM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HKtCQSIReLagKej9jISzf9U9GPI/Qg+Lu/IXUIXo7OdMz8g0tiq7XKV3na?=
 =?iso-8859-1?Q?kYAtFdzlWmzMyfn5VmZX9yBlSHgMQGYNVv+htVVQZ9WYbCX5PB7TPwqh9C?=
 =?iso-8859-1?Q?H8a44Z7Ajk5XvZlu5wcgWNsJf82/u+9LOqXm+shVYcUezwYKLHXHcQmx2/?=
 =?iso-8859-1?Q?HKOcbcKdD0POICoEMk/0mo8EojHn3n6Tn12F5W235SXBH7Lb1RpxWFDotJ?=
 =?iso-8859-1?Q?jacDk1Bcj2jqLqQx3P99blVn1haqkztdMgS9ABZ0ZLXSj+u1VdcaiBNeDE?=
 =?iso-8859-1?Q?ljbA4UQ/ISsRFYx9pM2haY/+zYzRjSLoDnKni5Dv/GsZ8EcH1v5bXZWxdJ?=
 =?iso-8859-1?Q?HqbL0x7YryOAwR0xodlcRkw4THU+LvNu1ivGwMSbjF+whRZTUmI8Wda3FE?=
 =?iso-8859-1?Q?SxRQ429ps8zLb6gVAJUPZV2PM9TBNbvki1pMqjMcqd/VFvCKvBKX5DHx73?=
 =?iso-8859-1?Q?JjUpSw6lAQXyA5Pi5ovV3T2ZIob/IAMCe567ZEuCh6xIrfSXuziBU4NMZj?=
 =?iso-8859-1?Q?IiWYhI3F4fha5JT/gNlgIp0Q6PAbLwsiTHpJs5m5YK26asAkafmPXB/afQ?=
 =?iso-8859-1?Q?ZShYQN0aSWztsk3H+tXAoaP4VPy1dQLzIQhXnxQTVg2+tnaWxxhjeZWMN9?=
 =?iso-8859-1?Q?yu0fo/5VZQEGz3bVBv8laEUV0Lds3bYJs7PRmhcHkh2lJQlEcTYvglzBYP?=
 =?iso-8859-1?Q?KfDLg6fODAkBgxH7xYUZe2EQ81lVRUYb3kS1nZK8k9aN8c5TlQnYffUuqo?=
 =?iso-8859-1?Q?j0w74DVdU8ojMi0RKPuenpuUNrJZK4fylK13sMPOmCspg/VejjaTJ/BDMG?=
 =?iso-8859-1?Q?lOrBjJAA3m2exL3cjDKSa49/K2o2UEZVTxZf8BsyiVg9cPxRRDJpOfUaiY?=
 =?iso-8859-1?Q?byDowT6vnqwJIxDqavbdFCynyWXwmrCPHtjAANJ4SWYOwH4JtAwPfiHotx?=
 =?iso-8859-1?Q?0XpUY/5l0Eqxek6hDfa2nf4ynizmfyA8DoF6z5yXV+bxsQ5BTchNzoR3RM?=
 =?iso-8859-1?Q?odoSzIUN6A1racnVPEKdFfgMV8UYVbDvtE7mu4pDSC5SRdnZSa+QqQ7HkR?=
 =?iso-8859-1?Q?ODDnMuxVx9r/gbyrgJnUCpSdQDGBvkMi7df30q/YiJwBsFkf6dqqWWJBpN?=
 =?iso-8859-1?Q?Q0rQPkdNsEZbn9kqnqU6jwvpnYbt1QMr1qHCU2hGmNiEtOFijlqKISAXst?=
 =?iso-8859-1?Q?/SFJBWLQlMpb6VBEeW1vH2zCfBj+fnpAlEPGybiZqQ8SfTILBAvHiqItRR?=
 =?iso-8859-1?Q?wmjyPZbfwTdcRx3Qnuh5jrN/B0bbLdmiUb7EYIf/30PAWQ6YaxA0LwZG+E?=
 =?iso-8859-1?Q?XOEkM6z70vFboc/U9URMLjyOfa6ayBZUonlNI0qRlzVnWOLZaazHqY3YPr?=
 =?iso-8859-1?Q?1smHUp9ZbalWN0BPTzwTlro4Wsi0Bex45lXrVUrJqJ1DSZAW2ic3MM7YYL?=
 =?iso-8859-1?Q?T0Kz8qfnwrHeSVMSxdZo3Qel7WfQyh/tHUaG8HrTVO+lcnEFWo7uQsMtZT?=
 =?iso-8859-1?Q?rDNYc/AsahTMobzq4zd0hulIZ/WTDAU0vsHZJLk0GU/zGUAhP1PZIJ//L+?=
 =?iso-8859-1?Q?ZtmExS/lwijIXctOPrDP/dnyIG+qeYUgsQkwKkVRqAWr5z94J9V2IbyPvK?=
 =?iso-8859-1?Q?6uKa5JnfP7Uy6qo01l8emIUHHASRPSSi7lxn3jcbJQ5+x5HOcQ9FmZYg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa19f89a-52a5-418b-e18a-08dcc1232712
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 14:19:50.6331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zf57ltI+t4p2iNBNGMOEm6RvPT9xzaPYO6OqEbD4HgaA+Q+PNcbe5azmSpz1R6M2TTM9e4shcqkeOcpzWjPnwJ6ix772jZ6sqT6LIWT0AkA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7453
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

On Tue, Aug 20, 2024 at 01:48:47PM GMT, Michal Wajdeczko wrote:
>
>
>On 20.08.2024 00:32, Lucas De Marchi wrote:
>> On Mon, Aug 19, 2024 at 08:54:38PM GMT, Michal Wajdeczko wrote:
>>>
>>>
>>> On 14.08.2024 21:23, Francois Dugast wrote:
>>>> Those new macros inject errors by overriding return codes. They must
>>>> manually be called, typically by turning this pattern:
>>>>
>>>>     err = foo();
>>>>     if (err)
>>>>         return err;
>>>>
>>>> into:
>>>>
>>>>     err = foo();
>>>>     err = xe_device_inject_driver_probe_error(xe, err);
>>>>     if (err)
>>>>         return err;
>>>
>>> why do we want to pollute the code with such strange pattern?
>>> it actually may also introduce same fake errors as in example above
>>> foo() might expect that there is a foo_fini() which will be called on
>>> non-failure path...
>>
>> see the xe_device_inject_driver_probe_error_override() impl as that is
>> handled. 
>
>hmm, maybe I'm still missing something but there you are just skipping
>error injection on real error case
>
>> Goal was not to change any code path and this is done by avoid
>> changing the control flow.
>
>but injecting an error _after_ successful call to foo() and the using
>error path is IMO a change to the flow

right, should have been before the call

>
>>
>> in this case the diff is actually a single line.
>>
>>     err = foo();
>> +    err = xe_device_inject_driver_probe_error_override(xe, err);
>>     if (err)
>>         return err;
>>
>> all the control flow was already there, it's not added.
>
>but it is polluted by this extra single line *per* condition
>
>>
>>>
>>>
>>> maybe easier/cleaner way would be to use other pattern where we inject
>>> an error at the start of the inner function that we expect to fail:
>>
>> because we can't always do this in the inner function.
>
>then we should either wrap that function:
>
>static int our_foo(xe)
>{
>	int err = xe_device_inject_driver_probe_error(xe);
>
>	if (err)
>		return err;
>	return foo();
>}

in order to do this  I think we need to check if in the long term
it will remain like that. I don't like doing this refactor for the sake
of error injection if that's not going to be relevant later. I'd
rather keep it minimal

>
>or inject an error _before_ calling it:
>
>...
>	err = xe_device_inject_driver_probe_error(xe);
>	if (err)
>		goto foo_failed;
>	
>	err = foo()
>	if (err)
>		goto foo_failed;
>

and the problem with this pattern is being able to maintain it with the
error handling kept in sync. Too often things are inserted in the middle
of initialization sequence and end up breaking it.... besides being
verbose :(. But you have a point about "doing it later may cause
unintended issues".

So maybe focus should be to try harder to add it in the beginning of the
functions.

>>
>>>
>>> int foo(xe)
>>> {
>>>     int err;
>>>
>>>     err = xe_device_inject_driver_probe_error(xe);
>>>     if (err)
>>>         return err;
>>
>> yes, when we can do it in the beginning of the function, it should be
>> preferred.
>
>but commit message suggests something different
>
>
>>>     ...
>>>     return 0;
>>> }
>>>
>>> or even use some macro as a function prologue:
>>>
>>> #define XE_DEVICE_ERROR_INJECTION(xe, err) do {        \
>>>     if (xe_device_inject_driver_probe_error(xe))    \
>>>         return (err);                \
>>> } while(0)
>>
>> no, let's not go there as everything here should go away in favor of
>> proper error injection from core kernel. Not our own subsystem inside
>> xe.
>
>but with very little effort, and minimal code changes could be much more
>effective to quickly cover probe errors

I think most of the errors are covered at https://patchwork.freedesktop.org/series/137114/

First 4 were applied. Patches 6-11 need to be reviewed and IMO should be
independent of getting this applied.

Lucas De Marchi

>
>>
>> also a macro that returns the current function is not better than the
>> pattern above.
>
>but OTOH it is similar what KUNIT_STATIC_STUB_REDIRECT() does
>
>so at extreme we could just treat such macro as kind of annotation that
>is harmless to the code unless we turn on error injection (at probe time
>or by some other tests, until core error-injection will be fully enabled
>in Xe)
>
>btw, core error-injection is also adding one line macro per function,
>just outside of it
>
>
>>
>>>
>>> #define XE_DEVICE_ERROR_INJECTION_SIMPLE(xe) \
>>>     XE_DEVICE_ERROR_INJECTION((xe), -ENODEV)
>
>#define XE_DEVICE_ERROR_INJECTION_HELPER(name, xe) \
>	xe_device_error_injection_##name(xe)
>
>#define DEFINE_XE_DEVICE_ERROR_INJECTION_HELPER(name, xe)	\
>	static int xe_device_error_injection_##name(xe)		\
>	{ XE_DEVICE_ERROR_INJECTION_SIMPLE(xe); }
>
>>>
>>> int foo(xe, params)
>>> {
>>>     int vars;
>>>
>>>     XE_DEVICE_ERROR_INJECTION_SIMPLE(xe);
>>>     ...
>>>     return err;
>>> }
>>>
>>> xe_ptr *bar(gt, params)
>>> {
>>>     int vars;
>>>
>>>     XE_DEVICE_ERROR_INJECTION(gt_to_xe(gt), ERR_PTR(-ENOMEM));
>>>     ...
>>>     return ptr;
>>> }
>>>
>>> then we don't mess with any error handling code that should be clean
>>
>> instead of foo and bar, try to do this in the real functions in this
>
>1)
>
> +    err = XE_DEVICE_ERROR_INJECTION_HELPER(ttm_device_init, xe)
> +    if (err)
> +        goto err;
>
>      err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
>                    xe->drm.anon_inode->i_mapping,
>                    xe->drm.vma_offset_manager, false, false);
>      if (WARN_ON(err))
>          goto err;
>
>btw, when injecting an error _after_ the call to ttm_device_init() you
>will leak few things as there is ttm_device_fini() which should be
>called when ttm_device_init() was successful
>
>
>
>> patch. I'd rather spend time converting this to use proper error
>> injection, writting the appropriate igt, etc.
>
>this still could be done in parallel ;)
>
>>
>> right now it's a hack that allows us to find the issues with error-paths
>> during probe.
>
>true, but we should also make sure to not introduce false positives
>
>>
>>>
>>>>
>>>> When CONFIG_DRM_XE_DEBUG is not set, this has no effect.
>>>>
>>>> When CONFIG_DRM_XE_DEBUG is set, the error code at checkpoint X will
>>>> be overridden when the module argument inject_driver_load_error is
>>>> set to value X. By doing so, it is possible to test proper error
>>>> handling and improve robustness for current and future code. A few
>>>> injection points are added in this patch but more need to be added.
>>>> One way to use this error injection at driver probe is:
>>>>
>>>>     for i in {1..200}; do echo "Run $i"; modprobe xe
>>>> inject_driver_probe_error=$i; rmmod xe; done
>>>>
>>>> In the future this is expected to be replaced by the infrastructure
>>>> provided by fault-inject.h
>>>
>>> +1
>>>
>>>>
>>>> v2: Fix style and build errors, modparam to 0 after probe, rename to
>>>>     xe_device_inject_driver_probe_error, check type when compiled out,
>>>>     add _return macro, move some uses to the beginning of the function
>>>> v3: Rebase
>>>> v4: Improve commit message and comments, keep if/return rather than
>>>>     change the flow inside the macro (Lucas De Marchi)
>>>>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/xe_device.c       | 41 ++++++++++++++++++++++++++++
>>>>  drivers/gpu/drm/xe/xe_device.h       | 23 ++++++++++++++++
>>>>  drivers/gpu/drm/xe/xe_device_types.h |  5 ++++
>>>>  drivers/gpu/drm/xe/xe_gt.c           |  2 ++
>>>>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c  |  2 ++
>>>>  drivers/gpu/drm/xe/xe_guc.c          |  2 ++
>>>>  drivers/gpu/drm/xe/xe_guc_ct.c       |  1 +
>>>>  drivers/gpu/drm/xe/xe_mmio.c         |  5 ++++
>>>>  drivers/gpu/drm/xe/xe_module.c       |  5 ++++
>>>>  drivers/gpu/drm/xe/xe_module.h       |  3 ++
>>>>  drivers/gpu/drm/xe/xe_pci.c          |  6 ++++
>>>>  drivers/gpu/drm/xe/xe_pm.c           |  5 ++++
>>>>  drivers/gpu/drm/xe/xe_sriov.c        |  6 ++++
>>>>  drivers/gpu/drm/xe/xe_tile.c         |  4 +++
>>>>  drivers/gpu/drm/xe/xe_uc.c           |  1 +
>>>>  drivers/gpu/drm/xe/xe_wa.c           |  5 ++++
>>>>  drivers/gpu/drm/xe/xe_wopcm.c        |  4 +++
>>>>  17 files changed, 120 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>>>> b/drivers/gpu/drm/xe/xe_device.c
>>>> index 206328387150..a2ccdc4115ac 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>> @@ -316,6 +316,7 @@ struct xe_device *xe_device_create(struct pci_dev
>>>> *pdev,
>>>>      err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
>>>>                    xe->drm.anon_inode->i_mapping,
>>>>                    xe->drm.vma_offset_manager, false, false);
>>>> +    err = xe_device_inject_driver_probe_error_override(xe, err);
>>>>      if (WARN_ON(err))
>>>>          goto err;
>>>>
>>>> @@ -474,6 +475,7 @@ static int xe_set_dma_info(struct xe_device *xe)
>>>>          goto mask_err;
>>>>
>>>>      err = dma_set_coherent_mask(xe->drm.dev, DMA_BIT_MASK(mask_size));
>>>> +    err = xe_device_inject_driver_probe_error_override(xe, err);
>>>>      if (err)
>>>>          goto mask_err;
>>>>
>>>> @@ -577,6 +579,7 @@ int xe_device_probe_early(struct xe_device *xe)
>>>>          return err;
>>>>
>>>>      err = wait_for_lmem_ready(xe);
>>>> +    err = xe_device_inject_driver_probe_error_override(xe, err);
>>>>      if (err)
>>>>          return err;
>>>>
>>>> @@ -745,6 +748,11 @@ int xe_device_probe(struct xe_device *xe)
>>>>      for_each_gt(gt, xe, id)
>>>>          xe_gt_sanitize_freq(gt);
>>>>
>>>> +#ifdef CONFIG_DRM_XE_DEBUG
>>>> +    /* After probe finishes, stop checking for error injection */
>>>> +    xe_modparam.inject_driver_probe_error = 0;
>>>> +#endif
>>>
>>> this should be wrapped in some kind of
>>>
>>> xe_device_inject_driver_probe_error_finish()
>>>
>>> to avoid #ifdef in the code
>>
>> agreed
>>
>>>
>>>> +
>>>>      return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize,
>>>> xe);
>>>>
>>>>  err_fini_display:
>>>> @@ -995,3 +1003,36 @@ void xe_device_declare_wedged(struct xe_device
>>>> *xe)
>>>>      for_each_gt(gt, xe, id)
>>>>          xe_gt_declare_wedged(gt);
>>>>  }
>>>> +
>>>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>>> +/**
>>>> + * __xe_device_inject_driver_probe_error - Inject an error during
>>>> device probe
>>>> + * @xe: xe device instance
>>>> + * @err_injected: the error to inject
>>>> + * @err_real: the error returned by the actual function
>>>> + * @func: the name of the function where this is called from
>>>> + * @line: the line where this is called from
>>>> + *
>>>> + * This is not meant to be called directly, only through
>>>> xe_device_inject_driver_probe_error.
>>>> + *
>>>> + * Return: err_real if != 0, err_injected otherwise
>>>> + */
>>>> +int __xe_device_inject_driver_probe_error(struct xe_device *xe, int
>>>> err_injected, int err_real,
>>>> +                      const char *func, int line)
>>>> +{
>>>> +    if (err_real != 0)
>>>> +        return err_real;
>>>> +
>>>> +    if (xe->inject_driver_probe_error >=
>>>> xe_modparam.inject_driver_probe_error)
>>>> +        return 0;
>>>> +
>>>> +    if (++xe->inject_driver_probe_error <
>>>> xe_modparam.inject_driver_probe_error)
>>>> +        return 0;
>>>> +
>>>> +    drm_info(&xe->drm, "Injecting failure %d at checkpoint %u
>>>> [%s:%d]\n",
>>>> +         err_injected, xe->inject_driver_probe_error, func, line);
>>>
>>> after error injection, some caller code could still report this as real
>>> *ERROR*, so maybe, if this solution will be for a while, it's worth to
>>> consider adding set of xe_err(xe, ...) macros where we could potentially
>>> hide fake errors to make CI happy
>>>
>>>> +
>>>> +    xe_modparam.inject_driver_probe_error = 0;
>>>> +    return err_injected;
>>>> +}
>>>> +#endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_device.h
>>>> b/drivers/gpu/drm/xe/xe_device.h
>>>> index 2c96f1b2aafd..0d0187819e92 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device.h
>>>> +++ b/drivers/gpu/drm/xe/xe_device.h
>>>> @@ -184,4 +184,27 @@ void xe_device_declare_wedged(struct xe_device
>>>> *xe);
>>>>  struct xe_file *xe_file_get(struct xe_file *xef);
>>>>  void xe_file_put(struct xe_file *xef);
>>>>
>>>> +#define XE_DEVICE_INJECTED_ERR -ENODEV
>>>> +#define xe_device_inject_driver_probe_error(__xe) \
>>>> +    __xe_device_inject_driver_probe_error(__xe,
>>>> XE_DEVICE_INJECTED_ERR, 0, __func__, __LINE__)
>>>> +#define xe_device_inject_driver_probe_error_override(__xe,
>>>> __err_real) \
>>>> +    __xe_device_inject_driver_probe_error(__xe,
>>>> XE_DEVICE_INJECTED_ERR, __err_real, __func__, \
>>>> +                          __LINE__)
>>>
>>> all above should be under CONFIG_DRM_XE_DEBUG, no?
>>
>> why? simply providing the stub below makes it go away when
>> !CONFIG_DRM_XE_DEBUG
>> and still provides type checking to avoid breaking the build without it
>> (and without resorting to typecheck.h)
>
>but in current version only xe_device_inject_driver_probe_error() is
>user-accessible and only this one needs a stub in #else
>
>everything else is implementation detail, which could be hidden in #if
>CONFIG_XE_DEBUG, as only there you are trying to add/use __file__, LINE
>and ERR
>
>>
>>
>> Lucas De Marchi
>>
>>>
>>>> +
>>>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>>> +
>>>> +int __xe_device_inject_driver_probe_error(struct xe_device *xe,
>>>> +                      int err_injected, int err_real,
>>>> +                      const char *func, int line);
>>>> +#else
>>>> +
>>>> +static inline int __xe_device_inject_driver_probe_error(struct
>>>> xe_device *xe,
>>>> +                            int err_injected, int err_real,
>>>> +                            const char *func, int line)
>>>> +{
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +#endif
>>>
>>> and maybe it should be in xe_debug.h ?
>>>
>>>> +
>>>>  #endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>>>> b/drivers/gpu/drm/xe/xe_device_types.h
>>>> index 16a24eadd94b..5097376aec28 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>> @@ -491,6 +491,11 @@ struct xe_device {
>>>>          int mode;
>>>>      } wedged;
>>>>
>>>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>>> +    /** @inject_driver_probe_error: Counter used for error injection
>>>> during probe */
>>>> +    int inject_driver_probe_error;
>>>> +#endif
>>>> +
>>>>  #ifdef TEST_VM_OPS_ERROR
>>>>      /**
>>>>       * @vm_inject_error_position: inject errors at different places
>>>> in VM
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>>> index 58895ed22f6e..b90acc7eedba 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>>> @@ -378,6 +378,7 @@ int xe_gt_init_early(struct xe_gt *gt)
>>>>      xe_reg_sr_init(&gt->reg_sr, "GT", gt_to_xe(gt));
>>>>
>>>>      err = xe_wa_init(gt);
>>>> +    err = xe_device_inject_driver_probe_error_override(gt_to_xe(gt),
>>>> err);
>>>>      if (err)
>>>>          return err;
>>>>
>>>> @@ -564,6 +565,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
>>>>          goto out_fw;
>>>>
>>>>      err = xe_uc_init_hwconfig(&gt->uc);
>>>> +    err = xe_device_inject_driver_probe_error_override(gt_to_xe(gt),
>>>> err);
>>>>      if (err)
>>>>          goto out_fw;
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>>>> b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>>>> index ef239440963c..09e1fe745ada 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>>>> @@ -7,6 +7,7 @@
>>>>
>>>>  #include "regs/xe_regs.h"
>>>>
>>>> +#include "xe_device.h"
>>>>  #include "xe_gt_sriov_pf.h"
>>>>  #include "xe_gt_sriov_pf_config.h"
>>>>  #include "xe_gt_sriov_pf_helpers.h"
>>>> @@ -54,6 +55,7 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
>>>>          return err;
>>>>
>>>>      err = xe_gt_sriov_pf_service_init(gt);
>>>> +    err = xe_device_inject_driver_probe_error_override(gt_to_xe(gt),
>>>> err);
>>>>      if (err)
>>>>          return err;
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>> index de0fe9e65746..74e598294f90 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>> @@ -351,6 +351,7 @@ int xe_guc_init(struct xe_guc *guc)
>>>>          goto out;
>>>>
>>>>      ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
>>>> +    ret =
>>>> xe_device_inject_driver_probe_error_override(guc_to_xe(guc), ret);
>>>>      if (ret)
>>>>          goto out;
>>>>
>>>> @@ -408,6 +409,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>>>>          return ret;
>>>>
>>>>      ret = xe_guc_pc_init(&guc->pc);
>>>> +    ret =
>>>> xe_device_inject_driver_probe_error_override(guc_to_xe(guc), ret);
>>>>      if (ret)
>>>>          return ret;
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> index beeeb120d1fc..ed715a252f6a 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> @@ -194,6 +194,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>>>>      ct->bo = bo;
>>>>
>>>>      err = drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
>>>> +    err = xe_device_inject_driver_probe_error_override(xe, err);
>>>>      if (err)
>>>>          return err;
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>>>> index bdcc7282385c..af322f5c8159 100644
>>>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>>>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>>>> @@ -136,6 +136,11 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
>>>>  {
>>>>      size_t tile_mmio_size = SZ_16M;
>>>>      size_t tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
>>>> +    int err;
>>>> +
>>>> +    err = xe_device_inject_driver_probe_error(xe);
>>>> +    if (err)
>>>> +        return err;
>>>>
>>>>      mmio_multi_tile_setup(xe, tile_mmio_size);
>>>>      mmio_extension_setup(xe, tile_mmio_size, tile_mmio_ext_size);
>>>> diff --git a/drivers/gpu/drm/xe/xe_module.c
>>>> b/drivers/gpu/drm/xe/xe_module.c
>>>> index 923460119cec..806b6c1f8a7f 100644
>>>> --- a/drivers/gpu/drm/xe/xe_module.c
>>>> +++ b/drivers/gpu/drm/xe/xe_module.c
>>>> @@ -53,6 +53,11 @@ module_param_named_unsafe(force_probe,
>>>> xe_modparam.force_probe, charp, 0400);
>>>>  MODULE_PARM_DESC(force_probe,
>>>>           "Force probe options for specified devices. See
>>>> CONFIG_DRM_XE_FORCE_PROBE for details.");
>>>>
>>>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>>> +module_param_named_unsafe(inject_driver_probe_error,
>>>> xe_modparam.inject_driver_probe_error, int, 0600);
>>>> +MODULE_PARM_DESC(inject_driver_probe_error, "Inject driver probe
>>>> error");
>>>> +#endif
>>>> +
>>>>  #ifdef CONFIG_PCI_IOV
>>>>  module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
>>>>  MODULE_PARM_DESC(max_vfs,
>>>> diff --git a/drivers/gpu/drm/xe/xe_module.h
>>>> b/drivers/gpu/drm/xe/xe_module.h
>>>> index 161a5e6f717f..47cefaf8d79b 100644
>>>> --- a/drivers/gpu/drm/xe/xe_module.h
>>>> +++ b/drivers/gpu/drm/xe/xe_module.h
>>>> @@ -20,6 +20,9 @@ struct xe_modparam {
>>>>      char *force_probe;
>>>>  #ifdef CONFIG_PCI_IOV
>>>>      unsigned int max_vfs;
>>>> +#endif
>>>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>>> +    int inject_driver_probe_error;
>>>>  #endif
>>>>      int wedged_mode;
>>>>  };
>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>>> index 3c34b032ebf4..bac07779d353 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>>> @@ -626,6 +626,7 @@ static int xe_info_init_early(struct xe_device *xe,
>>>>                   desc->has_display;
>>>>
>>>>      err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
>>>> +    err = xe_device_inject_driver_probe_error_override(xe, err);
>>>>      if (err)
>>>>          return err;
>>>>
>>>> @@ -645,8 +646,13 @@ static int xe_info_init(struct xe_device *xe,
>>>>      u32 graphics_gmdid_revid = 0, media_gmdid_revid = 0;
>>>>      struct xe_tile *tile;
>>>>      struct xe_gt *gt;
>>>> +    int err;
>>>>      u8 id;
>>>>
>>>> +    err = xe_device_inject_driver_probe_error(xe);
>>>> +    if (err)
>>>> +        return err;
>>>> +
>>>>      /*
>>>>       * If this platform supports GMD_ID, we'll detect the proper IP
>>>>       * descriptor to use from hardware registers. desc->graphics
>>>> will only
>>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>>>> index 9f3c14fd9f33..2de8383b745d 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>>> @@ -228,6 +228,7 @@ int xe_pm_init_early(struct xe_device *xe)
>>>>          return err;
>>>>
>>>>      err = drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
>>>> +    err = xe_device_inject_driver_probe_error_override(xe, err);
>>>>      if (err)
>>>>          return err;
>>>>
>>>> @@ -246,6 +247,10 @@ int xe_pm_init(struct xe_device *xe)
>>>>  {
>>>>      int err;
>>>>
>>>> +    err = xe_device_inject_driver_probe_error(xe);
>>>> +    if (err)
>>>> +        return err;
>>>> +
>>>>      /* For now suspend/resume is only allowed with GuC */
>>>>      if (!xe_device_uc_enabled(xe))
>>>>          return 0;
>>>> diff --git a/drivers/gpu/drm/xe/xe_sriov.c
>>>> b/drivers/gpu/drm/xe/xe_sriov.c
>>>> index 5a1d65e4f19f..b19b06c72870 100644
>>>> --- a/drivers/gpu/drm/xe/xe_sriov.c
>>>> +++ b/drivers/gpu/drm/xe/xe_sriov.c
>>>> @@ -102,9 +102,15 @@ static void fini_sriov(struct drm_device *drm,
>>>> void *arg)
>>>>   */
>>>>  int xe_sriov_init(struct xe_device *xe)
>>>>  {
>>>> +    int err;
>>>> +
>>>>      if (!IS_SRIOV(xe))
>>>>          return 0;
>>>>
>>>> +    err = xe_device_inject_driver_probe_error(xe);
>>>> +    if (err)
>>>> +        return err;
>>>> +
>>>>      if (IS_SRIOV_PF(xe)) {
>>>>          int err = xe_sriov_pf_init_early(xe);
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>>>> index 15ea0a942f67..d70f1f61c096 100644
>>>> --- a/drivers/gpu/drm/xe/xe_tile.c
>>>> +++ b/drivers/gpu/drm/xe/xe_tile.c
>>>> @@ -124,6 +124,10 @@ int xe_tile_init_early(struct xe_tile *tile,
>>>> struct xe_device *xe, u8 id)
>>>>      if (IS_ERR(tile->primary_gt))
>>>>          return PTR_ERR(tile->primary_gt);
>>>>
>>>> +    err = xe_device_inject_driver_probe_error(xe);
>>>> +    if (err)
>>>> +        return err;
>>>> +
>>>>      return 0;
>>>>  }
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>>>> index 0d073a9987c2..0c40fbdf21ee 100644
>>>> --- a/drivers/gpu/drm/xe/xe_uc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>>>> @@ -59,6 +59,7 @@ int xe_uc_init(struct xe_uc *uc)
>>>>          return 0;
>>>>
>>>>      ret = xe_wopcm_init(&uc->wopcm);
>>>> +    ret = xe_device_inject_driver_probe_error_override(uc_to_xe(uc),
>>>> ret);
>>>>      if (ret)
>>>>          goto err;
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>>>> index 28b7f95b6c2f..156a77b27593 100644
>>>> --- a/drivers/gpu/drm/xe/xe_wa.c
>>>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>>>> @@ -825,6 +825,7 @@ int xe_wa_init(struct xe_gt *gt)
>>>>      struct xe_device *xe = gt_to_xe(gt);
>>>>      size_t n_oob, n_lrc, n_engine, n_gt, total;
>>>>      unsigned long *p;
>>>> +    int err;
>>>>
>>>>      n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
>>>>      n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
>>>> @@ -836,6 +837,10 @@ int xe_wa_init(struct xe_gt *gt)
>>>>      if (!p)
>>>>          return -ENOMEM;
>>>>
>>>> +    err = xe_device_inject_driver_probe_error(xe);
>>>> +    if (err)
>>>> +        return err;
>>>> +
>>>>      gt->wa_active.gt = p;
>>>>      p += n_gt;
>>>>      gt->wa_active.engine = p;
>>>> diff --git a/drivers/gpu/drm/xe/xe_wopcm.c
>>>> b/drivers/gpu/drm/xe/xe_wopcm.c
>>>> index d3a99157e523..c9be9d31d3ae 100644
>>>> --- a/drivers/gpu/drm/xe/xe_wopcm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_wopcm.c
>>>> @@ -263,6 +263,10 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
>>>>          return -E2BIG;
>>>>      }
>>>>
>>>> +    ret = xe_device_inject_driver_probe_error(xe);
>>>> +    if (ret)
>>>> +        return ret;
>>>> +
>>>>      if (!locked)
>>>>          ret = __wopcm_init_regs(xe, gt, wopcm);
>>>>
