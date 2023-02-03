Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990AAC05027
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:18:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796A010E0A4;
	Fri,  3 Feb 2023 20:18:21 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2537710E0A4
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675455500; x=1706991500;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bQMyx+hFUwvzVKERkzpDEaI9SkqbbTsWIehY/tYt4Lc=;
 b=GXOJz4b939rUONufJjgIDPUYjFJVq+NVjGWEZOQ3oaDurOCmqAVVuKkk
 U3oyoWoLM3rdLLCUcriDoHIMlzGm43gwcafuKvwHktyyxiOu4gzRZA8AJ
 dkTvlJsnyMneJ4WZqczwO+N7o7r/K9B5qJgCTVqDJv8xClrX0XfQFccHa
 ou9gSm6ZILd2cNWldkTWd53i2DUG+PlJJOXq6Jh9PjVDd01OvjaRLmXyb
 VOBY5x5tPQpz4XiTZt7UqQKfHoOOA3GQUczCFqeJ1k2SaWUvCF7m3hGsd
 Tk6uW/zmLuwqjBK1QLBKJKBEfdN+DD6ylPaPIOj5xABEopTNLWyWHCTA1 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="328861893"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="328861893"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:18:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="994630136"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="994630136"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 03 Feb 2023 12:18:15 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:18:15 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:18:14 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:18:14 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:18:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jE74c+6GuTsDb+YPumgfUDATTgDe9dq+KsUf2QwpVnDtY7Czrl9NhzaMJxV4VonaH5VkJt0GgGWJmu1vheFAHrT2qcrb7zpjezrzRYYF/yE6cuK+H2/g1BopbXkHbAipEIcMcjWKC1/9ZaZlMAeia7eWRDGzHposTkZcrn5Y+sKHurB/lFl02N6s5o4T0Fy8BBDq4Nbk3LU+AxNmR34uTMFpaO4Gv4qQOC5UfmZ0hO7WMcsZNWDmaL4rYvcnuPiGYgVVeP6wUvVEMf+iUxbM6eQoIHLl2cGRFQsXZDcpC4mTlf7baDH8c6vnHiR2+tRnE/0J9M8ekbD20e8rR6pRXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CGaRbzgrBOLdm0zgjeOMUxA7zlZBF0aBeB4x7DOOdZs=;
 b=UmuG2f5QsCl+Ob339rGAdpI3TC0RpPsK9KiDbKhEvJHhGudGeqOIGpqvTuuMF8L9g6YDwJAgXHTGtwacz3YCAvqfQXbwYf+k3xyytQdY2CNYqYZVDpUVwX/2bBHCTXpV5fmssBNWyVXMvTGWbh308AzW9GBjdfR2PuzthET/iJvT88XnQR88oBQmRrVpxR/p8jxIYa+Z+fR7xNbfGaIv1KbDDrgkOoSaPrnehEkXQGF94sz0IPRkFsm5QT/xtdqbQ7fxuhUC+v06TLrhquUvJ5fkiYao7KxLxjL+CqpciW1TPJPjj35HqklRx45nV0D9QwcXwhhzUIOLjWL8AfqJKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5706.namprd11.prod.outlook.com (2603:10b6:610:ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.29; Fri, 3 Feb
 2023 20:18:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:18:12 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:17:56 -0500
Message-ID: <20230203201758.573775-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203201758.573775-1-rodrigo.vivi@intel.com>
References: <20230203201758.573775-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5706:EE_
X-MS-Office365-Filtering-Correlation-Id: 889a480b-29dd-4cbe-b572-08db0623c666
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zRKSW0V3J7ohwEHPgLZgi7oPGDcvDW0KxXk8xd0FHlylof5eybnb+2duBFA2f4mveW7UtPrI+7Jont4j5DmkOT5nMfZM414IEOl7O+dBHbQ2CtFbReyBz1NU4PHqBQ1/xLtjSof1byRotMlbRHbPiumgxdVmT3hmHGpWCWLWYpRyWBUjer6X0acY2/S85Qq9ybHV+Gq8K1cAcjd4k7jNGfdV2Rnuyj+UnJ8Io16OXTAO0DGOUOQmDht7Y6WzEe1gyL8liErQgoTX19yu8ZZr0iX5nAy+JaIwR4YJ14w9Mq/IBMgEHGCy0MwhtI738UX8X8OWQOZ4DBIh6JfpuL9fOQz5nxDMFQJHUurNsBb+EoWoS6+T6RIWsEbs880K/a4pGiarLjRCQzP/9kGykL3LAajcPMLFNxnW7q50XQJNAffUMiAgIh3IMSKrRxY/jtdBqlYtlVPvafCi0gO73SgYcuq9PwAIz5YSFLKYrCT1Tif2UjmbqwGctCuYLJeTFUFVoDv9hJqjri7F4GHBluewmxwWkGXvsMSLCR/uDOmAhcL7TzIth3OOCvJwjDjZlbIzQD8rKk2boIT9ji3PXJ9Tb8iRhWGCLPhfThKz7riKyXUQtn2+h0KHGKetFrKwXc+mw50fzp4ccThRtSsYzUwdtw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(136003)(346002)(366004)(39860400002)(451199018)(6486002)(6666004)(107886003)(66946007)(66476007)(2616005)(8676002)(8936002)(6916009)(4326008)(66556008)(6506007)(5660300002)(41300700001)(1076003)(44832011)(36756003)(2906002)(26005)(83380400001)(186003)(478600001)(6512007)(86362001)(54906003)(316002)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OExmWkVzaFdCZkN1TW5QaGlRSW8vVmtBc2gwUWtONm9Rd1ZaZ1ljVXNTRlM3?=
 =?utf-8?B?ekpGRmxnSmZGRXdTUXYrY3FzV3Z1ZFAxWU5PNm45VXpoLzVEdXRScmdLUXFG?=
 =?utf-8?B?WWNWYlhUUFZ5T0JhUDBZeVlVL05DZVNzV0Erb0hvQzlPNnJ2Q3RNNVZ6N0Nh?=
 =?utf-8?B?cWxwRnRsMlpPOVpld3BKeDBpMXJvQythLzlUOXJSTEtaWDVMN0w3S2VmeFg0?=
 =?utf-8?B?dm9wZnRMRktrQmF5T1VvYi9OM3psdnpIT0I2djF4eUwwbnZqYm00WkhuVW1T?=
 =?utf-8?B?bWJpcTRYbWZQVXJxV3IwOG9iamhFUDJySDF1c3pDenhNZk5oQWtvRVl6WEFK?=
 =?utf-8?B?c0tmZzBUdktYdUR1RDF5dzk5Vk56UEZHUCtlTURZTHRjVXlnYy91VmhuNnNT?=
 =?utf-8?B?OUR3eTVBUUVjL3lsNUw3VGJOQnFVbWZaSEJFZkw3NjhJSkF5MHJHWDN4Sm5s?=
 =?utf-8?B?Tm9SWEYxVjlKMXBuQnFNQnpHY0FXUnNsV2Y5ZXNpV2tqbUx3R0gwa2tSS09Q?=
 =?utf-8?B?S28zSVN4UTdSSDVhQkwvODlPZ2Ixekw2cXBYUmpwOUVIOGhvU2VoYkthVk1s?=
 =?utf-8?B?bEpqdFdhTW1MR1VwM2pJN1VnajdpNVJkZk5xTnRxMzQ4S3RrbHJvVXRSOTB4?=
 =?utf-8?B?NnlMYjd2L1hRUnhVWFB0Y1Voc0VFSEVxK21xa0g0TkxsK2pMMjNpNHg1akVL?=
 =?utf-8?B?MGlmdTlRb2VSTGhsZUtGZnNsNktsMjlNbTdkYmxIK25UQXpra29URUt3Rzhr?=
 =?utf-8?B?TUNvdm9QV0JrYWpKSmVmWG95NkdwUy8yYlhnamVEKzRyU2dsNkg2UjJFSFE0?=
 =?utf-8?B?OUtzbStrNEVLZzU4c1hsQWd4TytmZkhtVWY5REZBRXQya01JZk5KcExnUHFE?=
 =?utf-8?B?SFY4di9yNWlLQmtsYk1QWkRPMi8yNkZnMDIwVWllUEVjOXVxVTNRSVVxK2Jh?=
 =?utf-8?B?ZE50Q1B2elR6RDkzUFVtcXpoR3Izd3BGaUxlNStVVzZxSGhZeUxxUkFRQ3hG?=
 =?utf-8?B?RmI0eUlnRlB5dStMUWltQTg2cC81N25HTGwzRHBFWGhwbjNjNXo3aFkrQW9H?=
 =?utf-8?B?aTZHL0QyR2YyTmhtc003cHdmNUVrallFUUJMSVJmSmlNTTFIQ05FUWU1dVBD?=
 =?utf-8?B?WE81NjRiWjdoeVNSeUVML2ZOWFhuTHh1SEJYaFJVclQ2amRQSzBPOWhKMHpm?=
 =?utf-8?B?OTZXdGtISW9qMHdQM3Y5YXBvalZ4azRzclR0VWNMU29jZWp3YzhmcHR4WE00?=
 =?utf-8?B?LzBKc3J0RkJDVVFyREZwdVEwa0hRUVpVRTRDRmJ4L2VaS3FSZ2YyWUNBSmkr?=
 =?utf-8?B?NmZrTUkraUpZMHNtdzliVkVnNklOWTBWWVVzSkhEcjFhM2xxVzVlQkNsc1hO?=
 =?utf-8?B?TStNRmlrMSsxM2owM055b0loVk1lUDVnb01sNUVOeHowY25saGd4ekFIZGFT?=
 =?utf-8?B?UGtCcWpsY1F4amFsMHd0cjZYT1hXbkY2NVJBbnBmb2ltbEpQRnh5cTQyNDBp?=
 =?utf-8?B?WTZTUlU0dis0NkV0dFROR2FMcHZ5MjRaM1BLY3owNitkdSszMVdMM0ErVFAv?=
 =?utf-8?B?ZVNjMFNNWVc4N0xsT2tSSy84VFdvVE44aU1JcnZjZURGQ09ReVJZUURVMzI2?=
 =?utf-8?B?ZDNpQWhtOTF1aFI1SkcrYmd5M2xmTC9CRzg1L3FTL2xCaWk4Tm45VG9qZFRC?=
 =?utf-8?B?T01jYzRTRFNmQUZKVlZMOHE1Qm9CQkd4eStUQjhXUFVXc3d4RmxHelNqcWFD?=
 =?utf-8?B?UFFrVHlKbkt5TFVpeWUwN3loOWVqOGZIMC90dzdHZkZoRi9ZNm5PaGQ2NklS?=
 =?utf-8?B?b1ZDZFZBNkhVRko0YThUc2xKSC9lYU50clZsSmFRRXp1NHNRS0d4SXpwZkJV?=
 =?utf-8?B?cTYvRGFuajRHYlZybGhzRU5zLzFIUXhKWk12NGdaMHNFUnFQYmF4QzdKUkFH?=
 =?utf-8?B?OVpoYkQxNG9pR25wQjBqRThXd09TdS9iTkxMNS9aRzFUR3hqOUE4d3FSeDZj?=
 =?utf-8?B?ZTdNSHBMaVlINkJsZEx5VklIWGJNTlU3UXphclpOTnZ6NWNqL1VNVndTd3JO?=
 =?utf-8?B?ajI5Z0k3T2RaT0dnSDFGNUIvN0E4czl1S212YWtWT0NpV2JkNjduMWxwR1h2?=
 =?utf-8?B?aGRld0gwTzF4dnlNRzlxMU1aTFlxVXVNU1o1dk5TMXdFRWhCck9JRmw2NEhJ?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 889a480b-29dd-4cbe-b572-08db0623c666
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:18:12.8735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21HLeBh68aWnpt0EpT1VOUUZLvgZacoI4IJOvKmLctNVfNwuBB6pNHng7bHSFi8pO/gtWyftdanz6T9QAENe+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5706
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 2/4] drm/xe: fix XE_DISPLAY dependency on ACPI
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Philippe Lecluse <philippe.lecluse@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Trying to run KUnit without passing arch currently fails with:

$ ./tools/testing/kunit/kunit.py run  --kunitconfig drivers/gpu/drm/xe/.kunitconfig
[10:42:07] Configuring KUnit Kernel ...
[10:42:07] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=8
ERROR:root:../drivers/gpu/drm/xe/display/intel_acpi.c: In function ‘intel_dsm_platform_mux_info’:
../drivers/gpu/drm/xe/display/intel_acpi.c:86:15: error: implicit declaration of function ‘acpi_evaluate_dsm_typed’; did you mean ‘acpi_evaluate_dsm’? [-Werror=implicit-function-declaration]
   86 |         pkg = acpi_evaluate_dsm_typed(dhandle, &intel_dsm_guid,
      |               ^~~~~~~~~~~~~~~~~~~~~~~
      |               acpi_evaluate_dsm
../drivers/gpu/drm/xe/display/intel_acpi.c:86:13: warning: assignment to ‘union acpi_object *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
   86 |         pkg = acpi_evaluate_dsm_typed(dhandle, &intel_dsm_guid,
      |             ^
../drivers/gpu/drm/xe/display/intel_acpi.c: In function ‘intel_dsm_pci_probe’:
../drivers/gpu/drm/xe/display/intel_acpi.c:142:14: error: implicit declaration of function ‘acpi_check_dsm’; did you mean ‘acpi_check_region’? [-Werror=implicit-function-declaration]
  142 |         if (!acpi_check_dsm(dhandle, &intel_dsm_guid, INTEL_DSM_REVISION_ID,
      |              ^~~~~~~~~~~~~~
      |              acpi_check_region
../drivers/gpu/drm/xe/display/intel_acpi.c: At top level:
../drivers/gpu/drm/xe/display/intel_acpi.c:176:6: error: redefinition of ‘intel_register_dsm_handler’
  176 | void intel_register_dsm_handler(void)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/display/intel_acpi.c:13:
../drivers/gpu/drm/xe/display/intel_acpi.h:19:20: note: previous definition of ‘intel_register_dsm_handler’ with type ‘void(void)’
   19 | static inline void intel_register_dsm_handler(void) { return; }
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_acpi.c:182:6: error: redefinition of ‘intel_unregister_dsm_handler’
  182 | void intel_unregister_dsm_handler(void)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_acpi.h:20:20: note: previous definition of ‘intel_unregister_dsm_handler’ with type ‘void(void)’
   20 | static inline void intel_unregister_dsm_handler(void) { return; }
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_acpi.c:186:6: error: redefinition of ‘intel_dsm_get_bios_data_funcs_supported’
  186 | void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_acpi.h:22:6: note: previous definition of ‘intel_dsm_get_bios_data_funcs_supported’ with type ‘void(struct xe_device *)’
   22 | void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915) { return; }
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_acpi.c: In function ‘intel_dsm_get_bios_data_funcs_supported’:
../drivers/gpu/drm/xe/display/intel_acpi.c:199:31: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
  199 |                 ACPI_FREE(obj);
      |                               ^
../drivers/gpu/drm/xe/display/intel_acpi.c:188:25: warning: unused variable ‘pdev’ [-Wunused-variable]
  188 |         struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
      |                         ^~~~
../drivers/gpu/drm/xe/display/intel_acpi.c: At top level:
../drivers/gpu/drm/xe/display/intel_acpi.c:266:6: error: redefinition of ‘intel_acpi_device_id_update’
  266 | void intel_acpi_device_id_update(struct drm_i915_private *dev_priv)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_acpi.h:24:6: note: previous definition of ‘intel_acpi_device_id_update’ with type ‘void(struct xe_device *)’
   24 | void intel_acpi_device_id_update(struct drm_i915_private *i915) { return; }
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_acpi.c:291:6: error: redefinition of ‘intel_acpi_assign_connector_fwnodes’
  291 | void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_acpi.h:26:6: note: previous definition of ‘intel_acpi_assign_connector_fwnodes’ with type ‘void(struct xe_device *)’
   26 | void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915) { return; }
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_acpi.c: In function ‘intel_acpi_assign_connector_fwnodes’:
../drivers/gpu/drm/xe/display/intel_acpi.c:314:32: error: implicit declaration of function ‘acpi_find_child_device’; did you mean ‘acpi_match_device’? [-Werror=implicit-function-declaration]
  314 |                         adev = acpi_find_child_device(ACPI_COMPANION(drm_dev->dev),
      |                                ^~~~~~~~~~~~~~~~~~~~~~
      |                                acpi_match_device
../drivers/gpu/drm/xe/display/intel_acpi.c:314:30: warning: assignment to ‘struct acpi_device *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
  314 |                         adev = acpi_find_child_device(ACPI_COMPANION(drm_dev->dev),
      |                              ^
../drivers/gpu/drm/xe/display/intel_acpi.c: At top level:
../drivers/gpu/drm/xe/display/intel_acpi.c:336:6: error: redefinition of ‘intel_acpi_video_register’
  336 | void intel_acpi_video_register(struct drm_i915_private *i915)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_acpi.h:28:6: note: previous definition of ‘intel_acpi_video_register’ with type ‘void(struct xe_device *)’
   28 | void intel_acpi_video_register(struct drm_i915_private *i915) { return; }
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~

The reason is that XE_DISPLAY depends on ACPI. This issue may
also manifest on other randconfig, so fix the dependencies.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Philippe Lecluse <philippe.lecluse@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.debug | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index 6726caa63acc..6f7123e90563 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -99,6 +99,7 @@ config DRM_XE_USERPTR_INVAL_INJECT
 config DRM_XE_DISPLAY
 	bool "Enable display support"
 	depends on DRM_XE && EXPERT
+	depends on ACPI
 	default y
 	help
 	  Disable this option only if you want to compile out display support.
-- 
2.39.1

