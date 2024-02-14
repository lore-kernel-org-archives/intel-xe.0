Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E626BC48BC3
	for <intel-xe@archiver.kernel.org>; Wed, 14 Feb 2024 19:22:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8107710E311;
	Wed, 14 Feb 2024 19:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j0zuowlD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A53B10E311
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Feb 2024 19:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707938535; x=1739474535;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=okrqs9t4g/LT0KRECa3jS2i1vnBo6Xey9JKamDFwG/U=;
 b=j0zuowlDKjtZZQxU6MCAl9L6NfINROrUiKBZ0vnDfbLOeFD+y8eVSSD0
 BYhTze+yF3khBvaKDggaFpWlM8OZ7SH0mG013+EGATF7e/rzAq1OP1HlQ
 060UniUHCyrmRblmPj2+auOI1+JNeBN2DuiJPRxhJ+7yfoH8hSjXIf99N
 NcJHyC2kiUCkKCdFw6Bc25RBmlRon61k5nIUNTdMjzEWVTGQnpReUIOy8
 P8hTOSWHQEDo5erKDFtKjQJmLprWNIrMirpGdtOWOEiHa+ZB/cekjI6Qh
 uIOJRP0ZrP/EbTgGnSYnOjIxZZRC/milYyyw+k32MOXwrP5uEGf9unf4J w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="12720211"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; d="scan'208";a="12720211"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 11:22:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="3293267"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2024 11:22:14 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 11:22:14 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 11:22:13 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 14 Feb 2024 11:22:13 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 14 Feb 2024 11:22:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZ9rRg6v4l+Y2bu3nHcnm9JmJ32nww8/8B4Vg77C8ChszfXuazrFDLneYb643orZarjBbLfsc7zv+jUiQUAo9R7Agf+QbIJ8HIXopL4LkhzVBw/62xvuhlVxtVo2kf0yZcT4AjLNBlhXQBUN6tHLO9zSYTpvUweXHxsF9jvQli10n8tYcWYLrm9wZ4Tm5ISME6/X/bWMCZbO/FJWixS2BAnTxTugZKAwDNnF1b43Db5lFpgGdorrOtrnu+iVqb6evIiZw3p0/hFtstVc5k0kOlTZoaXHDwc/mW+GOZ80LzGCeNesTd0bbHn0jXUy7omn0x6iMRmlp3S5Wy4bFqrRQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1KlZczUB3piN9FYK56NCPhb0UtSOWHk/cCcH3HE7pw=;
 b=lcDGN1N0lDwvh6Snge0mKSqT1DxORc7Dx820ap+HPioMB63cezZxQvThkKqw4GW5IkDVfYt/j+4LZkby6lWROph0B+Keu4UvMvfD6EHyMxbl81Esz+hty7R6iMo3Q+2sZQYukggPA7GXxbdnW11QiTbx/6i3/lBjXCP0oOzOnvD4R/MLX7elDMWVY3YJJ9ywWcyTJQ0MrbzSFglJNQKLMEPVuzl4e88JqC0FyLpNSHwp6WnldwIjNovbY69ZBPT6WbPcev9xyo0zlSj+IQeYvWI4OVu1ghPVMxBQJ5oo9+cYQwyibR1CFH4TyD+RMpJ7ih2i9e1tIwac5QsibSSdzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ2PR11MB8539.namprd11.prod.outlook.com (2603:10b6:a03:56e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.41; Wed, 14 Feb
 2024 19:22:09 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::64e6:ee24:79f8:efa]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::64e6:ee24:79f8:efa%4]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 19:22:09 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <qj734bhlz3yprl7y7eyb5fj2wzvumv4m3ehvh5kg7rseugsrjn@wjljwsrxsyft>
References: <20240206234103.373364-1-daniele.ceraolospurio@intel.com>
 <bbb3bc27-73cd-47e4-bdb2-8a12e8aaf2ca@intel.com>
 <ZcL5c1TTfCxUckCi@DUT025-TGLU.fm.intel.com>
 <zcvxg35dgst3vffu76v532dhl5lob6ilpi3hktg4ptnqc6lsbd@dsrjrmgk2kdj>
 <6d27be6f-f501-4bba-a8f9-ae80f23484bd@intel.com>
 <v5mwvlynhfvcre2iudh3am34y7eh4llhifj32gw3l56g4idvw6@uo6rutzsqmyl>
 <d37b18a9-ab2d-478b-9510-087c8ff76ec5@intel.com>
 <qj734bhlz3yprl7y7eyb5fj2wzvumv4m3ehvh5kg7rseugsrjn@wjljwsrxsyft>
Subject: Re: Re: [RFC] drm/xe/guc: Don't support GuC older GuC 70.x releases
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, John Harrison
 <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>, Matt Roper
 <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Date: Wed, 14 Feb 2024 16:22:03 -0300
Message-ID: <170793852364.56490.8544413096300747144@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR03CA0306.namprd03.prod.outlook.com
 (2603:10b6:303:dd::11) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ2PR11MB8539:EE_
X-MS-Office365-Filtering-Correlation-Id: 043167de-099b-4a37-be4e-08dc2d923cf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3D0YmJFtRl4jPnJH0E65rnd6OhTR93ibakP8GGU0NC4cgpIgtbkig4DknwzOMuqMb27HEzAU2AmCdcKe2j+RonecBCp/ctCsk+WlUApgDPwfGgqrHV2qBQtj040W5Mcy8UXWY/IXludcDKmN4LPvXTWZ0WyQNyjdJgyRr0FxXW+oJrcS0VGkLrNI1pZHq3KcPmwkVsoXDrHHKtTu18kNT6ZAYIpqysyYxZf6Y2lHP+1BDBDWR7vpWwp3FTSwCwi/z2pD4A4KjMe3hJPMb3Qt5AzYiqt3quko0n9SDgxodohvrgEJek82wlfUpqx52BARqkCFzh5oOpXBGc0oCHuIkwm7sxU2p/Jyl+kN75kqRwARl7urG5DPCacAhXyL7xFPYCmfZEKDtG/0F5Tqgu8B2f6G/KrLiKnxP4wum82xvxcISPJFfG1UVGG1qSIbyqXIBdHDYHVWm+YjtMCHpwc/NzQyCoEJxKtWNyR62IES6GPT4SMAidvka27JAvhO6DiHWCuYwF2rFL3NV7wWOidAnvAoL9dXN8GytzWeGUL0DGMCxXTeJWP48Ala9Akz8PV6Zhd21ZO2Y0WNAZ6ZFq5W0R+JEh5uK2mWC4O3RTzNWSqnBWBWPBKPSAxBX4bx5Rg3sgELF9K29M6g1Hev7hbRBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(136003)(39860400002)(396003)(366004)(346002)(230273577357003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(30864003)(2906002)(8936002)(8676002)(4326008)(44832011)(66899024)(33716001)(83380400001)(107886003)(26005)(38100700002)(82960400001)(86362001)(6506007)(54906003)(110136005)(66946007)(6636002)(316002)(6666004)(66556008)(66476007)(5660300002)(6512007)(9686003)(478600001)(6486002)(966005)(41300700001)(16122699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0xkUU9NbGJYeWFsZFBxSkhjSnpMWXhReXlLcHpveFdGVmlKWktrcHgrdHM3?=
 =?utf-8?B?WnphRHRDbTBIVEUySGFGeDBoamEzcFBoM2FVa0plNGpBaGF6dFBuaHh6RW9v?=
 =?utf-8?B?blZUSlp0bk04bGlUdSt6WTduNW9qWW5lMDRhL1ZHRWtGWjFSYUtZc2VNNk9M?=
 =?utf-8?B?dEZlVTJqc09YYXVaYVVKUXlZOGh0bE93eGRMRmFicVBlalJJY1pLUVNOZFRL?=
 =?utf-8?B?NUVsVnRuQVJGVS8ySHZBVjlwQnFrdG91ZnVoUjhwMTdVVGMvNFZZamxaK2Fr?=
 =?utf-8?B?K1l6cDR5WlVlaDkrRnhtVldUc0pCZmFnaWV2bFJkYThPL1hVNnEreE1Yb21V?=
 =?utf-8?B?MGxpQ3kxcHhFVmJFTDUxa0c1NkFFV01Rc1M5UHJUcWh1eFFkUCtwQ0pzTkxm?=
 =?utf-8?B?OTB0MHVlZTZnemNueW91NmMxSmprcHh5ZGJvTlpwcDNRZ25PeEl1a09EdXI4?=
 =?utf-8?B?VzU4QWtWNFJsclBkN0QzQWxLU2xSWW1rZ1lySWQ3R00xZm9GcW5xRWNaV1d0?=
 =?utf-8?B?MHdtRytzdGNqZk4zb2p6N2NmSE15RjJBSXdrZTZiWUJFeCtaajFadm9zbDht?=
 =?utf-8?B?cm1NTGc1cmlKQ2JUQUM0SEV6SDd6bC9tRzhqWXcxV3BVSC9jbW1TcGFlV25k?=
 =?utf-8?B?WHVwRzQxRDk2VWs4NHYyMitGVFFZM3gvV3dTektKenVkRVJtY3BQRTBVbTNp?=
 =?utf-8?B?Y3hOOEM2V09OK2pFL29iNkxxblZIZVFCY05ndVh3aXdYdjdmZTRYckdhRTJv?=
 =?utf-8?B?UjVuRFhTRE1pVG5zeHdOVXhVQTMraGFEOVpGNTNFaUZSNmwveGNFWFZQZ3Ry?=
 =?utf-8?B?WGY1UDlVV1g5clhJdXRlaUIrRHI1QkU2NzVTMm83elZtenNUQUp4R3g5ZDB6?=
 =?utf-8?B?OUZDSjkzZ3JFMll1M0dHdGorSDVjcmwzSVpNSXlJQkc2YWx3Z095dkdiY2Y4?=
 =?utf-8?B?NXhHeXkvemFlRVhBaDFXL0h3UWEveTdsYUxCTGpOZkhVajNPeDZGbkpWRkZl?=
 =?utf-8?B?MTJTVkhZN1grdnQ2cmtlVnZhaE96R0lybForNUFvMStlN2RBdUVHeHlkUEJm?=
 =?utf-8?B?VXhTcGtPUlVjK1I3YTVZNVZ2ZUpxbVZ2WVNMWjhyVEt0NTJHWkxWKzBrR2ho?=
 =?utf-8?B?cjY4Q3A2bmtUbS9NbjJiYXAyWUNkUDY0eTg1dFh1dk5PZTlIaG11NDJlKzI2?=
 =?utf-8?B?LzBFMkZqKzMveXZvU210d3l0QmVINlZYL2VjMzU5LzlsWGZ1dFVjeGorNHJs?=
 =?utf-8?B?V1NNbEUzd2dFWTVYd0VaN0ZtYng4WWxIbk5KYlNwSVJweFFkUStaSmRWczBw?=
 =?utf-8?B?NVdmNkRGRFBQc2RWeXNjYmlQdHZwYVlvcFdSTW9qRC9WMFk5M1JuYzFRSElG?=
 =?utf-8?B?cE9zQW1kOTJuT0RJOGxsbldsQUFSTmkvMlZ2QjkybDU2R0tqSU5rRWV3b0wz?=
 =?utf-8?B?N1ZDU2U4VEswQ2pWaFpKb0IzY21CT1RTQkRVRURQN2lQNXRiRlVDSXQzeXJY?=
 =?utf-8?B?eUFBc3RmalRXVXZqVy9XVnJVYWVzOTRlWWlPMDVCNzVHamhhM1ZXczNZZWpM?=
 =?utf-8?B?SHdiY0pYcCtKSWQwMURZYTB4cEZGQXl6eXdMc0c2Y1J3NjJoZjNNY2NIS3pF?=
 =?utf-8?B?L0xLc1RiMFhSbUJGMWVxbVBDWitXWkJTZzA2cUNFRFhDOVJiTzVsZ1RtUmg1?=
 =?utf-8?B?QU9hS1VlTXlRSzVySnRDZzd2K1FFb0FtbDBVYVVKQzViaEo0WUdycFlHMFM0?=
 =?utf-8?B?UlZSVkJuRlgreDlsdFRWOHJZWU1naVNwbDJCeUFsZ29oVExXUU1DWkZFdGZn?=
 =?utf-8?B?a091cFdMaFU1WkYwMHBMcUU0eGQ1QkdnZTRXbmlsZVVWZGc2TEFCWmljRG05?=
 =?utf-8?B?QURhVWpKZVErUVVwWGplbDRXcHNHbkRNZDFSZm9qSlV2b2ZNY05rQ3R1L2lz?=
 =?utf-8?B?VFBZWVlQUWdlcTdONDhsYkxQVlI0M0R5MUZCNVdUNVAvK2NEeWR3OHdwVWg2?=
 =?utf-8?B?ME1OZTFQcG5SdlZNVzlwa3NZb1gzTDhvc3lQY2dhYVptZjR1ckNWNHRLc0xD?=
 =?utf-8?B?REoxK1FaQzEvZWdWZTRyenBNa004YjdsWUVnZlZxVnZVVkx5YzQ4OGJ0ZlRV?=
 =?utf-8?B?YU1IT2s1VkpZTVNFN01BUUVFMXdrYVYwQnBXaHNVKzZJMDNPTlNSVTRlbGta?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 043167de-099b-4a37-be4e-08dc2d923cf2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 19:22:09.5056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kzDdzKYliymZGgd6Nn4xaCtUF3u2O1m5stBOwZzN75aFm3jA0wbHRYhhA/j3DB7Vc6DLf6XTFsSo/FKGiGnpIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8539
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

Quoting Lucas De Marchi (2024-02-09 03:01:26-03:00)
>On Thu, Feb 08, 2024 at 04:29:55PM -0800, Daniele Ceraolo Spurio wrote:
>>
>>
>>On 2/7/2024 12:40 PM, Lucas De Marchi wrote:
>>>On Wed, Feb 07, 2024 at 10:34:07AM -0800, Daniele Ceraolo Spurio wrote:
>>>>
>>>>
>>>>On 2/7/2024 8:42 AM, Lucas De Marchi wrote:
>>>>>+Gustavo who is dealing with DMC firmware lately

Hey, guys. Sorry for being so late for the party...

>>>>>
>>>>>On Wed, Feb 07, 2024 at 03:30:59AM +0000, Matthew Brost wrote:
>>>>>>On Tue, Feb 06, 2024 at 05:18:50PM -0800, John Harrison wrote:
>>>>>>>On 2/6/2024 15:41, Daniele Ceraolo Spurio wrote:
>>>>>>>>Supporting older GuC versions comes with baggage, both on the codin=
g
>>>>>>>>side (due to interfaces only being available from a certain version
>>>>>>>>onwards) and on the testing side (due to having to make=20
>>>>>>>>sure
>>>>>>>the driver
>>>>>>>>works as expected with older GuCs).
>>>>>>>>Since all of our Xe platform are still under force probe, we haven'=
t
>>>>>>>>committed to support any specific GuC version and we therefore don'=
t
>>>>>>>>need to support the older once, which means that we can=20
>>>>>>>>force
>>>>>>>a bottom
>>>>>>>>limit to what GuC we accept. This allows us to remove any=20
>>>>>>>>conditional
>>>>>>>>statements based on older GuC versions and also to approach newer
>>>>>>>>additions knowing that we'll never attempt to load something older
>>>>>>>>than our minimum requirement.
>>>>>>>>
>>>>>>>>RFC: this patch sets the minimum to the current GuC version (70.19)=
,
>>>>>>>>but that can be moved one way or the other. The main aim here is
>>>>>>>Ideally, this would be bumped every time we update Xe to a=20
>>>>>>>newer firmware
>>>>>>>version right up to the point when force probe is lifted. At=20
>>>>>>>that point it
>>>>>>>becomes fixed and we have to add the version check support=20
>>>>>>>back in for
>>>>>>>future w/a's and features.
>>>>>>>
>>>>>>>Get's my vote :).
>>>>>
>>>>>Yeah, but see my other reply... I think we will have to wait the
>>>>>firmware being available in linux-firmware for that.
>>>>>
>>>>>Also, let's kickstart a discussion on our process with some
>>>>>possible changes so we can get it documented. I think we have a good
>>>>>opportunity here to start adopting the
>>>>>https://gitlab.freedesktop.org/drm/firmware repo.
>>>>>
>>>>>Rough idea:
>>>>>
>>>>>1) use intel-staging branch with tags for pull requests to
>>>>>=C2=A0=C2=A0 linux-firmware, just like documented in their readme.
>>>>>=C2=A0=C2=A0 IMO the naming is rather unfortunate since it would be
>>>>>=C2=A0=C2=A0 good to use it for (2) below.... but since it's already u=
sed

Agreed. The <vendor>-staging branches, as proposed in the README, look
more like some sort of <vendor>-next type of branch.

I think it would be good if vendors could have their own `<vendor>/*`
(or `<vendor>-*`) namespace for branch names so that, while having some
common conventions, they could also adapt parts of it to their needs.
For example, we could have branches like intel/next for (1) and intel/ci
for (2). Not sure how easy it is to do this now, though.

>>>>>=C2=A0=C2=A0 we can use something else.
>>>>>
>>>>>=C2=A0=C2=A0 this would mainly replace the use we have today for
>>>>>=C2=A0=C2=A0 https://cgit.freedesktop.org/drm/drm-firmware/ , =C2=A0=
=C2=A0 which=20
>>>>>could be retired. From=C2=A0 upstream linux-firmware pov the only
>>>>>=C2=A0=C2=A0 change would be the remote location and that we start usi=
ng tags
>>>>>=C2=A0=C2=A0 for the pull requests, coming from a single branch regard=
less of
>>>>>=C2=A0=C2=A0 the firmware (guc, huc, dmc, gsc): intel-staging. Once ac=
cepted in
>>>>>=C2=A0=C2=A0 linux-firmware, the branch is fast-forwarded.
>>>>
>>>>I think this needs a bit more fleshing out, because before we do a=20
>>>>pull request, we do want to run CI on the blobs. Also, in several=20
>>>>occasions we went through a couple of versions before we closed on=20
>>>>what to push to linux-firmware (e.g. in the latest push we started=20
>>>>with 70.19.1 but then pushed 70.19.2), so we can't go to=20
>>>>intel-staging until we're actually ready to push. I think the=20
>>>>process you have below for mmp blobs should work for this early=20
>>>>testing flow as well, but we might end up with a lot of noise in=20
>>>>the staging-intel-for-CI branch.
>>>
>>>that would be a throw away branch where we push stuff to be able to test
>>>on CI. I don't think the commit history matters much there. The fact
>>
>>That depends on how CI does things. With the current handling of=20
>>throwaway branches we have on drm-firmware, a CI request can=20
>>accidentally roll back another one. e.g., if we push a throwaway=20
>>branch with a GuC update and then another with a DMC update, the=20
>>second push will roll-back the GuC to what's on the new branch (likely=20
>>the linux-firmware version). That's why there was a suggestion ti use=20
>>a unified branch for CI as well.
>
>not sure we are talking about the same thing. It is a unified branch for
>CI: staging-intel-for-CI is where the mmp +
>about-to-be-upstreamed-for-the-first-time firmware blobs are added,
>regardless if it's guc, dmc, huc, etc. IMO it's much simpler since CI
>basically has to take the additional firmware from this 1 branch. No
>risk of rolling back another firmware because of the new one.

Maybe we are having some confusion here because of the term "throwaway"
for intel-staging-for-ci?

We use throwaway branches for the current process, but I guess
intel-staging-for-ci would not really be a "throwaway" branch per se and
a unified one (as already mentioned above).

I think using intel-staging-for-ci will be okay if teams take the care
of only adding/updating/removing blobs they are responsible for.

>
>>
>>
>>>that the firmware is available to match what is in the kernel and that
>>>there's a documented process for using it in my view trumps the
>>>this downside.
>>>
>>>what I expect would be, considering the LNL case as example:
>>>
>>>1) Start testing with the mmp version:
>>>
>>>=C2=A0=C2=A0=C2=A0=C2=A0a) Add firmware to=C2=A0 drm/firmware intel-stag=
ing-for-CI
>>>=C2=A0=C2=A0=C2=A0=C2=A0b) Add commit in topic/xe-for-CI on the kernel s=
ide to make
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 use of that firmware

How would we check for CI after (b)?

For DMC, I have been doing something similar. Differences are:

  * for (a), I am using an intel-ci branch on drm/drm-firmware and send
    a pull request to intel-gfx so that CI makes the mmp blobs
    available;

  * for (b), I send a "[CI]"-tagged patch to intel-gfx making the kernel
    explicitly use that fully versioned blob path. One advantage here is
    that I keep a broken DMC release from causing CI noise on existing
    unrelated patch series.

>>>
>>>2) Ooops, that has bugs
>>>
>>>=C2=A0=C2=A0=C2=A0=C2=A0a) add a second mmp firmware to drm/firmware int=
el-staging-for-CI
>>>=C2=A0=C2=A0=C2=A0=C2=A0b) replace commit in topic/xe-for-CI on the kern=
el side
>>>
>>>3) we think we are good, let's try for real
>>>
>>>=C2=A0=C2=A0=C2=A0=C2=A0a) Add lnl_guc_70.bin to drm/firmware intel-stag=
ing-for-CI
>>>=C2=A0=C2=A0=C2=A0=C2=A0b) replace commit in topic/xe-for-CI on the kern=
el side
>>>
>>>4) yay, it worked
>>>
>>>=C2=A0=C2=A0=C2=A0=C2=A0a) Add that lnl_gu_70.bin firmware to intel-stag=
ing branch and
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prepare pull request to linux-firmw=
are
>>>=C2=A0=C2=A0=C2=A0=C2=A0b) move patch from topic/xe-for-CI to drm-xe-nex=
t: i.e., rebase
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 topic/xe-for-CI on top of drm-xe-ne=
xt leaving that commit as
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 first one. git push topic/xe-for-CI=
, dim push drm-xe-next (or
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 implement the logic in dim to push =
2 branches)
>>>
>>>=C2=A0=C2=A0=C2=A0=C2=A0We may need some time between (a) and (b) depend=
ing on where we
>>>=C2=A0=C2=A0=C2=A0=C2=A0are on the kernel release cycle: we don't want t=
o submit a
>>>=C2=A0=C2=A0=C2=A0=C2=A0kernel pull request before the firmware is avail=
able @
>>>=C2=A0=C2=A0=C2=A0=C2=A0linux-firmware repo.
>>>
>>>Note that the fact we are using mmp makes it more complex, although
>>>explicit.=C2=A0 Going direct with lnl_gu_70.bin would also work and avoi=
d
>>>updating the commits on the kernel side.
>>
>>This works for a completely new release. For updating an existing=20
>>release, we'll have to push, potentially multiple times, all the=20
>>*_guc_70.bin binaries to intel-staging-for-CI. Just to be clear, I=20
>>have nothing against this, just noting that it would generate a lot of=20
>>noise in that branch and potentially use a lot of space on disk.
>>
>>>
>>>>
>>>>We also need some rules to handle the case where there is already=20
>>>>a PR in flight and we need to push some more blobs. This might be=20
>>>>as easy as the committer seeing that there are commits on top of=20
>>>>master, replying to the previous PR to deprecate it, and then=20
>>>>generating a new PR with all the blobs.
>>>
>>>the pull requests to linux-firmware would come from tags, not a branch.
>>>So you have (tip of the branch is on top):
>>>
>>>=C2=A0=C2=A0=C2=A0=C2=A0o <intel-staging> intel: Add lnl_guc_70.bin
>>>=C2=A0=C2=A0=C2=A0=C2=A0o <refs/tags/intel-2024-01-30> intel: Update dg2=
_guc_70.bin=C2=A0 <--=20
>>>last in flight pull request
>>>=C2=A0=C2=A0=C2=A0=C2=A0o intel: Add lnl_dmc.bin
>>>=C2=A0=C2=A0=C2=A0=C2=A0o <origin/main> ....=C2=A0 <--=C2=A0 where linux=
-firmware is at
>>>
>>>Looking at amd-staging, it seems to match what they are doing:
>>>https://gitlab.freedesktop.org/drm/firmware/-/commits/amd-staging?ref_ty=
pe=3Dheads
>>>
>>>
>>>see the amd-$DATE tags
>>
>>Sorry I wasn't very clear in my comment, what I wanted to point out=20
>>was that if we are on a unified branch and we have the PR against a=20
>>specific tag (intel-2024-01-30 in your example) already in flight, how=20
>>do we generate a new PR for the newer commit that comes after the tag=20
>>(and which will have its own new tag)? Does git do some tag magic and=20
>>handle it for us, or do we need to generate a new PR that supersedes=20
>>the one in flight?
>
>humn... there is no magic, the old tag is an ascendent path of the new
>one. But as I said, just coordinating with the few people updating
>firmware who/when will do the pull request should be sufficient for
>avoiding a pull request when there's already another one in flight.

While I see the benefit of having a unified intel-staging-for-ci, I
think I'm failing to see much benefit of having a unified intel-staging
here.

Wouldn't it be better if pull request were independent of each other? If
we had an intel/* (or intel-*) branching namespace, we could keep using
throwaway branches for the pull requests and have the discipline of
removing them when not needed anymore.

--
Gustavo Sousa

>
>
>>
>>
>>>
>>>>
>>>>
>>>>>
>>>>>2) mmp firmware versions are only ever pushed to a separate=20
>>>>>staging-intel-for-CI
>>>>>=C2=A0=C2=A0 branch. There is no pull request in the mailing for this.=
 We=20
>>>>>can either
>>>>>=C2=A0=C2=A0 push directly to the branch or create MRs in gitlab. CI w=
ould start
>>>>>=C2=A0=C2=A0 using this branch for the extra firmware for platforms in=
stead of
>>>>>=C2=A0=C2=A0 whatever it's using today to process the pull requests fr=
om the
>>>>>=C2=A0=C2=A0 mailing list.=C2=A0 Or whatever it's using, because I don=
't know=20
>>>>>and don't
>>>>>=C2=A0=C2=A0 see it documented anywhere.
>>>>
>>>>As long as the CI team is ok with this, I'm all for it.
>>>>
>>>>>
>>>>>=C2=A0=C2=A0 The patch on the kernel side to use the mmp firmware is o=
nly ever
>>>>>=C2=A0=C2=A0 pushed to the topic/xe-for-CI branch since a) the firmwar=
e is=20
>>>>>coming from
>>>>>=C2=A0=C2=A0 a non-official location and b) end users and distro packa=
ging
>>>>>=C2=A0=C2=A0 shouldn't see a warning when building the kernel due to a=
 possibly
>>>>>=C2=A0=C2=A0 missing firmware
>>>>>3) Raising firmware version requirement for past platforms used as
>>>>>=C2=A0=C2=A0 SDV can be done **unless** it raises the major version.=20
>>>>>That's because
>>>>>=C2=A0=C2=A0 end users would start seeing the warning that we avoided =
in (2).
>>>>
>>>>Who are the end users here? If we're talking about older=20
>>>>non-officially supported platforms, the only users should be=20
>>>>developers and they should be able to handle having to update the=20
>>>>firmwares to a newer major versions.
>>>
>>>distros and any developer outside Intel. The kernel build system is
>>>unaware of xe.force_probe. So if you have, after the several macros:
>>>
>>>MODULE_FIRMWARE("xe/tgl_guc_71.bin")
>>>
>>>It will show up in `modinfo -f firmware xe`. And it will show as a
>>>warning when installing/packaging a kernel.
>>>
>>>It doesn't matter for minor/patch updates because the file name is
>>>major-only and **running** with that module is protected by the
>>>force_probe. The major may be updated when it's available in
>>>linux-firmware, which means i915 started using it (for i915 that would
>>>be "as an option, with fallback to the previous major release" of
>>>course).
>>
>>Ok I get the concern. My assumption here was that we'd only update the=20
>>minimum required version if that version was in linux-firmware even=20
>>for minor updates, hence why I didn't see why a major update would be=20
>>different. I guess we could go with a more relaxed approach where we=20
>>allow the required minor to be updated for force-probe platforms as=20
>>long as the firmware is available on a public/CI branch even if it is=20
>>not in linux-firmware.
>
>yep, I don't see it causing issues to end users.
>
>>
>>Getting back on track with the original purpose of this patch, are you=20
>>ok with setting the minimum to 70.19 if I first push the matching PVC=20
>>70.19 binary (via the old method for now), while we continue sorting=20
>>out how to manage the new repo?
>
>yes.
>
>Lucas De Marchi
>
>>
>>Daniele
>>
>>>
>>>Lucas De Marchi
>>>
>>>>
>>>>Daniele
>>>>
>>>>>
>>>>>thoughts?
>>>>>
>>>>>Lucas De Marchi
>>>>>
>>>>>>>
>>>>>>
>>>>>>Mine too.
>>>>>>
>>>>>>With that:
>>>>>>Acked-by: Matthew Brost <matthew.brost@intel.com>
>>>>>>
>>>>>>>John.
>>>>>>>
>>>>>>>>agreeing to stop supporting very old GuC releases on the=20
>>>>>>>>newer
>>>>>>>driver.
>>>>>>>>
>>>>>>>>Signed-off-by: Daniele Ceraolo Spurio
>>>>>>><daniele.ceraolospurio@intel.com>
>>>>>>>>Cc: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>>>>Cc: Matt Roper <matthew.d.roper@intel.com>
>>>>>>>>Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>>>>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>>>>---
>>>>>>>>=C2=A0=C2=A0 drivers/gpu/drm/xe/xe_guc.c=C2=A0=C2=A0 | 14 ++-------=
-----
>>>>>>>>=C2=A0=C2=A0 drivers/gpu/drm/xe/xe_uc_fw.c | 36
>>>>>>>++++++++++++++---------------------
>>>>>>>>=C2=A0=C2=A0 2 files changed, 16 insertions(+), 34 deletions(-)
>>>>>>>>
>>>>>>>>diff --git a/drivers/gpu/drm/xe/xe_guc.c
>>>>>>>b/drivers/gpu/drm/xe/xe_guc.c
>>>>>>>>index 868208a39829..5e6b27aac495 100644
>>>>>>>>--- a/drivers/gpu/drm/xe/xe_guc.c
>>>>>>>>+++ b/drivers/gpu/drm/xe/xe_guc.c
>>>>>>>>@@ -132,15 +132,10 @@ static u32 guc_ctl_ads_flags(struct
>>>>>>>xe_guc *guc)
>>>>>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return flags;
>>>>>>>>=C2=A0=C2=A0 }
>>>>>>>>-#define GUC_VER(maj, min, pat)=C2=A0=C2=A0=C2=A0 (((maj) << 16) | =
((min)=20
>>>>>>>><<
>>>>>>>8) | (pat))
>>>>>>>>-
>>>>>>>>=C2=A0=C2=A0 static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>>>>>>>>=C2=A0=C2=A0 {
>>>>>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_device *xe =3D guc_t=
o_xe(guc);
>>>>>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_gt *gt =3D guc_to_gt=
(guc);
>>>>>>>>-=C2=A0=C2=A0=C2=A0 struct xe_uc_fw *uc_fw =3D &guc->fw;
>>>>>>>>-=C2=A0=C2=A0=C2=A0 struct xe_uc_fw_version *version =3D
>>>>>>>&uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>>>>>>>>-
>>>>>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 flags =3D 0;
>>>>>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (XE_WA(gt, 22012773006))
>>>>>>>>@@ -170,13 +165,8 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc=
)
>>>>>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (XE_WA(gt, 1509372804))
>>>>>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags =
|=3D GUC_WA_RENDER_RST_RC6_EXIT;
>>>>>>>>-=C2=A0=C2=A0=C2=A0 if (XE_WA(gt, 14018913170)) {
>>>>>>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (GUC_VER(version->ma=
jor, version->minor,
>>>>>>>version->patch) >=3D GUC_VER(70, 7, 0))
>>>>>>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 flags |=3D GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>>>>>>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>>>>>>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 drm_dbg(&xe->drm, "Skip WA 14018913170: GUC
>>>>>>>version expected >=3D 70.7.0, found %u.%u.%u\n",
>>>>>>>>- version->major, version->minor, version->patch);
>>>>>>>>-=C2=A0=C2=A0=C2=A0 }
>>>>>>>>+=C2=A0=C2=A0=C2=A0 if (XE_WA(gt, 14018913170))
>>>>>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags |=3D GUC_WA_ENABL=
E_TSC_CHECK_ON_RC6;
>>>>>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return flags;
>>>>>>>>=C2=A0=C2=A0 }
>>>>>>>>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c
>>>>>>>b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>>>>>>index 4714f2c8d2ba..e5bf59616f3d 100644
>>>>>>>>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>>>>>>>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>>>>>>@@ -296,36 +296,28 @@ static void uc_fw_fini(struct=20
>>>>>>>>drm_device
>>>>>>>*drm, void *arg)
>>>>>>>>xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_SELECTED);
>>>>>>>>=C2=A0=C2=A0 }
>>>>>>>>-static void guc_read_css_info(struct xe_uc_fw *uc_fw,=20
>>>>>>>>struct
>>>>>>>uc_css_header *css)
>>>>>>>>+static int guc_read_css_info(struct xe_uc_fw *uc_fw,=20
>>>>>>>>struct
>>>>>>>uc_css_header *css)
>>>>>>>>=C2=A0=C2=A0 {
>>>>>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_gt *gt =3D uc_fw_to_=
gt(uc_fw);
>>>>>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_uc_fw_version *relea=
se =3D
>>>>>>>&uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>>>>>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_uc_fw_version *compa=
tibility =3D
>>>>>>>&uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
>>>>>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_gt_assert(gt, uc_fw->type =
=3D=3D XE_UC_FW_TYPE_GUC);
>>>>>>>>-=C2=A0=C2=A0=C2=A0 xe_gt_assert(gt, release->major >=3D 70);
>>>>>>>>-
>>>>>>>>-=C2=A0=C2=A0=C2=A0 if (release->major > 70 || release->minor >=3D =
6) {
>>>>>>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* v70.6.0 adds CSS hea=
der support */
>>>>>>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatibility->major =
=3D FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
>>>>>>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 css->submission_version);
>>>>>>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatibility->minor =
=3D FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>>>>>>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 css->submission_version);
>>>>>>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatibility->patch =
=3D FIELD_GET(CSS_SW_VERSION_UC_PATCH,
>>>>>>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 css->submission_version);
>>>>>>>>-=C2=A0=C2=A0=C2=A0 } else if (release->minor >=3D 3) {
>>>>>>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* v70.3.0 introduced v=
1.1.0 */
>>>>>>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatibility->major =
=3D 1;
>>>>>>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatibility->minor =
=3D 1;
>>>>>>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatibility->patch =
=3D 0;
>>>>>>>>-=C2=A0=C2=A0=C2=A0 } else {
>>>>>>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* v70.0.0 introduced v=
1.0.0 */
>>>>>>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatibility->major =
=3D 1;
>>>>>>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatibility->minor =
=3D 0;
>>>>>>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatibility->patch =
=3D 0;
>>>>>>>>+
>>>>>>>>+=C2=A0=C2=A0=C2=A0 /* We don't support GuC releases older than 70.=
19 */
>>>>>>>>+=C2=A0=C2=A0=C2=A0 if (release->major < 70 || (release->major =3D=
=3D 70 &&
>>>>>>>release->minor < 19)) {
>>>>>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_gt_err(gt, "Unsuppor=
ted GuC v%u.%u! v70.19 or
>>>>>>>newer is required\n",
>>>>>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 release->major, release->minor);
>>>>>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>>>>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>>+=C2=A0=C2=A0=C2=A0 compatibility->major =3D=20
>>>>>>>>FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
>>>>>>>css->submission_version);
>>>>>>>>+=C2=A0=C2=A0=C2=A0 compatibility->minor =3D=20
>>>>>>>>FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>>>>>>>css->submission_version);
>>>>>>>>+=C2=A0=C2=A0=C2=A0 compatibility->patch =3D=20
>>>>>>>>FIELD_GET(CSS_SW_VERSION_UC_PATCH,
>>>>>>>css->submission_version);
>>>>>>>>+
>>>>>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uc_fw->private_data_size =3D c=
ss->private_data_size;
>>>>>>>>+
>>>>>>>>+=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>>=C2=A0=C2=A0 }
>>>>>>>>=C2=A0=C2=A0 int xe_uc_fw_check_version_requirements(struct xe_uc_f=
w *uc_fw)
>>>>>>>>@@ -424,7 +416,7 @@ static int parse_css_header(struct
>>>>>>>xe_uc_fw *uc_fw, const void *fw_data, size_t
>>>>>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 release->patch =3D FIELD_GET(C=
SS_SW_VERSION_UC_PATCH,
>>>>>>>css->sw_version);
>>>>>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (uc_fw->type =3D=3D XE_UC_F=
W_TYPE_GUC)
>>>>>>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 guc_read_css_info(uc_fw=
, css);
>>>>>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return guc_read_css_inf=
o(uc_fw, css);
>>>>>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>>=C2=A0=C2=A0 }
>>>>>>>
>>>>
>>
