Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C91D1489F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 06:01:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7552D10E27B;
	Thu,  8 Jan 2026 06:01:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ikvyg6Aq";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010035.outbound.protection.outlook.com [52.101.85.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6649210E68F
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 06:01:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KPcUalMbZJkHtp9A0hm0rxHCXfZm6cCnDbvP/OSYQIGgJ7lmA9VnDJ8KHFt7MyW443BUw+xqbWocwlJkHsifoI4pR3FxwSL6p2INC751f/ysGOcXLACw7TCZR+yc8JA7h49PT8m+gf2R4lCFFIoMreKl9OeVTgfG+gp9kVG/TXy4urD1/NCXTfyB54J+eunpH2vZ15ObgDgMDusYIo1TVkJYNvNobRgjsEsu71Q+bDcK/PS5e1FSRz7/kvGxfDF7BM9oOn/xpMANj4W+AXh7E4eeHA9f68Vppw1+E18HOJ4ns1o9Dp7FFQL4zF/Xe/KUDI62EEX6u04IWqFkw78/Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGiSt0dzN8MeWcxAdvh9hRM3BVCA8pGRDQqpXaEThTI=;
 b=mfhFeBXh04I2O2029nrBE3g8muNCudmSvJZapgs3pxK0Ahd1hSq4CAvcrlZ6rEA5WEViwcUbPQ6z09Lv/NGLThiesSjav0ooHrcP4Sp4GAUQU/OXQMtqAKj3454B9X/RdVN73Dlz2HuBIRKh4HHFVvLMHbANLsm2pPM1M431SPL8IZZMvh1HWB6SxhaJ9IWmCpkdPbXQRowDsSNXfA2sf4iNhBXrrSkcDQ7oZSqNCS8wtUj/yGZ1ghJVz1aGJGRe5BOUACf3D/YYvkKDNoLZX56Y+J4eBZCOQlTSs4j2AcaZEEf3z/cEU3LzkeAjQtAewAM5Gh8o5uNqhqt0OTAT+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGiSt0dzN8MeWcxAdvh9hRM3BVCA8pGRDQqpXaEThTI=;
 b=Ikvyg6AqR26uNDtyPf7CxxrbNDT0rrQtyRW/s27RhJOHtNNwiMONneoIUMZ0DnFOqX+NC1tHjSFXUPgUXLg3MP9Tmcnvz0jFbAvYAvxv0uxLZNTDIWY/WHgebkgBqLmsXEX8aPcHJE1S4KZKsimZ42AFQU7pyE3NWdEX40G98BSJnIEkUJ23rHg7rlGH/cC1aAEzI+S90nsO/vbOqdWBMH4h+42qLswPWA6+PQV2pSvuNEcxoqdoEFj8ILrlFXw23csZzkXsV9YR+13ekwB2EDgRkzB80pi/KjG67FfhJIPyIgbj9NCr5ep94/t9EPBstC9b8r+Mp2FWyI4cHUu+8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Thu, 8 Jan
 2026 06:01:35 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 06:01:35 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [RESENDv2 v2 08/11] mm: Add helpers to create device private entries
 from struct pages
Date: Thu,  8 Jan 2026 17:00:59 +1100
Message-Id: <20260108060102.41357-9-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108060102.41357-1-jniethe@nvidia.com>
References: <20260108060102.41357-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0042.namprd11.prod.outlook.com
 (2603:10b6:a03:80::19) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: 02ad17ab-f813-43fe-43ef-08de4e7b6141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r4AnI3LFnam67R/+LLKuqSUpe188172u86tiNtEwbkjXbJINhzg2WyMpmgo5?=
 =?us-ascii?Q?FznTKU/nBHNR5330RHKSeQAdo7DXKdBJgB8zgDUqfK3WnvgalUOIzfwATv4X?=
 =?us-ascii?Q?u6p69fx0HsuX7LvoXd4LFLoUt4YUMNkTaOBLnbXjea/4Koo3ELVGOHo55Bd/?=
 =?us-ascii?Q?yyWBMkIOn9Y/lOKUhJFrRS3UvTkS8bXqaOVbZ+R88CseACn+RxE3JhzIfd13?=
 =?us-ascii?Q?6GIvWhasrKJZ6u6gRUnrbnPQZuU6SXS43C29sYwsK/FXoDHL836qh8TkY7PN?=
 =?us-ascii?Q?01ir0fhs9CkUC+aajANgPsuFlXay6d44juEjIb2weC9nlMSwoYRnaz+xCGky?=
 =?us-ascii?Q?hEZyq3imw7bN9e1abP5/cceJUITxP4d4ub9TnNQ595k1lpHWtduzey1+zYIo?=
 =?us-ascii?Q?3kTVCA5ZWxPvg61zjsdqulwf7SjqtuR88K2KDwVV6U8ZvE2GY+xqG2VBMGRd?=
 =?us-ascii?Q?cwmiLcyRnLOjEI9BVkm8RCIvHOUiJukDbxevp2Dg1HdWGW95mr7cLGVgt3+i?=
 =?us-ascii?Q?GnukBBE2L+yElFuVqH8CxGF9/S1YvP2TeN6DCL0PkHZPqCjiTQHZyHuBzdjw?=
 =?us-ascii?Q?yLLvFMinx7XqCIEcML5H+7iC8ReCXk3LBFLqcugtYz7YXa86lGzU8gDmqow7?=
 =?us-ascii?Q?WbJFtf1eikWsY4BDpmJefcptLEaFGLilODB7NpgtbxHc/Ls3gJKtHydNIjhC?=
 =?us-ascii?Q?bsirafvo+Qv9QG+b+ZBm8py5QqsOhq4K/pLWMxLL6PkcFzRYYoUDaVfqumJa?=
 =?us-ascii?Q?v1TEBVvV9oPac2vTYDPQdGBa9S+ivsF6bffqzyed4z6FqI/QDYBtgCGrZpVd?=
 =?us-ascii?Q?JXVet888gFZegkrMkfUlZcy8cfWbch4wNl2n6kb5DdjnvuyR/ypS3g8Fdtha?=
 =?us-ascii?Q?YjR5P9yYRYiTcxuEGu/IEBFg3Km0VzK71PHfgzODhxfM+iJqNDM+YFZbMpaQ?=
 =?us-ascii?Q?VvlQzzhqk5ahSngrb3dwo+7gMb5qb7betTeRTdmWT7C1dCNRdBTV6UWmD4E4?=
 =?us-ascii?Q?FkKcmdtUzJu19Q12SiV2vO4QG1DsLMRuhZiUntRA2VjdrFIxAB11T6ZEMNWX?=
 =?us-ascii?Q?5eY6oF5FXtGxA/mxhFCq2GP2YsAbZv9QHzA03daKCDR6kgD8ZlH5N0x4DD4+?=
 =?us-ascii?Q?lpQVowZHHB2XauzaH9a3zfxlSHxk3PlPFdq7e8WNguCNexh6fy9p28C6VoU6?=
 =?us-ascii?Q?yAFfcI2VuhzK44uDgVktZcj1OgBbj3ww87EKtVpLVzI1N6xwcROHcASjZgdM?=
 =?us-ascii?Q?yb0G+fRaE2swKloLPPEV0AAHJRTcR17jbrHvMg9nmvsvGbKzbzoNtMle12pM?=
 =?us-ascii?Q?ieO4eGklvU9etejlSkPkQEXtuyS6RxV7yA5S8BsQVEYw8ILABA9kDZ0zkCwO?=
 =?us-ascii?Q?09pFDspH5BnMOx7Iccbfr68cF/bdzsHfIFR63c24gGXalRzTuJRCdBZ7/HAd?=
 =?us-ascii?Q?Z9D9J0oS3MUmTwBHq/1VoKG3zYR6Tj1o?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aRJEgdk5YqPrEgfDOFRjwxvthEejw0gAWiERsKTGGHK1AusB4wyspZE5isn5?=
 =?us-ascii?Q?2rd2pfZ8SjZ7xGuE9ubFVJ1qoma4/V7wUrjQKahuPJuEd/8M12TPYCavT8Ek?=
 =?us-ascii?Q?ppuYGQpbeXKI6hvhkjQGyT1rIvs8YL2S9tx2lTVlRhF2RY9IRS6iAEOeQ7Gl?=
 =?us-ascii?Q?ZrLeFphQ5H0/KUGV7giqRssM1nzhhsMgIQ6uK+OwzAN+ytOF41LWuBqJz09h?=
 =?us-ascii?Q?ly10NwDhtDxDfOmiGDlJLBXkbDM6Ze6eLzQpFpxluD+9qyMffdMgKPIrYioa?=
 =?us-ascii?Q?ovc0OE0549aeL86Uaq12AXThEXJAJqR6Lb42WjgjUCi9QaioP6Ud83bGsiDS?=
 =?us-ascii?Q?X0BwEDpFJxjYMOWPcOdtt1VF0dI2aPhIgg2kzz5OxeRPkrYq6xFbQcdFmu2C?=
 =?us-ascii?Q?Pbka7R0IPeFqhBUaOcTnKLPlhOk+RKXsRgPcvU3YuJ6GvF3BzcrNHQ/B48gK?=
 =?us-ascii?Q?G0KjJZjfflwK0GIzMuVU6ZWSkFVTMDhH1rZio+ZiD7AZWsX/fSILog6kLKme?=
 =?us-ascii?Q?Y2CznL9bXr3PsYna7nkTJkDChOH40vbuC4cwW+GLn+Z71CnowGvRpmjDG+LJ?=
 =?us-ascii?Q?6IMQrIL05kR8lbXVYdfGxlmq9kyMpjxdOB5bvGTHycFzNREs3imWs2yCYovs?=
 =?us-ascii?Q?v8uJTcbVHyNxuXKUi7rfbmjFqtX+gEduzpiwn/6uNghVX7y3Kb1chKDPBoL1?=
 =?us-ascii?Q?JG2xNIzCZPxziD97p1KzfT3rjcZ+bo51nauePT5dElq8sFc0nl+L1j1heZdg?=
 =?us-ascii?Q?YD3rIuNqzw0hunAHlVQsFGrCc3Pb1zM3yoXrn+hnjDm0xJ0h5gwwryr4UN1o?=
 =?us-ascii?Q?LHHjj1FUDru6EjeSbNwe0OuWZ+L2O2Y3UuDHJ+48FFcvEr87ilFJthHuT7Ph?=
 =?us-ascii?Q?Q4FviOUEBzmg/hx8kVL5D5MmoZXTimJa8PM5lNrW3KebBStojVn+Zia9oVAw?=
 =?us-ascii?Q?x4gsG6XjFbOqC369WIWpumpLlGsccacIiMoqSO7OM35HH5qrWjyQiIMZTFrS?=
 =?us-ascii?Q?Fn9avHU9NJJjUDCCJ0C3WnO+yl4sju7ProzX5dRFLgkIVm0J07pUZLcwJ8o4?=
 =?us-ascii?Q?7ok3vjQ61sRS0DX9duvBYttA/WvBtA6/hJypA+cxPMeT8zmNBp9yp+niZ9PR?=
 =?us-ascii?Q?J9cC7RFIQHxqm5rCwN1tmj2ZMb4c/CZPpz+jveJ3bbtSZa44FIsj2iqvsIrc?=
 =?us-ascii?Q?VuhqiFZ173fv4S7lPafgYV6T+uHhUYQ7EmYDQZOavM11H93onb/Nef07m0Qz?=
 =?us-ascii?Q?hqw43fGlNZii8fS7ZDwiXewjV8sp2InuC01dD2+pdLjRT7irHXKieyrl/G4x?=
 =?us-ascii?Q?qjarpYqADum/ICxxrV80nZqcFCPdT/FysIaWiNuii77DzHEfn55vnqyUaXl/?=
 =?us-ascii?Q?Mf8UnatRRuUlWW7AyOeHzB/axTK1nTYAA/p86QtzekF7fROMDh7igXLpvV5D?=
 =?us-ascii?Q?2bZtGN0VI3tkVIMNNHipWZUiAqXpgUIGAra5/XrqAF2Vttjen00t51OBVUce?=
 =?us-ascii?Q?JMJsXCo+0SGEpdJgSJGCUoLZavHc/ZFUGZiPZ7ow6VSLiBX4d54JhviD2bfq?=
 =?us-ascii?Q?WxV3+G5yvX/kJvPF4HWazZCb2eopgjTe0MQ74x2Hx2o8HXvvA/N88N9JiQKa?=
 =?us-ascii?Q?Ao3RxCzi1Yg/TW+19F63XbomiaRiJ+O0rClghe9m3t8gEBndEwjl95A7bHLA?=
 =?us-ascii?Q?1zo1ToUFVXy9b6WHuGdzpE+HQlx2+0xNweh/KG33Z3J8g4Wz2o9ehL9ktV+W?=
 =?us-ascii?Q?Vy96yHN6MA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ad17ab-f813-43fe-43ef-08de4e7b6141
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 06:01:35.4193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IMUQvP6/s7RlNjQWlDo285shEH0VS7UvOhMVRHMM+UabM+G51C3jHrIC89/Zwl03CvEdwkQKgeyenLtfwAiGjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6618
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

To create a new device private entry for a given struct page, that page
is first converted to its pfn, before passing the pfn to
make_writable_device_private_entry() (and friends).

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have a
pfn and must be handled separately.

Prepare for this with a new set of helpers:

- make_readable_device_private_entry_from_page()
- make_writable_device_private_entry_from_page()

These helpers take a struct page as parameter instead of a pfn. This
will allow more flexibility for handling the swap offset field
differently for device private pages.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
 include/linux/swapops.h | 24 ++++++++++++++++++++++++
 mm/huge_memory.c        | 14 ++++++--------
 mm/migrate.c            |  6 ++----
 mm/migrate_device.c     | 12 ++++--------
 4 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index bae76d3831fb..f7d85a451a2b 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -138,11 +138,23 @@ static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
 	return swp_entry(SWP_DEVICE_READ, offset);
 }
 
+static inline swp_entry_t make_readable_device_private_entry_from_page(struct page *page,
+								       pgoff_t flags)
+{
+	return swp_entry(SWP_DEVICE_READ, page_to_pfn(page) | flags);
+}
+
 static inline swp_entry_t make_writable_device_private_entry(pgoff_t offset)
 {
 	return swp_entry(SWP_DEVICE_WRITE, offset);
 }
 
+static inline swp_entry_t make_writable_device_private_entry_from_page(struct page *page,
+								       pgoff_t flags)
+{
+	return swp_entry(SWP_DEVICE_WRITE, page_to_pfn(page) | flags);
+}
+
 static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 {
 	return swp_entry(SWP_DEVICE_EXCLUSIVE, offset);
@@ -191,11 +203,23 @@ static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_readable_device_private_entry_from_page(struct page *page,
+								       pgoff_t flags)
+{
+	return swp_entry(0, 0);
+}
+
 static inline swp_entry_t make_writable_device_private_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_writable_device_private_entry_from_page(struct page *page,
+								       pgoff_t flags)
+{
+	return swp_entry(0, 0);
+}
+
 static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index e3a448cdb34d..03f1f13bb24c 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3219,11 +3219,11 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 			 * is false.
 			 */
 			if (write)
-				swp_entry = make_writable_device_private_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_writable_device_private_entry_from_page(
+							page + i, 0);
 			else
-				swp_entry = make_readable_device_private_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_readable_device_private_entry_from_page(
+							page + i, 0);
 			/*
 			 * Young and dirty bits are not progated via swp_entry
 			 */
@@ -4950,11 +4950,9 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
 		swp_entry_t entry;
 
 		if (pmd_write(pmde))
-			entry = make_writable_device_private_entry(
-							page_to_pfn(new));
+			entry = make_writable_device_private_entry_from_page(new, 0);
 		else
-			entry = make_readable_device_private_entry(
-							page_to_pfn(new));
+			entry = make_readable_device_private_entry_from_page(new, 0);
 		pmde = swp_entry_to_pmd(entry);
 
 		if (pmd_swp_soft_dirty(*pvmw->pmd))
diff --git a/mm/migrate.c b/mm/migrate.c
index 5169f9717f60..6cc6c989ab6b 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -399,11 +399,9 @@ static bool remove_migration_pte(struct folio *folio,
 
 		if (unlikely(is_device_private_page(new))) {
 			if (pte_write(pte))
-				entry = make_writable_device_private_entry(
-							page_to_pfn(new));
+				entry = make_writable_device_private_entry_from_page(new, 0);
 			else
-				entry = make_readable_device_private_entry(
-							page_to_pfn(new));
+				entry = make_readable_device_private_entry_from_page(new, 0);
 			pte = softleaf_to_pte(entry);
 			if (pte_swp_soft_dirty(old_pte))
 				pte = pte_swp_mksoft_dirty(pte);
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index c876526ac6a3..0ca6f78df0e2 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -836,11 +836,9 @@ static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
 		swp_entry_t swp_entry;
 
 		if (vma->vm_flags & VM_WRITE)
-			swp_entry = make_writable_device_private_entry(
-						page_to_pfn(page));
+			swp_entry = make_writable_device_private_entry_from_page(page, 0);
 		else
-			swp_entry = make_readable_device_private_entry(
-						page_to_pfn(page));
+			swp_entry = make_readable_device_private_entry_from_page(page, 0);
 		entry = swp_entry_to_pmd(swp_entry);
 	} else {
 		if (folio_is_zone_device(folio) &&
@@ -1033,11 +1031,9 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 		swp_entry_t swp_entry;
 
 		if (vma->vm_flags & VM_WRITE)
-			swp_entry = make_writable_device_private_entry(
-						page_to_pfn(page));
+			swp_entry = make_writable_device_private_entry_from_page(page, 0);
 		else
-			swp_entry = make_readable_device_private_entry(
-						page_to_pfn(page));
+			swp_entry = make_readable_device_private_entry_from_page(page, 0);
 		entry = swp_entry_to_pte(swp_entry);
 	} else {
 		if (folio_is_zone_device(folio) &&
-- 
2.34.1

